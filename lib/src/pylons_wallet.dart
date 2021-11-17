/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.

import 'dart:async';

import 'package:dartz/dartz.dart';
import '../pylons_sdk.dart';
import 'features/models/sdk_ipc_message.dart';
import 'generated/pylons/cookbook.pb.dart';
import 'generated/pylons/item.pb.dart';
import 'generated/pylons/payment_info.pb.dart';
import 'generated/pylons/recipe.pb.dart';
import 'generated/pylons/trade.pb.dart';
import 'features/models/sdk_ipc_response.dart';
import 'pylons_wallet/pylons_wallet_dev.dart';
import 'pylons_wallet/pylons_wallet_impl.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

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

  /// Initializes the wallet model.
  ///
  /// [mode] identifies which chain will be used - [PylonsMode.prod] will run on mainnet; [PylonsMode.dev] will run on testnet.
  ///
  /// [host] is the host to be used in an Android manifest and/or XCode setup, and is required for getting a respponse
  /// from the wallet.
  ///
  /// Throws [WalletInitializationAlreadyDoneException] if called while already initialized.
  static void setup({required PylonsMode mode, required String host}) {
    if (_instance != null) {
      throw WalletInitializationAlreadyDoneException(
          'Wallet is already initialized');
    }

    if (mode == PylonsMode.prod) {
      _instance =
          PylonsWalletImpl(host: host, uniLink: UniLinksPlatform.instance);
      return;
    }

    if (mode == PylonsMode.dev) {
      _instance = PylonsWalletDevImpl(host, UniLinksPlatform.instance);
      return;
    }
  }

  /// Async: Send the provided message over the IPC channel, then retrieve a
  /// response.
  ///
  /// [sdkipcMessage] is the prebuilt message to be sent; [completer] is the completer which will
  /// generate the final response.
  Future<SDKIPCResponse> sendMessage(SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse> completer);

  /// Async: Returns true if an IPC target exists. False otherwise.
  Future<bool> exists();

  /// Async: Retrieves all cookbooks belonging to the current profile on the
  /// Pylons chain.
  ///
  /// Response's data field is a [List]<[Cookbook]> containing the retrieved cookbooks.
  /// This will ordinarily be "successful" even if there are no cookbooks to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> getCookbooks();

  /// Async: Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  ///
  /// Response's data field is the retrieved [Profile].
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> getProfile();

  /// Async: Retrieves a list of recipes on the Pylons chain.
  ///
  /// If address is provided, retrieves only recipes belonging to that address; if an empty
  /// string is provided as address, retrieves only recipes belonging to current
  /// profile; otherwise, retrieves all recipes that exist on chain.
  ///
  /// Response's data field is a [List]<[Recipe]> containing the retrieved recipes.
  /// This will ordinarily be "successful" even if there are no recipes to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> getRecipes(String? address);

  /// Async: Retrieves all current trades that exist on the Pylons chain.
  ///
  /// Response's data field is a [List]<[Trade]> containing the retrieved trades. This will
  /// ordinarily be "successful" even if there are no trades to be retrieved,
  /// in which case it'll just give you an empty list.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> getTrades();

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
  /// Upon successful resolution of the transaction, response's data field is
  /// the state of the [Profile] after buying the item.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txBuyItem(
      String tradeId, String paymentId);

  /// Async: Creates a transaction to buy the provided number of Pylons using a
  /// third-party payment processor.
  ///
  /// TODO: Comprehensive list of processors and what they use paymentId for.
  /// (I know we have Stripe integration; dunno if Google Play pylons purchase
  /// is still a thing.)
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the state of the [Profile] after buying the Pylons.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txBuyPylons(int pylons, String paymentId);

  /// Async: Creates a transaction to create the provided [Cookbook] on the
  /// Pylons chain against the current profile.
  ///
  /// A cookbook with the same name as the provided one must not already exist.
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the [Cookbook] as it newly exists on chain.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook);

  /// Async: Creates a transaction to create the provided [Recipe] on the Pylons
  /// chain against the current profile.
  ///
  /// A recipe must not already exist at the coordinates of the provided recipe.
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the [Recipe] as it newly exists on chain.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe);

  /// DEPRECATED, DO NOT USE
  ///
  /// Use UpdateRecipe and edit the enabled/disabled field instead.
  ///
  /// TODO: Remove this.
  Future<SDKIPCResponse> txDisableRecipe(String recipeId);

  /// DEPRECATED, DO NOT USE
  ///
  /// Use UpdateRecipe and edit the enabled/disabled field instead.
  ///
  /// TODO: Remove this.
  Future<SDKIPCResponse> txEnableRecipe(
      String cookBookId, String recipeId, String version);

  /// Async: Creates a transaction to execute the recipe with coordinates
  /// [cookbookId] : [recipeName] against the current profile.
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the state of the active [Profile] after execution of the recipe.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txExecuteRecipe(
      {required String cookbookId,
      required String recipeName,
      required List<String> itemIds,
      required int coinInputIndex,
      required List<PaymentInfo> paymentInfo});

  /// Async: Creates a transaction to post a trade of the provided [Item] for a
  /// price in pylons against the current profile.
  ///
  /// The active profile must own the item.
  ///
  /// Upon successful resolution of the transaction, response's data field is a
  /// [Tuple2] the state of the [Profile] after creation of the
  /// trade and the [Trade] as it newly exists on chain.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txPlaceForSale(Item item, int price);

  /// Async: Creates a transaction to updates the provided [Cookbook] on the
  /// Pylons chain to match that provided against the current profile.
  ///
  /// A cookbook with the same name as the provided one must already exist and
  /// be owned by the active profile.
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the [Cookbook] as it now exists on chain.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook);

  /// Async: Creates a transaction to updates the provided [Recipe] on the
  /// Pylons chain to match that provided against the current profile.
  ///
  /// A recipe must already exist at the coordinates of the provided recipe,
  /// and be owned by the current profile..
  ///
  /// Upon successful resolution of the transaction, response's data field is
  /// the [Recipe] as it now exists on chain.
  ///
  /// Error field may list one of the following exceptions in the event that the
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
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe);
}
