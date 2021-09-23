import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

/// Utility functions for pylons_wallet_test
class TestUtil {
  /// Set up MockWallet and (TODO) our mock backend stuff.
  static void mockIpcTarget () {
    MockWallet();
  }
}

/// The Android implementation of the Pylons wallet.
class MockWallet extends PylonsWallet {
  MockWallet._privateConstructor(): super();

  static final MockWallet _instance = MockWallet._privateConstructor();

  factory MockWallet() {
    return _instance;
  }
}

/// TODO: doc wallet_test
void main() {
  group("PylonsWallet.exists", () {
    test("Returns true when the target exists", () {
      TestUtil.mockIpcTarget();
      PylonsWallet.exists().then(
          expectAsync1((value) {value == true;}
          ), onError: (err) { fail('Error: $err'); }
      );
    });
    test("Returns false when it doesn't", () {
      // We don't mock the IPC target here, since we want exists to return false
      PylonsWallet.exists().then(
          expectAsync1((value) {value == false;}
          ), onError: (err) { fail('Error: $err'); }
      );
    });
  });

  group("PylonsWallet.getCookbooks", () {
    test("Throws a NoWalletException if there's no wallet", () {
      // We don't mock the IPC target here, since we want a NoWalletException
      MockWallet().getCookbooks().then(
          expectAsync1((_) { fail("Operation should not succeed"); }
          ), onError: (err) {
        assert(err.runtimeType == NoWalletException);
      }
      );
    });
    test("Returns cookbooks while there are cookbooks", () {
      // TODO: load some cookbooks
      //  (what's an idiomatic way to handle the fixtures?)
      TestUtil.mockIpcTarget();
      MockWallet().getCookbooks().then(
          expectAsync1((cbs) {  } // TODO: compare cookbooks efficiently
          ), onError: (err) { fail('Error: $err'); }
      );
    });
    test("Returns an empty list if there are no cookbooks", () {
      TestUtil.mockIpcTarget();
      MockWallet().getCookbooks().then(
          expectAsync1((cbs) { assert(cbs.isEmpty); }
          ), onError: (err) { fail('Error: $err'); }
      );
    });
  });

  group("PylonsWallet.getProfile", () {
    test("Throws a NoWalletException if there's no wallet", () {
      // We don't mock the IPC target here, since we want a NoWalletException
      MockWallet().getProfile(null).then(
          expectAsync1((_) { fail("Operation should not succeed"); }
          ), onError: (err) {
        assert(err.runtimeType == NoWalletException);
      }
      );
    });
    test("Throws a NotAnAddressException if given a bad address", () {
      throw UnimplementedError("TODO");
    });
    test("When there's no argument, get the active profile", () {
      throw UnimplementedError("TODO");
    });
    test("When there's a valid address, get the correct profile", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.getRecipes", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NotAnAddressException if given a bad address", () {
      throw UnimplementedError("TODO");
    });
    test("Returns all recipes while there are recipes, if no argument", () {
      throw UnimplementedError("TODO");
    });
    test("Returns owned recipes while there are recipes, if given valid"
        "address", () {
      throw UnimplementedError("TODO");
    });
    test("Returns an empty list if there are no recipes", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.getTrades", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Returns trades while there are trades", () {
      throw UnimplementedError("TODO");
    });
    test("Returns an empty list if there are no trades", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txBuyItem", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a PaymentNotValidException if the payment is garbage", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a PaymentNotValidException if the payment is real but"
        "incorrect", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects item purchase if TX accepted", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txBuyPylons", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a PaymentNotValidException if the payment is garbage", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a PaymentNotValidException if the payment is real but"
        "incorrect", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects pylons purchase if TX accepted", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txCreateCookbook", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookAlreadyExistsException if the cookbook exists", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects cookbook creation costs if TX accepted", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, returned cookbook matches that obtained by using"
        "getCookbooks", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txCreateRecipe", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeValidationException when given a bad recipe", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeAlreadyExistsException if the recipe already "
        "exists", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookNotOwnedException if we don't own the cookbook", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects recipe creation costs if TX accepted", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, returned recipe matches that obtained by using"
        "getRecipes", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txDisableRecipe", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeDoesNotExist exception if the recipe doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeStateException if recipe is disabled", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, recipe is disabled", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txEnableRecipe", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeDoesNotExist exception if the recipe doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeStateException if recipe is enabled", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, recipe is enabled", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txExecuteRecipe", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeDoesNotExist exception if the recipe doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if missing recipe inputs", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, profile state reflects recipe execution", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txPlaceForSale", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws an ItemDoesNotExist exception if the item doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ItemNotOwnedException if we don't own the item", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, profile state reflects trade creation", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, returned trade matches that obtained by using"
        "getTrades", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txUpdateCookbook", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookNotOwnedException if we don't own the cookbook", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects cookbook update costs if TX accepted", () {
      throw UnimplementedError("TODO");
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, returned cookbook matches that obtained by using"
        "getCookbooks", () {
      throw UnimplementedError("TODO");
    });
  });

  group("PylonsWallet.txUpdateRecipe", () {
    test("Throws a NoWalletException if there's no wallet", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeValidationException when given a bad recipe", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a RecipeDoesNotExist exception if the recipe doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("If TX accepted, returned recipe matches that obtained by using"
        "getRecipes", () {
      throw UnimplementedError("TODO");
    });
  });
}
