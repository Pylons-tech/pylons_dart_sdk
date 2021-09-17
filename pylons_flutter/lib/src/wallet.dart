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
  void getCookbooks(Function(
      Exception? exception,
      List<Cookbook>? cookbooks) callback) {

  }

  /// Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  /// Calls callback with the retrieved profile as an argument, if the profile
  /// was successfully retrieved, or else with an exception.
  /// If the profile simply doesn't exist, exception will be a
  /// ProfileNotFoundException; otherwise, it's whatever was thrown.
  void getProfile(String? address, Function(
      Exception? exception,
      Profile? profile) callback) {

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
  void getRecipes(String? address, Function(
      Exception? exception,
      List<Recipe>? recipes) callback) {

  }

  /// Retrieves all current trades that exist on the Pylons chain.
  /// Calls callback with the retrieved trades as an argument, if the operation
  /// was successful (even if there are no trades, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  void getTrades(Function(
      Exception? exception,
      List<Trade>? trades) callback) {

  }

  /// Creates a transaction to create the provided recipe on the Pylons chain
  /// against the current profile.
  /// A recipe must not already exist at the coordinates of the provided recipe.
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction, the state of the profile after creation of the
  /// recipe, and the recipe as it newly exists on chain as arguments. May,
  /// instead, return one of several exceptions in the event that the
  /// transaction is not successfully executed:
  ///
  /// RecipeValidationException: No TX was created because the recipe failed
  /// basic clientside sanity-checking before one could be built. This could
  /// be because of impossible outputs, etc. The error message provides more
  /// info on why the sanity check failed.
  ///
  /// CookbookNotOwnedException: TX rejected because the active profile is not
  /// the owner of the cookbook in which the recipe was to be created.
  ///
  /// RecipeAlreadyExistsException: TX rejected because recipe already exists
  /// at the provided coordinates.
  ///
  /// ProfileStateException: The active profile was not able to create the
  /// recipe on account of insufficient funds.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  void txCreateRecipe(Recipe recipe, Function(
      Exception? exception,
      Transaction? tx,
      Profile? profile,
      Recipe? recipe
  ) callback) {

  }

  /// Creates a transaction to disable the recipe with the provided real,
  /// on-chain recipe ID against the current profile. Upon successful
  /// resolution of the transaction, calls callback with the created transaction
  /// as an argument. May, instead, return one of several exceptions in the event
  /// that the transaction is not successfully executed:
  ///
  /// RecipeDoesNotExistException: TX rejected because recipe does not exist.
  ///
  /// RecipeNotOwnedException: TX rejected because the active profile is not
  /// the owner of the recipe.
  ///
  /// RecipeStateException: TX rejected because the recipe is already disabled.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  void txDisableRecipe (String recipeId, Function(
      Exception? exception,
      Transaction? tx) callback) {

  }

  /// Creates a transaction to enable the recipe with the provided real,
  /// on-chain recipe ID against the current profile. Upon successful
  /// resolution of the transaction, calls callback with the created transaction
  /// as an argument. May, instead, return one of several exceptions in the event
  /// that the transaction is not successfully executed:
  ///
  /// RecipeDoesNotExistException: TX rejected because recipe does not exist.
  ///
  /// RecipeNotOwnedException: TX rejected because the active profile is not
  /// the owner of the recipe.
  ///
  /// RecipeStateException: TX rejected because the recipe is already enabled.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  void txEnableRecipe (String recipeId, Function(
      Exception? exception,
      Transaction? tx) callback) {

  }

  /// Creates a transaction to execute the recipe with coordinates
  /// cookbookId:recipeName against the current profile. Upon successful
  /// resolution of the transaction, calls callback with the created transaction
  /// and the state of the active profile after execution of the recipe as
  /// arguments. May, instead, return one of several exceptions in the event
  /// that the transaction is not successfully executed:
  ///
  /// RecipeDoesNotExistException: TX rejected because recipe does not exist.
  ///
  /// CookbookDoesNotExistException: TX rejected because cookbook does not exist.
  ///
  /// ProfileStateException: TX rejected because profile doesn't have all
  /// necessary recipe inputs.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  void txExecuteRecipe (String cookbookId, String recipeName,
      Function(Exception? exception,
          Transaction? tx,
          Profile? profile) callback) {

  }

  /// Creates a transaction to update an extant recipe on the Pylons chain
  /// to conform to the one provided against the current profile.
  /// A recipe must already exist at the coordinates of the provided recipe.
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction, the state of the profile after updating the
  /// recipe, and the recipe as it now exists on chain as arguments. May,
  /// instead, return one of several exceptions in the event that the
  /// transaction is not successfully executed:
  ///
  /// RecipeValidationException: No TX was created because the recipe failed
  /// basic clientside sanity-checking before one could be built. This could
  /// be because of impossible outputs, etc. The error message provides more
  /// info on why the sanity check failed.
  ///
  /// RecipeNotOwnedException: TX rejected because the active profile is not
  /// the owner of the recipe to be updated.
  ///
  /// RecipeDoesNotExistException: TX rejected because the recipe to be
  /// updated does not exist on the Pylons chain.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  void txUpdateRecipe(Recipe recipe, Function(
      Exception? exception,
      Transaction? tx,
      Profile? profile,
      Recipe? recipe
      ) callback) {

  }
}