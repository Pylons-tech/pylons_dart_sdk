/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.
library pylons_flutter_impl;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/features/data/models/transaction.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_constants.dart';
import 'package:pylons_flutter/src/generated/cosmos/tx/v1beta1/tx.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/cookbook.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/item.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/payment_info.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/trade.pb.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_flutter/src/pylons_wallet_comm_util.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

import '../core/constants/strings.dart';

/// The Pylons class is the main endpoint developers use for structured,
/// high-level interactions with the Pylons wallet.
class PylonsWalletImpl implements PylonsWallet {
  late StreamSubscription _sub;

  final String host;
  final UniLinksPlatform uniLink;

  PylonsWalletImpl({required this.host, required this.uniLink}) {
    // // Attach a listener to the stream
    _sub = uniLink.linkStream.listen((String? link) {
      if (link == null) {
        return;
      }

      handleLink(link);
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      _sub.cancel();
    });

    // startIPC();
  }

  Future<void> handleLink(String link) async {
    log(link, name: '[IPCEngine : handleLink]');

    final getMessage = link.split('/').last;

    SDKIPCResponse sdkipcResponse;

    try {
      sdkipcResponse = SDKIPCResponse.fromIPCMessage(getMessage);

      IPCHandlerFactory.getHandler(sdkipcResponse);
    } catch (e) {
      print('Something went wrong in parsing');
      return;
    }
  }

  /// Async: Send the provided message over the IPC channel, then retrieve a
  /// response.
  ///
  /// [msg] is a list of strings which are converted to base64 and combined
  /// to form a single comma-separated string before being sent over the
  /// channel.
  ///
  /// The string that is eventually retrieved as a response fits the same
  /// format.
  @override
  Future<String> sendMessage(List<String> msg) {
    // Append the host to the msg
    msg.insert(0, getHostBasedOnOS(Platform.isAndroid));

    var encodedMessage = encodeMessage(msg);
    dispatchUniLink('$BASE_UNI_LINK/$encodedMessage');
    var completer = Completer<String>();
    return completer.future;
  }

  /// Async: Send the provided message over the IPC channel, then retrieve a
  /// response.
  ///
  /// [msg] is a list of strings which are converted to base64 and combined
  /// to form a single comma-separated string before being sent over the
  /// channel.
  ///
  /// The string that is eventually retrieved as a response fits the same
  /// format.
  Future<SDKIPCResponse> sendMessageNew(SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse> completer) {
    var encodedMessage = sdkipcMessage.createMessage();

    var universalLink = createLinkBasedOnOS(encodedMessage: encodedMessage, isAndroid: Platform.isAndroid);
    print(universalLink);
    dispatchUniLink(universalLink);
    return completer.future;
  }

