/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.
library pylons_flutter;

import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

/// The Pylons class is the main endpoint developers use for structured,
/// high-level interactions with the Pylons wallet.
abstract class PylonsWallet {
  /// Async: Send the provided message over the IPC channel, then retrieve a
  /// response.
  ///
  /// [msg] is a list of strings which are converted to base64 and combined
  /// to form a single comma-separated string before being sent over the
  /// channel.
  ///
  /// The string that is eventually retrieved as a response fits the same
  /// format.
  Future<String> _sendMessage(List<String> msg);

  /// Retrieves the [AndroidWallet] instance. Since [AndroidWallet] is a
  /// singleton, this method will always return a reference to the same object.
  static void android() => AndroidWallet();

  /// Async: Returns true if an IPC target exists. False otherwise.
  static Future<bool> exists() async {
    throw UnimplementedError();
  }

  static void _validateExists(Completer completer) {
    exists().then((bool v) {
      if (v == false) {
        completer.completeError(NoWalletException());
      }
    });
  }

  static bool _validateAddress(String? address, Completer completer) {
    throw UnimplementedError();
  }

  static bool _validateRecipe(Recipe recipe, Completer completer) {
    throw UnimplementedError();
  }

  static bool _responseIsError(String v, String key) {
    return v == "err_$key";
  }

  static void _validateResponseMatchesKey(
      String key, Tuple2<String, List<String>> response, Completer completer) {
    if ((response.value1 != "response_$key" && response.value1 != "err_$key")) {
      completer.completeError(ResponseException(
          const JsonEncoder().convert(response), "Bad response: $response"));
    }
  }

  static bool _procError(String err, Tuple2<String, List<String>> response,
      Exception exception, Completer completer) {
    if (response.value2[0] == err) {
      try {
        completer.completeError(exception);
      } catch (e) {
        completer.completeError(UnhandledErrorException(
            err, "Bad error passed: ${response.value2}"));
      }
    }
    return response.value2[0] == err;
  }

