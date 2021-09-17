library pylons_flutter_wallet;

import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:dartz/dartz.dart';

/// Object representing a Pylons wallet.
abstract class Wallet {

  /// Retrieves the AndroidWallet instance.
  static void android() => AndroidWallet();

  /// Calls callback with true if an IPC target exists; false otherwise.
  Future<bool> exists ();

  /// Retrieves all cookbooks belonging to the current profile on the Pylons chain.
  /// Calls callback with the retrieved cookbooks as an argument, if the operation
  /// was successful (even if there are no cookbooks, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  Future<List<Cookbook>> getCookbooks() {
    throw UnimplementedError();
  }

  /// Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  /// Calls callback with the retrieved profile as an argument, if the profile
  /// was successfully retrieved, or else with an exception.
  /// If the profile simply doesn't exist, exception will be a
  /// ProfileNotFoundException; otherwise, it's whatever was thrown.
  Future<Profile> getProfile(String? address) {
    throw UnimplementedError();
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
  Future<List<Recipe>> getRecipes(String? address) {
    throw UnimplementedError();
  }

  /// Retrieves all current trades that exist on the Pylons chain.
  /// Calls callback with the retrieved trades as an argument, if the operation
  /// was successful (even if there are no trades, in which case an empty list
  /// is provided) or else with an exception. Since there's no normal way for
  /// this operation to fail, an exception will only be passed in the result of
  /// faulty behavior on the part of this library.
  Future<List<Trade>> getTrades() {
    throw UnimplementedError();
  }

  /// Creates a transaction to buy an item using either Pylons or a third-
  /// party payment processor.
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
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction and the state of the profile after buying the item as
  /// arguments. May, instead, return one of several exceptions in the event
  /// that the transaction is not successfully executed:
  ///
  /// PaymentNotValidException: The paymentId does not exist, or is not for the
  /// item being purchased.
  ///
  /// ProfileStateException: The active profile has insufficient Pylons for an
  /// item being purchased using Pylons.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  Future<Tuple2<Transaction, Profile>> txBuyItem(String tradeId, String paymentId) {
    throw UnimplementedError();
  }

  /// Creates a transaction to buy the provided number of Pylons using a third-
  /// party payment processor.
  ///
  /// TODO: Comprehensive list of processors and what they use paymentId for.
  /// (I know we have Stripe integration; dunno if Google Play pylons purchase
  /// is still a thing.)
  ///
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction and the state of the profile after buying Pylons as
  /// arguments. May, instead, return one of several exceptions in the event
  /// that the transaction is not successfully executed:
  ///
  /// PaymentNotValidException: The paymentId does not exist, or is not for the
  /// number of pylons we're attempting to purchase.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  Future<Tuple2<Transaction, Profile>> txBuyPylons(int pylons, String paymentId) {
    throw UnimplementedError();
  }

  /// Creates a transaction to create the provided cookbook on the Pylons chain
  /// against the current profile.
  /// A cookbook with the same name as the provided one must not already exist.
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction, the state of the profile after creation of the
  /// cookbook, and the cookbook as it newly exists on chain as arguments. May,
  /// instead, return one of several exceptions in the event that the
  /// transaction is not successfully executed:
  ///
  /// CookbookAlreadyExistsException: TX rejected because a cookbook with the
  /// provided name already exists.
  ///
  /// ProfileStateException: The active profile was not able to create the
  /// cookbook on account of insufficient funds.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  Future<Tuple3<Transaction, Profile, Cookbook>> txCreateCookbook(Cookbook cookbook) {
    throw UnimplementedError();
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
  Future<Tuple3<Transaction, Profile, Recipe>> txCreateRecipe(Recipe recipe) {
    throw UnimplementedError();
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
  Future<Transaction> txDisableRecipe (String recipeId) {
    throw UnimplementedError();
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
  Future<Transaction> txEnableRecipe (String recipeId) {
    throw UnimplementedError();
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
  Future<Tuple2<Transaction, Profile>> txExecuteRecipe (String cookbookId, String recipeName) {
    throw UnimplementedError();
  }

  /// Creates a transaction to post a trade of the provided item for a price
  /// in pylons against the current profile.
  /// The active profile must own the item.
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction, the state of the profile after creation of the
  /// trade, and the trade as it newly exists on chain as arguments. May,
  /// instead, return one of several exceptions in the event that the
  /// transaction is not successfully executed:
  ///
  /// ItemNotOwnedException: TX rejected because the active profile is not
  /// the owner of the item to be placed for sale.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale (Item item, int price) {
    throw UnimplementedError();
  }

  /// Creates a transaction to updates the provided cookbook on the Pylons chain
  /// to match that provided against the current profile.
  /// A cookbook with the same name as the provided one must already exist and
  /// be owned by the active profile.
  /// Upon successful resolution of the transaction, calls callback with the
  /// created transaction, the state of the profile after the cookbook is
  /// updated, and the cookbook as it now exists on chain as arguments. May,
  /// instead, return one of several exceptions in the event that the
  /// transaction is not successfully executed:
  ///
  /// CookbookNotOwnedException: TX rejected because the active profile is not
  /// the owner of the cookbook to be updated.
  ///
  /// CookbookDoesNotExistException: TX rejected because a cookbook with the
  /// provided name already exists.
  ///
  /// ProfileStateException: The active profile was not able to create the
  /// cookbook on account of insufficient funds.
  ///
  /// ProfileDoesNotExistException: TX rejected because profile doesn't exist
  /// on the chain.
  ///
  /// NodeInternalErrorException: TX rejected because the Pylons node had an
  /// internal error. This shouldn't be seen in production.
  ///
  /// If the operation fails due to an exception thrown by this library, that
  /// exception will be passed directly.
  Future<Tuple3<Transaction, Profile, Cookbook>> txUpdateCookbook(Cookbook cookbook) {
    throw UnimplementedError();
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
  Future<Tuple3<Transaction, Profile, Recipe>> txUpdateRecipe(Recipe recipe) {
    throw UnimplementedError();
  }
}

/// The Android implementation of the Pylons wallet.
class AndroidWallet extends Wallet {
  AndroidWallet._privateConstructor();

  static final AndroidWallet _instance = AndroidWallet._privateConstructor();

  factory AndroidWallet() {
    return _instance;
  }

  @override
  Future<bool> exists() {
    // TODO: implement exists
    throw UnimplementedError();
  }
}