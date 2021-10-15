/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/generated/cosmos/tx/v1beta1/tx.pb.dart';
import 'package:sacco/models/transactions/export.dart';

import 'generated/pylons/cookbook.pb.dart';
import 'generated/pylons/item.pb.dart';
import 'generated/pylons/recipe.pb.dart';
import 'generated/pylons/trade.pb.dart';
import 'pylons_wallet/pylons_wallet_dev.dart';
import 'pylons_wallet/pylons_wallet_impl.dart';

enum PylonsMode { dev, prod }

/// The PylonsWallet class is the main endpoint developers use for structured,
/// high-level interactions with the Pylons wallet.
abstract class PylonsWallet {
  static PylonsWallet? _instance;

  static PylonsWallet get instance {
    if (_instance == null) {
      throw WalletInitializationNotDone('Sdk not initialized');
    }

    return _instance!;
  }

  /// This method is to used to setup pylons
  /// [Input] : [PylonsMode] tells which net to be used
  ///
  /// This mode will tell the sdk which net to use
  ///
  /// [PylonsMode.prod] main net will be used
  ///
  /// [PylonsMode.dev] test net will be used
  ///
  /// ,
  ///
  /// [host] is the host which is added in android manifest and xcode setup of the 3rd part sdk .
  /// Required for getting the return message from the wallet
  ///
  /// This method can throw the following errors
  ///
  /// [WalletInitializationAlreadyDoneException] :  If user tries to initialize the sdk more than once this error will throw
  static void setup({required PylonsMode mode, required String host}) {
    if (_instance != null) {
      throw WalletInitializationAlreadyDoneException(
          'Wallet is already intialiazed');
    }

    if (PylonsMode.prod == mode) {
      _instance = PylonsWalletImpl(host);
      return;
    }

    if (PylonsMode.dev == mode) {
      _instance = PylonsWalletDevImpl();
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
  Future<String> sendMessage(List<String> msg);

  /// Async: Returns true if an IPC target exists. False otherwise.
  Future<bool> exists();

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
  Future<List<Cookbook>> getCookbooks();

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
  Future<Profile> getProfile(String? address);

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
  Future<List<Recipe>> getRecipes(String? address);

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
  Future<List<Trade>> getTrades();

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
  Future<Tuple2<Tx, Profile>> txBuyItem(
      String tradeId, String paymentId);

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
      int pylons, String paymentId);

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
      Cookbook cookbook);

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
  Future<Tuple3<Transaction, Profile, Recipe>> txCreateRecipe(Recipe recipe);

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
  Future<Transaction> txDisableRecipe(String recipeId);

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
  Future<Transaction> txEnableRecipe(String recipeId);

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
      String cookbookId, String recipeName, List<String> itemIds);

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
      Item item, int price);

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
  Future<Tuple3<StdTx, Profile, Cookbook>> txUpdateCookbook(
      Cookbook cookbook);

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
  Future<Tuple3<Transaction, Profile, Recipe>> txUpdateRecipe(Recipe recipe);
}
