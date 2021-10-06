/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.
library pylons_flutter_impl;

import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/pylons_wallet_comm_util.dart';

import 'core/constants/strings.dart';

/// The Pylons class is the main endpoint developers use for structured,
/// high-level interactions with the Pylons wallet.
class PylonsWalletImpl implements PylonsWallet {
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
    throw UnimplementedError();
  }

  /// Async: Returns true if an IPC target exists. False otherwise.
  @override
  Future<bool> exists() async {
    throw UnimplementedError();
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
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.GET_COOK_BOOKS;
      var response = await sendMessage([key]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
              'node',
              r,
              NodeInternalErrorException(
                  int.parse(r.value2[1]),
                  r.value2[2],
                  'Node threw an unexpected error! '
                  'Debug this!'),
            );

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
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
  Future<Profile> getProfile(String? address) async {
    return Future<Profile>.sync(() async {
      await PylonsWalletCommUtil.validateExists(this);
      PylonsWalletCommUtil.validateAddress(address);
      var key = Strings.GET_PROFILE;
      var ls = <String>[key];
      if (address != null) ls.add(address);
      var response = await sendMessage(ls);

      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
                'node',
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    'Node threw an unexpected error! '
                    'Debug this!'));

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var p = Profile.fromJson(jsonDecode(r.value2[0]));
      return p;
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
  Future<List<Recipe>> getRecipes(String? address) async {
    return Future<List<Recipe>>.sync(() async {
      await PylonsWalletCommUtil.validateExists(this);
      PylonsWalletCommUtil.validateAddress(address);

      var key = Strings.GET_RECIPE;
      var ls = <String>[key];
      if (address != null) ls.add(address);
      var response = await sendMessage(ls);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
                'node',
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    'Node threw an unexpected error! '
                    'Debug this!'));

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var rs = List.from(jsonDecode(r.value2[0])).map((e) => Recipe.fromJson(e)).toList();
      if (rs.isEmpty) {
        throw ResponseException(response, 'Malformed recipes');
      }

      return rs;
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
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.GET_TRADES;
      var response = await sendMessage([key]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError(
            'node',
            r,
            NodeInternalErrorException(
                int.parse(r.value2[1]),
                r.value2[2],
                'Node threw an unexpected error! '
                'Debug this!'));

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
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
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.TX_BUY_ITEMS;
      var response = await sendMessage([key, tradeId, paymentId]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError(
                'payment',
                r,
                PaymentNotValidException(
                    r.value2[1],
                    'Bad '
                    'payment')) ||
            PylonsWalletCommUtil.procError(
                'profileState',
                r,
                ProfileStateException('Insufficient'
                    'funds')) ||
            PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
                'node',
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    'Node threw an unexpected error! '
                    'Debug this!'));

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var tx = Transaction.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));

      return Tuple2<Transaction, Profile>(tx, prf);
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
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.TX_BUY_PYLONS;
      var response = await sendMessage([key, pylons.toString(), paymentId]);

      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError(
              'payment',
              r,
              PaymentNotValidException(
                  r.value2[1],
                  'Bad '
                  'payment'),
            ) ||
            PylonsWalletCommUtil.procError(
              'profileState',
              r,
              ProfileStateException('Insufficient'
                  'funds'),
            ) ||
            PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
                'node',
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    'Node threw an unexpected error! '
                    'Debug this!'));

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var tx = Transaction.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));

      return Tuple2<Transaction, Profile>(tx, prf);
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
  Future<Tuple3<Transaction, Profile, Cookbook>> txCreateCookbook(Cookbook cookbook) async {
    return Future<Tuple3<Transaction, Profile, Cookbook>>.sync(() async {
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.TX_CREATE_COOK_BOOK;
      var response = await sendMessage([key, const JsonEncoder().convert(cookbook)]);

      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError('cookbookAlreadyExists', r, CookbookAlreadyExistsException(r.value2[1], r.value2[2], 'Cookbook already exists')) ||
            PylonsWalletCommUtil.procError(
              'profileState',
              r,
              ProfileStateException('Insufficient'
                  'funds'),
            ) ||
            PylonsWalletCommUtil.procError('profileDoesNotExist', r, ProfileDoesNotExistException(r.value2[1])) ||
            PylonsWalletCommUtil.procError(
              'node',
              r,
              NodeInternalErrorException(
                  int.parse(r.value2[1]),
                  r.value2[2],
                  'Node threw an unexpected error! '
                  'Debug this!'),
            );

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }

      var tx = Transaction.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      var cb = Cookbook.fromJson(jsonDecode(r.value2[2]));

      return Tuple3<Transaction, Profile, Cookbook>(tx, prf, cb);
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
  Future<Tuple3<Transaction, Profile, Recipe>> txCreateRecipe(Recipe recipe) async {
    return Future<Tuple3<Transaction, Profile, Recipe>>.sync(() async {
      await PylonsWalletCommUtil.validateExists(this);
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_CREATE_RECIPE;
      var response = await sendMessage([key, const JsonEncoder().convert(recipe)]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError(
              'cookbookDoesNotExist',
              r,
              CookbookDoesNotExistException(r.value2[1], 'Cookbook does not exist'),
            ) ||
            PylonsWalletCommUtil.procError(
              'cookbookNotOwned',
              r,
              CookbookNotOwnedException(r.value2[1], r.value2[2], 'Cookbook not owned'),
            ) ||
            PylonsWalletCommUtil.procError(
              'recipeAlreadyyExists',
              r,
              RecipeAlreadyExistsException(r.value2[1], r.value2[2], 'Recipe already exists'),
            ) ||
            PylonsWalletCommUtil.procError(
              'profileState',
              r,
              ProfileStateException('Insufficient'
                  'funds'),
            ) ||
            PylonsWalletCommUtil.procError(
              'profileDoesNotExist',
              r,
              ProfileDoesNotExistException(r.value2[1]),
            ) ||
            PylonsWalletCommUtil.procError(
              'node',
              r,
              NodeInternalErrorException(
                  int.parse(r.value2[1]),
                  r.value2[2],
                  'Node threw an unexpected error! '
                  'Debug this!'),
            );

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var tx = Transaction.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      var rcp = Recipe.fromJson(jsonDecode(r.value2[2]));

      return Tuple3<Transaction, Profile, Recipe>(tx, prf, rcp);
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
    throw UnimplementedError();
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
  Future<Transaction> txEnableRecipe(String recipeId) async {
    throw UnimplementedError();
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
  Future<Tuple2<Transaction, Profile>> txExecuteRecipe(String cookbookId, String recipeName) async {
    throw UnimplementedError();
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
    throw UnimplementedError();
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
  Future<Tuple3<Transaction, Profile, Cookbook>> txUpdateCookbook(Cookbook cookbook) async {
    return Future<Tuple3<Transaction, Profile, Cookbook>>.sync(() async {
      await PylonsWalletCommUtil.validateExists(this);
      var key = Strings.TX_UPDATE_COOK_BOOK;
      var response = await sendMessage([key, const JsonEncoder().convert(cookbook)]);
      var r = PylonsWalletCommUtil.procResponse(response);
      PylonsWalletCommUtil.validateResponseMatchesKey(key, r);
      if (PylonsWalletCommUtil.responseIsError(r.value1, key)) {
        PylonsWalletCommUtil.procError('cookbookDoesNotExist', r, CookbookDoesNotExistException(r.value2[1], 'Cookbook already exists')) ||
            PylonsWalletCommUtil.procError('cookbookNotOwned', r, CookbookNotOwnedException(r.value2[1], r.value2[2], 'Cookbook already exists')) ||
            PylonsWalletCommUtil.procError(
              'profileState',
              r,
              ProfileStateException('Insufficient'
                  'funds'),
            ) ||
            PylonsWalletCommUtil.procError(
              'profileDoesNotExist',
              r,
              ProfileDoesNotExistException(r.value2[1]),
            ) ||
            PylonsWalletCommUtil.procError(
              'node',
              r,
              NodeInternalErrorException(
                  int.parse(r.value2[1]),
                  r.value2[2],
                  'Node threw an unexpected error! '
                  'Debug this!'),
            );

        throw UnhandledErrorException(r.value1, 'Unknown error passed: ${r.value2}');
      }
      var tx = Transaction.fromJson(jsonDecode(r.value2[0]));
      var prf = Profile.fromJson(jsonDecode(r.value2[1]));
      var cb = Cookbook.fromJson(jsonDecode(r.value2[2]));

      throw Tuple3<Transaction, Profile, Cookbook>(tx, prf, cb);
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
  Future<Tuple3<Transaction, Profile, Recipe>> txUpdateRecipe(Recipe recipe) async {
    throw UnimplementedError();
  }
}