  static Tuple2<String, List<String>> _procResponse(String response) {
    Utf8Decoder decoder = const Utf8Decoder();
    List<String> splut = response.split(',');
    String key = decoder.convert(base64Decode(splut.first));
    List<String> elems = splut.sublist(1, splut.length);
    for (int i = 0; i < elems.length; i++) {
      elems[i] = decoder.convert(base64Decode(elems[i]));
    }
    return Tuple2<String, List<String>>(key, elems);
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
  Future<List<Cookbook>> getCookbooks() async {
    Completer<List<Cookbook>> completer = Completer<List<Cookbook>>();
    _validateExists(completer);
    String key = "getCookbooks";
    _sendMessage([key]).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        List<Cookbook>? cbs = jsonDecode(r.value2[0]) as List<Cookbook>?;
        if (cbs == null) {
          completer.completeError(
              ResponseException(response, "Malformed cookbooks"));
        } else {
          completer.complete(cbs);
        }
      }
    });
    return completer.future;
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
  Future<Profile> getProfile(String? address) async {
    Completer<Profile> completer = Completer<Profile>();
    _validateExists(completer);
    _validateAddress(address, completer);
    String key = "getProfile";
    List<String> ls = [key];
    if (address != null) ls.add(address);
    _sendMessage(ls).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Profile? p = jsonDecode(r.value2[0]) as Profile?;
        if (p == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else {
          completer.complete(p);
        }
      }
    });
    return completer.future;
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
  Future<List<Recipe>> getRecipes(String? address) async {
    Completer<List<Recipe>> completer = Completer<List<Recipe>>();
    _validateExists(completer);
    _validateAddress(address, completer);
    String key = "getRecipes";
    List<String> ls = [key];
    if (address != null) ls.add(address);
    _sendMessage(ls).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        List<Recipe>? rs = jsonDecode(r.value2[0]) as List<Recipe>?;
        if (rs == null) {
          completer
              .completeError(ResponseException(response, "Malformed recipes"));
        } else {
          completer.complete(rs);
        }
      }
    });
    return completer.future;
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
  Future<List<Trade>> getTrades() async {
    Completer<List<Trade>> completer = Completer<List<Trade>>();
    _validateExists(completer);
    String key = "getTrades";
    _sendMessage([key]).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
            "node",
            r,
            NodeInternalErrorException(
                int.parse(r.value2[1]),
                r.value2[2],
                "Node threw an unexpected error! "
                "Debug this!"),
            completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        List<Trade>? ts = jsonDecode(r.value2[0]) as List<Trade>?;
        if (ts == null) {
          completer
              .completeError(ResponseException(response, "Malformed trades"));
        } else {
          completer.complete(ts);
        }
      }
    });
    return completer.future;
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
  Future<Tuple2<Transaction, Profile>> txBuyItem(
      String tradeId, String paymentId) async {
    Completer<Tuple2<Transaction, Profile>> completer =
        Completer<Tuple2<Transaction, Profile>>();
    _validateExists(completer);
    String key = "txBuyItem";
    _sendMessage([key, tradeId, paymentId]).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
                "payment",
                r,
                PaymentNotValidException(
                    r.value2[1],
                    "Bad "
                    "payment"),
                completer) ||
            _procError(
                "profileState",
                r,
                ProfileStateException("Insufficient"
                    "funds"),
                completer) ||
            _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Transaction? tx = jsonDecode(r.value2[0]) as Transaction?;
        Profile? prf = jsonDecode(r.value2[1]) as Profile?;
        if (tx == null) {
          completer.completeError(ResponseException(response, "Malformed tx"));
        } else if (prf == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else {
          completer.complete(Tuple2<Transaction, Profile>(tx, prf));
        }
      }
    });
    return completer.future;
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
  Future<Tuple2<Transaction, Profile>> txBuyPylons(
      int pylons, String paymentId) async {
    Completer<Tuple2<Transaction, Profile>> completer =
        Completer<Tuple2<Transaction, Profile>>();
    _validateExists(completer);
    String key = "txBuyPylons";
    _sendMessage([key, pylons.toString(), paymentId]).then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
                "payment",
                r,
                PaymentNotValidException(
                    r.value2[1],
                    "Bad "
                    "payment"),
                completer) ||
            _procError(
                "profileState",
                r,
                ProfileStateException("Insufficient"
                    "funds"),
                completer) ||
            _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Transaction? tx = jsonDecode(r.value2[0]) as Transaction?;
        Profile? prf = jsonDecode(r.value2[1]) as Profile?;
        if (tx == null) {
          completer.completeError(ResponseException(response, "Malformed tx"));
        } else if (prf == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else {
          completer.complete(Tuple2<Transaction, Profile>(tx, prf));
        }
      }
    });
    return completer.future;
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
  Future<Tuple3<Transaction, Profile, Cookbook>> txCreateCookbook(
      Cookbook cookbook) async {
    Completer<Tuple3<Transaction, Profile, Cookbook>> completer =
        Completer<Tuple3<Transaction, Profile, Cookbook>>();
    _validateExists(completer);
    String key = "txCreateCookbook";
    _sendMessage([key, const JsonEncoder().convert(cookbook)])
        .then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
                "cookbookAlreadyExists",
                r,
                CookbookAlreadyExistsException(
                    r.value2[1], r.value2[2], "Cookbook already exists"),
                completer) ||
            _procError(
                "profileState",
                r,
                ProfileStateException("Insufficient"
                    "funds"),
                completer) ||
            _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Transaction? tx = jsonDecode(r.value2[0]) as Transaction?;
        Profile? prf = jsonDecode(r.value2[1]) as Profile?;
        Cookbook? cb = jsonDecode(r.value2[2]) as Cookbook?;
        if (tx == null) {
          completer.completeError(ResponseException(response, "Malformed tx"));
        } else if (prf == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else if (cb == null) {
          completer
              .completeError(ResponseException(response, "Malformed cookbook"));
        } else {
          completer
              .complete(Tuple3<Transaction, Profile, Cookbook>(tx, prf, cb));
        }
      }
    });
    return completer.future;
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
  Future<Tuple3<Transaction, Profile, Recipe>> txCreateRecipe(
      Recipe recipe) async {
    Completer<Tuple3<Transaction, Profile, Recipe>> completer =
        Completer<Tuple3<Transaction, Profile, Recipe>>();
    _validateExists(completer);
    _validateRecipe(recipe, completer);
    String key = "txCreateRecipe";
    _sendMessage([key, const JsonEncoder().convert(recipe)])
        .then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
                "cookbookDoesNotExist",
                r,
                CookbookDoesNotExistException(
                    r.value2[1], "Cookbook does not exist"),
                completer) ||
            _procError(
                "cookbookNotOwned",
                r,
                CookbookNotOwnedException(
                    r.value2[1], r.value2[2], "Cookbook not owned"),
                completer) ||
            _procError(
                "recipeAlreadyyExists",
                r,
                RecipeAlreadyExistsException(
                    r.value2[1], r.value2[2], "Recipe already exists"),
                completer) ||
            _procError(
                "profileState",
                r,
                ProfileStateException("Insufficient"
                    "funds"),
                completer) ||
            _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Transaction? tx = jsonDecode(r.value2[0]) as Transaction?;
        Profile? prf = jsonDecode(r.value2[1]) as Profile?;
        Recipe? rcp = jsonDecode(r.value2[2]) as Recipe?;
        if (tx == null) {
          completer.completeError(ResponseException(response, "Malformed tx"));
        } else if (prf == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else if (rcp == null) {
          completer
              .completeError(ResponseException(response, "Malformed recipe"));
        } else {
          completer
              .complete(Tuple3<Transaction, Profile, Recipe>(tx, prf, rcp));
        }
      }
    });
    return completer.future;
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
  Future<Tuple2<Transaction, Profile>> txExecuteRecipe(
      String cookbookId, String recipeName) async {
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
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale(
      Item item, int price) async {
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
  Future<Tuple3<Transaction, Profile, Cookbook>> txUpdateCookbook(
      Cookbook cookbook) async {
    Completer<Tuple3<Transaction, Profile, Cookbook>> completer =
        Completer<Tuple3<Transaction, Profile, Cookbook>>();
    _validateExists(completer);
    String key = "txUpdateCookbook";
    _sendMessage([key, const JsonEncoder().convert(cookbook)])
        .then((String response) {
      Tuple2<String, List<String>> r = _procResponse(response);
      _validateResponseMatchesKey(key, r, completer);
      if (_responseIsError(r.value1, key)) {
        bool handled = _procError(
                "cookbookDoesNotExist",
                r,
                CookbookDoesNotExistException(
                    r.value2[1], "Cookbook already exists"),
                completer) ||
            _procError(
                "cookbookNotOwned",
                r,
                CookbookNotOwnedException(
                    r.value2[1], r.value2[2], "Cookbook already exists"),
                completer) ||
            _procError(
                "profileState",
                r,
                ProfileStateException("Insufficient"
                    "funds"),
                completer) ||
            _procError("profileDoesNotExist", r,
                ProfileDoesNotExistException(r.value2[1]), completer) ||
            _procError(
                "node",
                r,
                NodeInternalErrorException(
                    int.parse(r.value2[1]),
                    r.value2[2],
                    "Node threw an unexpected error! "
                    "Debug this!"),
                completer);
        if (!handled) {
          completer.completeError(UnhandledErrorException(
              r.value1, "Unknown error passed: ${r.value2}"));
        }
      } else {
        Transaction? tx = jsonDecode(r.value2[0]) as Transaction?;
        Profile? prf = jsonDecode(r.value2[1]) as Profile?;
        Cookbook? cb = jsonDecode(r.value2[2]) as Cookbook?;
        if (tx == null) {
          completer.completeError(ResponseException(response, "Malformed tx"));
        } else if (prf == null) {
          completer
              .completeError(ResponseException(response, "Malformed profile"));
        } else if (cb == null) {
          completer
              .completeError(ResponseException(response, "Malformed cookbook"));
        } else {
          completer
              .complete(Tuple3<Transaction, Profile, Cookbook>(tx, prf, cb));
        }
      }
    });
    return completer.future;
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
  Future<Tuple3<Transaction, Profile, Recipe>> txUpdateRecipe(
      Recipe recipe) async {
    throw UnimplementedError();
  }
}

/// The Android implementation of the Pylons wallet.
class AndroidWallet extends PylonsWallet {
  AndroidWallet._privateConstructor();

  static final AndroidWallet _instance = AndroidWallet._privateConstructor();

  factory AndroidWallet() {
    return _instance;
  }

  @override
  Future<String> _sendMessage(List<String> msg) async {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
