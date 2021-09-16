library pylons_flutter_wallet;

import 'package:pylons_flutter/pylons_flutter.dart';

/// Object representing a Pylons wallet.
class Wallet {

  Wallet._privateConstructor();

  static final Wallet _instance = Wallet._privateConstructor();

  factory Wallet() {
    return _instance;
  }

  /// Retrieves all cookbooks belonging to the current profile on the Pylons chain.
  /// Calls callback with the retrieved cookbooks as an argument, if the operation
  /// was successful (even if there are no cookbooks, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  void getCookbooks(Function(Exception? exception, List<Cookbook>? cookbooks) callback) {

  }

  /// Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  /// Calls callback with the retrieved profile as an argument, if the profile
  /// was successfully retrieved, or else with an exception.
  /// If the profile simply doesn't exist, exception will be a
  /// ProfileNotFoundException; otherwise, it's whatever was thrown.
  void getProfile(String? address, Function(Exception? exception, Profile? profile) callback) {

  }

  /// Retrieves a list of recipes on the Pylons chain. If address is provided,
  /// retrieves only recipes belonging to that address; if an empty string is
  /// provided as address, retrieves only recipes belonging to current profile;
  /// otherwise, retrieves all recipes that exist on chain.
  /// Calls callback with the retrieved recipes as an argument, if the operation
  /// was successful (even if there are no recipes, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  void getRecipes(String? address, Function(Exception? exception, List<Recipe>? recipes) callback) {

  }

  /// Retrieves all current trades that exist on the Pylons chain.
  /// Calls callback with the retrieved trades as an argument, if the operation
  /// was successful (even if there are no trades, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  void getTrades(Function(Exception? exception, List<Trade>? trades) callback) {

  }

  /// TODO: Write dartdoc for this
  void txExecuteRecipe (String cookbookId, String recipeId,
      Function(Exception? exception,
          List<Transaction>? txs,
          Profile? profile) callback) {

  }

}