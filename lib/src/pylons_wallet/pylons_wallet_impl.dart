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

  /// Parses [link] for an IPC message, gets a response, and dispatches the response to the appropriate handler.
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

  @override
  Future<String> sendMessage(List<String> msg) {
    // Append the host to the msg
    msg.insert(0, getHostBasedOnOS(Platform.isAndroid));

    var encodedMessage = encodeMessage(msg);
    dispatchUniLink('$BASE_UNI_LINK/$encodedMessage');
    var completer = Completer<String>();
    return completer.future;
  }

  /// Async: Send the provided message [sdkipcMessage] over the IPC channel, then retrieve a
  /// response using the provided completer [completer].
  Future<SDKIPCResponse> sendMessageNew(
      SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse> completer) {
    var encodedMessage = sdkipcMessage.createMessage();

    var universalLink = createLinkBasedOnOS(
        encodedMessage: encodedMessage, isAndroid: Platform.isAndroid);
    print(universalLink);
    dispatchUniLink(universalLink);
    return completer.future;
  }

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
      var cbs = List.from(jsonDecode(r.value2[0]))
          .map((e) => Cookbook.fromJson(e))
          .toList();
      if (cbs.isEmpty) {
        throw ResponseException(response, 'Malformed cookbooks');
      }
      return cbs;
    });
  }

  @override
  Future<SDKIPCResponse> getProfile() async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.GET_PROFILE;

      var sdkIPCMessage =
          SDKIPCMessage(key, '', getHostBasedOnOS(Platform.isAndroid));

      getProfileCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, getProfileCompleter);
      return response;
    });
  }

  @override
  Future<List<Recipe>> getRecipes(String? address) async {
    return Future<List<Recipe>>.sync(() async {
      if (address != null) {
        PylonsWalletCommUtil.validateAddress(address);
      } // address is an optional field
      var key = Strings.GET_RECIPE;
      var ls = <String>[key];
      if (address != null) ls.add(address);
      var response = await sendMessage(ls);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        if (address != null) {
          PylonsWalletCommUtil.handleErrors(
              r, [Strings.ERR_NODE, Strings.ERR_PROFILE_DOES_NOT_EXIST]);
        } else {
          PylonsWalletCommUtil.handleErrors(r, [Strings.ERR_NODE]);
        }
      }
      var rs = List.from(jsonDecode(r.value2[0]))
          .map((e) => Recipe.fromJson(e))
          .toList();
      if (rs.isEmpty) {
        throw ResponseException(response, 'Malformed recipes');
      }
      return rs;
    });
  }

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
      var ts = List.from(jsonDecode(r.value2[0]))
          .map((e) => Trade.fromJson(e))
          .toList();
      if (ts.isEmpty) {
        throw ResponseException(response, 'Malformed trades');
      }
      return ts;
    });
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyItem(
      String tradeId, String paymentId) async {
    return Future<Tuple2<Transaction, Profile>>.sync(() async {
      var key = Strings.TX_BUY_ITEMS;
      var response = await sendMessage([key, tradeId, paymentId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [
          Strings.ERR_NODE,
          Strings.ERR_INSUFFICIENT_FUNDS,
          Strings.ERR_PAYMENT_NOT_VALID,
          Strings.ERR_PROFILE_DOES_NOT_EXIST
        ]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));

      return Tuple2<Transaction, Profile>(Transaction.wrap(tx), prf);
    });
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyPylons(
      int pylons, String paymentId) {
    return Future<Tuple2<Transaction, Profile>>.sync(() async {
      var key = Strings.TX_BUY_PYLONS;
      var response = await sendMessage([key, pylons.toString(), paymentId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [
          Strings.ERR_NODE,
          Strings.ERR_PAYMENT_NOT_VALID,
          Strings.ERR_PROFILE_DOES_NOT_EXIST
        ]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      return Tuple2<Transaction, Profile>(Transaction.wrap(tx), prf);
    });
  }

  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_CREATE_COOKBOOK;

      var sdkIPCMessage = SDKIPCMessage(
          key,
          jsonEncode(cookbook.toProto3Json()),
          getHostBasedOnOS(Platform.isAndroid));

      cookBookCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, cookBookCompleter);
      return response;
    });
  }

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_CREATE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()),
          getHostBasedOnOS(Platform.isAndroid));

      recipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }

  @override
  Future<Transaction> txDisableRecipe(String recipeId) async {
    return Future<Transaction>.sync(() async {
      var key = Strings.TX_DISABLE_RECIPE;
      var response = await sendMessage([key, recipeId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [
          Strings.ERR_NODE,
          Strings.ERR_RECIPE_DOES_NOT_EXIST,
          Strings.ERR_RECIPE_NOT_OWNED,
          Strings.ERR_RECIPE_ALREADY_DISABLED,
          Strings.ERR_PROFILE_DOES_NOT_EXIST
        ]);
      }
      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      return Transaction.wrap(tx);
    });
  }

  @override
  Future<SDKIPCResponse> txEnableRecipe(
      String cookbookId, String recipeId, String version) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_ENABLE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(
          key,
          jsonEncode({
            'cookbookId': cookbookId,
            'recipeId': recipeId,
            'version': version
          }),
          getHostBasedOnOS(Platform.isAndroid));

      enableRecipeCompleter = Completer();

      var response =
          await sendMessageNew(sdkIPCMessage, executeRecipeCompleter);
      return response;
    });
  }

  @override
  Future<SDKIPCResponse> txExecuteRecipe(
      {required String cookbookId,
      required String recipeName,
      required List<String> itemIds,
      required int coinInputIndex,
      required List<PaymentInfo> paymentInfo}) async {
    return Future<SDKIPCResponse>.sync(() async {
      var msgExecuteRecipe = MsgExecuteRecipe(
          creator: '',
          cookbookID: cookbookId,
          recipeID: recipeName,
          coinInputsIndex: fixnum.Int64(coinInputIndex),
          itemIDs: itemIds,
          paymentInfos: paymentInfo);

      var key = Strings.TX_EXECUTE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(
          key,
          jsonEncode(msgExecuteRecipe.toProto3Json()),
          getHostBasedOnOS(Platform.isAndroid));

      executeRecipeCompleter = Completer();

      var response =
          await sendMessageNew(sdkIPCMessage, executeRecipeCompleter);
      return response;
    });
  }

  @override
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale(
      Item item, int price) async {
    return Future<Tuple3<Transaction, Profile, Trade>>.sync(() async {
      var key = Strings.TX_PLACE_FOR_SALE;
      var response = await sendMessage(
          [key, const JsonEncoder().convert(item), price.toString()]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.handleErrors(r, [
          Strings.ERR_NODE,
          Strings.ERR_ITEM_NOT_OWNED,
          Strings.ERR_ITEM_DOES_NOT_EXIST,
          Strings.ERR_PROFILE_DOES_NOT_EXIST
        ]);
      }

      var tx = Tx.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      var tr = Trade.fromJson(jsonDecode(r.value2[2]));
      return Tuple3<Transaction, Profile, Trade>(Transaction.wrap(tx), prf, tr);
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook) async {
    return Future<SDKIPCResponse>.sync(() async {
      var key = Strings.TX_UPDATE_COOKBOOK;

      var sdkIPCMessage = SDKIPCMessage(
          key,
          jsonEncode(cookbook.toProto3Json()),
          getHostBasedOnOS(Platform.isAndroid));

      cookBookUpdateCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_UPDATE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()),
          getHostBasedOnOS(Platform.isAndroid));

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

  /// Encodes a message [msg] to be sent to the wallet.
  ///
  /// Argument is provided as a list of strings corresponding to each piece of data in the message.
  ///
  /// Returns a string containing the encoded base64 representation of the message.
  String encodeMessage(List<String> msg) {
    var encodedMessageWithComma =
        msg.map((e) => base64Url.encode(utf8.encode(e))).join(',');
    return base64Url.encode(utf8.encode(encodedMessageWithComma));
  }

  /// Decodes a message [msg] received from the wallet.
  ///
  /// Argument is provided as a Base64-encoded string.
  ///
  /// Returns a [List<String>] containing the data from the decoded message.
  List<String> decodeMessage(String msg) {
    var decoded = utf8.decode(base64Url.decode(msg));
    return decoded
        .split(',')
        .map((e) => utf8.decode(base64Url.decode(e)))
        .toList();
  }

  /// Sends [unilink] to wallet app.
  ///
  /// Throws a [NoWalletException] if the wallet doesn't exist.
  void dispatchUniLink(String uniLink) async {
    await canLaunch(uniLink)
        ? await launch(uniLink)
        : throw NoWalletException();
  }

  /// Create a unilink for the current OS.
  ///
  /// [encodedMessage] is the message to be sent to the wallet; [isAndroid] is whether or not we're running on Android.
  ///
  /// Returns a string containing the correct platform-specific unilink.
  String createLinkBasedOnOS(
      {required String encodedMessage, required bool isAndroid}) {
    if (isAndroid) {
      return '$BASE_UNI_LINK/$encodedMessage';
    }

    return '$BASE_UNI_LINK_IOS$encodedMessage';
  }

  /// Get the host for the current OS.
  ///
  /// [isAndroid] is whether or not we're running on Android.
  ///
  /// Returns a string containing the correct platform-specific host.
  String getHostBasedOnOS(bool isAndroid) {
    if (isAndroid) {
      return host;
    }

    return 'pylons-$host';
  }
}