  /// Async: Retrieves all cookbooks belonging to the current profile on the
  /// Pylons chain.
  ///
  /// Returns a [List]<[Cookbook]> containing the retrieved cookbooks. This will
  /// ordinarily be "successful" even if there are no cookbooks to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// cookbooks are not retrieved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [NodeInternalErrorException] : The node threw an unexpected error when
  /// handling the query. This should not occur in production environments.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// [ResponseException] : After sending the message to the wallet, the
  /// received response does not fit the expected format.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<List<Cookbook>> getCookbooks() async {
    return Future<List<Cookbook>>.sync(() async {
      var key = Strings.GET_COOKBOOKS;

      var response = await sendMessage([key]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE]);
      }
      var cbs = List.from(jsonDecode(r.value2[0])).map((e) => Cookbook.fromJson(e)).toList();
      if (cbs.isEmpty) {
        throw ResponseException(response, 'Malformed cookbooks');
      }
      return cbs;
    });
  }

  /// Async: Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  /// Returns the retrieved [Profile] as an argument.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// profile is not retrieved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [NotAnAddressException] : An argument was provided, but did not pass
  /// address validation.
  ///
  /// [ProfileDoesNotExistException] : There is no profile at the provided
  /// address.
  ///
  /// [NodeInternalErrorException] : The node threw an unexpected error when
  /// handling the query. This should not occur in production environments.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// [ResponseException] : After sending the message to the wallet, the
  /// received response does not fit the expected format.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> getProfile() async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.GET_PROFILE;

      var sdkIPCMessage = SDKIPCMessage(key, '', getHostBasedOnOS(Platform.isAndroid));

      getProfileCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, getProfileCompleter);
      return response;
    });
  }

  /// Async: Retrieves a list of recipes on the Pylons chain. If address is
  /// provided, retrieves only recipes belonging to that address; if an empty
  /// string is provided as address, retrieves only recipes belonging to current
  /// profile; otherwise, retrieves all recipes that exist on chain.
  ///
  /// Returns a [List]<[Recipe]> containing the retrieved recipes. This will
  /// ordinarily be "successful" even if there are no recipes to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// recipes are not retrieved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [NotAnAddressException] : An argument was provided, but did not pass
  /// address validation.
  ///
  /// [NodeInternalErrorException] : The node threw an unexpected error when
  /// handling the query. This should not occur in production environments.
  ///
  /// [ProfileDoesNotExistException] : There is no profile at the provided
  /// address.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// [ResponseException] : After sending the message to the wallet, the
  /// received response does not fit the expected format.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse<List<Recipe>>> getRecipes(String cookBookId) async {
    return Future<SDKIPCResponse<List<Recipe>>>.sync(() async {
      var key = Strings.GET_RECIPES;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode({'cookbookId': cookBookId}), getHostBasedOnOS(Platform.isAndroid));

      getAllRecipes = Completer();

      var response = await sendMessageNew(sdkIPCMessage, getAllRecipes);

      if (response is SDKIPCResponse<List<Recipe>>) {
        return response;
      }

      throw Exception('Response Malformed');
    });
  }

  /// Async: Retrieves all current trades that exist on the Pylons chain.
  ///
  /// Returns a [List]<[Trade]> containing the retrieved trades. This will
  /// ordinarily be "successful" even if there are no trades to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// trades are not retrieved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [NodeInternalErrorException] : The node threw an unexpected error when
  /// handling the query. This should not occur in production environments.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<List<Trade>> getTrades() async {
    return Future.sync(() async {
      var key = Strings.GET_TRADES;
      var response = await sendMessage([key]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE]);
      }
      var ts = List.from(jsonDecode(r.value2[0])).map((e) => Trade.fromJson(e)).toList();
      if (ts.isEmpty) {
        throw ResponseException(response, 'Malformed trades');
      }
      return ts;
    });
  }

  /// Async: Creates a transaction to buy an item using either Pylons or a
  /// third-party payment processor.
  ///
  /// TODO: Comprehensive list of processors and what they use paymentId for.
  ///
  /// TODO: This has been ported as it is in the Kotlin implementation, but
  /// it's worth noting that placeForSale doesn't expose a way to list an item
  /// for purchase using Stripe or anything like that. So is paymentId ever
  /// actually used here, or is it just an artifact of the fulfill-trade TX
  /// having that field? If the latter, we should eliminate paymentId from this
  /// call.
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple2] of the
  /// created [Transaction] and the state of the [Profile] after buying the
  /// item.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [PaymentNotValidException] : The paymentId does not exist, or is not for
  /// the item being purchased.
  ///
  /// [ProfileStateException] : The active profile has insufficient Pylons for
  /// an item being purchased using Pylons.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<Tuple2<Transaction, Profile>> txBuyItem(String tradeId, String paymentId) async {
    return Future<Tuple2<Transaction, Profile>>.sync(() async {
      var key = Strings.TX_BUY_ITEMS;
      var response = await sendMessage([key, tradeId, paymentId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE, Strings.ERR_INSUFFICIENT_FUNDS, Strings.ERR_PAYMENT_NOT_VALID, Strings.ERR_PROFILE_DOES_NOT_EXIST]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));

      return Tuple2<Transaction, Profile>(Transaction.wrap(tx), prf);
    });
  }

  /// Async: Creates a transaction to buy the provided number of Pylons using a
  /// third-party payment processor.
  ///
  /// TODO: Comprehensive list of processors and what they use paymentId for.
  /// (I know we have Stripe integration; dunno if Google Play pylons purchase
  /// is still a thing.)
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple2] of the
  /// created [Transaction] and the state of the [Profile] after buying the
  /// Pylons.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [PaymentNotValidException] : The paymentId does not exist, or is not for
  /// the number of Pylons we're attempting to purchase.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<Tuple2<Transaction, Profile>> txBuyPylons(int pylons, String paymentId) {
    return Future<Tuple2<Transaction, Profile>>.sync(() async {
      var key = Strings.TX_BUY_PYLONS;
      var response = await sendMessage([key, pylons.toString(), paymentId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE, Strings.ERR_PAYMENT_NOT_VALID, Strings.ERR_PROFILE_DOES_NOT_EXIST]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      return Tuple2<Transaction, Profile>(Transaction.wrap(tx), prf);
    });
  }

  /// Async: Creates a transaction to create the provided [Cookbook] on the
  /// Pylons chain against the current profile.
  ///
  /// A cookbook with the same name as the provided one must not already exist.
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple3] of the
  /// created [Transaction],the state of the [Profile] after creating the
  /// cookbook, and the [Cookbook] as it newly exists on chain.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [CookbookAlreadyExistsException] : TX rejected because a cookbook with the
  /// provided name already exists.
  ///
  /// [ProfileStateException] : The active profile was not able to create the
  /// cookbook on account of insufficient funds.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_CREATE_COOKBOOK;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(cookbook.toProto3Json()), getHostBasedOnOS(Platform.isAndroid));

      cookBookCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, cookBookCompleter);
      return response;
    });
  }

  /// Async: Creates a transaction to create the provided [Recipe] on the Pylons
  /// chain against the current profile.
  ///
  /// A recipe must not already exist at the coordinates of the provided recipe.
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple3] of the
  /// created [Transaction],the state of the [Profile] after creating the
  /// recipe, and the [Recipe] as it newly exists on chain.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [RecipeValidationException] : No TX was created because the recipe failed
  /// basic clientside sanity-checking before one could be built. This could
  /// be because of impossible outputs, etc. The error message provides more
  /// info on why the sanity check failed.
  ///
  /// [CookbookNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the cookbook in which the recipe was to be created.
  ///
  /// [CookbookDoesNotExistException] : TX rejected because the cookbook in
  /// which the recipe was to be created does not exist.
  ///
  /// [RecipeAlreadyExistsException] : TX rejected because recipe already exists
  /// at the provided coordinates.
  ///
  /// [ProfileStateException] : The active profile was not able to create the
  /// recipe on account of insufficient funds.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_CREATE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()), getHostBasedOnOS(Platform.isAndroid));

      recipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }

  /// Async: Creates a transaction to disable the recipe with the provided real,
  /// on-chain recipe ID against the current profile. Upon successful
  /// resolution of the transaction, returns the created [Transaction].
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [RecipeDoesNotExistException] : TX rejected because recipe does not exist.
  ///
  /// [RecipeNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the recipe.
  ///
  /// [RecipeStateException[ : TX rejected because the recipe is already disabled.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<Transaction> txDisableRecipe(String recipeId) async {
    return Future<Transaction>.sync(() async {
      var key = Strings.TX_DISABLE_RECIPE;
      var response = await sendMessage([key, recipeId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(
            r, [Strings.ERR_NODE, Strings.ERR_RECIPE_DOES_NOT_EXIST, Strings.ERR_RECIPE_NOT_OWNED, Strings.ERR_RECIPE_ALREADY_DISABLED, Strings.ERR_PROFILE_DOES_NOT_EXIST]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      return Transaction.wrap(tx);
    });
  }

  /// Async: Creates a transaction to enable the recipe with the provided real,
  /// on-chain recipe ID against the current profile. Upon successful
  /// resolution of the transaction, returns the created [Transaction].
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [RecipeDoesNotExistException] : TX rejected because recipe does not exist.
  ///
  /// [RecipeNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the recipe.
  ///
  /// [RecipeStateException] : TX rejected because the recipe is already enabled.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txEnableRecipe(String cookbookId, String recipeId, String version) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_ENABLE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode({'cookbookId': cookbookId, 'recipeId': recipeId, 'version': version}), getHostBasedOnOS(Platform.isAndroid));

      enableRecipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, executeRecipeCompleter);
      return response;
    });
  }

  /// Async: Creates a transaction to execute the recipe with coordinates
  /// cookbookId:recipeName against the current profile. Upon successful
  /// resolution of the transaction, returns a [Tuple2] of the created
  /// [Transaction] and the state of the active [Profile] after execution of
  /// the recipe.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [RecipeDoesNotExistException] : TX rejected because recipe does not exist.
  ///
  /// [CookbookDoesNotExistException] : TX rejected because cookbook does not exist.
  ///
  /// [ItemNotOwnedException] : TX rejected because a passed item ID pointed to an unowned item.
  ///
  /// [ItemDoesNotExistException] : TX rejected because a passed item ID did not point to an existing item.
  ///
  /// [ProfileStateException] : TX rejected because profile doesn't have all
  /// necessary recipe inputs.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txExecuteRecipe(
      {required String cookbookId, required String recipeName, required List<String> itemIds, required int coinInputIndex, required List<PaymentInfo> paymentInfo}) async {
    return Future<SDKIPCResponse>.sync(() async {
      var msgExecuteRecipe = MsgExecuteRecipe(creator: '', cookbookID: cookbookId, recipeID: recipeName, coinInputsIndex: fixnum.Int64(coinInputIndex), itemIDs: itemIds, paymentInfos: paymentInfo);

      var key = Strings.TX_EXECUTE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(msgExecuteRecipe.toProto3Json()), getHostBasedOnOS(Platform.isAndroid));

      executeRecipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, executeRecipeCompleter);
      return response;
    });
  }

  /// Async: Creates a transaction to post a trade of the provided [Item] for a
  /// price in pylons against the current profile.
  ///
  /// The active profile must own the item.
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple3] of the
  /// created [Transaction], the state of the [Profile] after creation of the
  /// trade, and the [Trade] as it newly exists on chain.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [ItemDoesNotExistException] : TX rejected because the item does not
  /// exist on the chain.
  ///
  /// [ItemNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the item to be placed for sale.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale(Item item, int price) async {
    return Future<Tuple3<Transaction, Profile, Trade>>.sync(() async {
      var key = Strings.TX_PLACE_FOR_SALE;
      var response = await sendMessage([key, const JsonEncoder().convert(item), price.toString()]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE, Strings.ERR_ITEM_NOT_OWNED, Strings.ERR_ITEM_DOES_NOT_EXIST, Strings.ERR_PROFILE_DOES_NOT_EXIST]);
      }

      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      var tr = Trade.fromJson(jsonDecode(r.value2[2]));
      return Tuple3<Transaction, Profile, Trade>(Transaction.wrap(tx), prf, tr);
    });
  }

  /// Async: Creates a transaction to updates the provided [Cookbook] on the
  /// Pylons chain to match that provided against the current profile.
  ///
  /// A cookbook with the same name as the provided one must already exist and
  /// be owned by the active profile.
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple3] of the
  /// created [Transaction], the state of the [Profile] after the cookbook is
  /// updated, and the [Cookbook] as it now exists on chain.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [CookbookNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the cookbook to be updated.
  ///
  /// [CookbookDoesNotExistException] : TX rejected because a cookbook with the
  /// provided name already exists.
  ///
  /// [ProfileStateException] : The active profile was not able to update the
  /// cookbook on account of insufficient funds.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_UPDATE_COOKBOOK;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(cookbook.toProto3Json()), getHostBasedOnOS(Platform.isAndroid));

      cookBookUpdateCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }

  /// Async: Creates a transaction to updates the provided [Recipe] on the
  /// Pylons chain to match that provided against the current profile.
  ///
  /// A recipe must already exist at the coordinates of the provided recipe,
  /// and be owned by the current profile..
  ///
  /// Upon successful resolution of the transaction, returns a [Tuple3] of the
  /// created [Transaction], the state of the [Profile] after the recipe is
  /// updated, and the [Recipe] as it now exists on chain.
  ///
  /// Can throw one of the following exceptions in the event that the
  /// transaction is not resolved successfully:
  ///
  /// [NoWalletException] : There's no attached wallet.
  ///
  /// [RecipeValidationException] : No TX was created because the recipe failed
  /// basic clientside sanity-checking before one could be built. This could
  /// be because of impossible outputs, etc. The error message provides more
  /// info on why the sanity check failed.
  ///
  /// [RecipeNotOwnedException] : TX rejected because the active profile is not
  /// the owner of the recipe to be updated.
  ///
  /// [RecipeDoesNotExistException] : TX rejected because the recipe to be
  /// updated does not exist on the Pylons chain.
  ///
  /// [ProfileDoesNotExistException] : TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// [NodeInternalErrorException] : TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// [UnhandledErrorException] : Received an error from the wallet, but the
  /// error didn't match any errors we were expecting. This should really,
  /// really not occur in production environments.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_UPDATE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()), getHostBasedOnOS(Platform.isAndroid));

      recipeUpdateCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }

  @override
  Future<bool> exists() {
    return Future.sync(() {
      if (Platform.isAndroid) {
        return canLaunch(BASE_UNI_LINK);
      }
      return canLaunch(BASE_UNI_LINK_IOS);
    });
  }

  /// This method encodes the message that we need to send to wallet
  /// [Input] : [msg] is the string received from the wallet
  /// [Output] : [List] contains the decoded response
  String encodeMessage(List<String> msg) {
    var encodedMessageWithComma = msg.map((e) => base64Url.encode(utf8.encode(e))).join(',');
    return base64Url.encode(utf8.encode(encodedMessageWithComma));
  }

  /// This method decode the message that the wallet sends back
  /// [Input] : [msg] is the string received from the wallet
  /// [Output] : [List] contains the decoded response
  List<String> decodeMessage(String msg) {
    var decoded = utf8.decode(base64Url.decode(msg));
    return decoded.split(',').map((e) => utf8.decode(base64Url.decode(e))).toList();
  }

  /// This method sends the unilink to the wallet app
  /// [Input] : [unilink] is the unilink with data for the wallet app
  ///
  /// This method throws the following exception
  ///
  /// [NoWalletException] : If no wallet exists this method will throw the following error.
  void dispatchUniLink(String uniLink) async {
    await canLaunch(uniLink) ? await launch(uniLink) : throw NoWalletException();
  }

  /// This method creates link based on the OS
  /// [Input] : [encodedMessage] the message to sent to the wallet, [isAndroid] tells whether the underlying platform is Android or not
  /// [Output] : [String] the message with appropriate link based on the OS
  String createLinkBasedOnOS({required String encodedMessage, required bool isAndroid}) {
    if (isAndroid) {
      return '$BASE_UNI_LINK/$encodedMessage';
    }

    return '$BASE_UNI_LINK_IOS$encodedMessage';
  }

  /// This method returns the host based on the OS
  /// [Input] : [bool] specifies whether the platform is Android or not
  /// [Output] : [String] the host for particular platform
  String getHostBasedOnOS(bool isAndroid) {
    if (isAndroid) {
      return host;
    }

    return 'pylons-$host';
  }
}
