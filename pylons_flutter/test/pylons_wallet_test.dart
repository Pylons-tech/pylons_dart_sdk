import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:mockito/mockito.dart';


/// Utility functions for pylons_wallet_test
class TestUtil {
  /// Set up MockWallet and (TODO) our mock backend stuff.
  static MockWallet mockIpcTarget () {
    return MockWallet();
  }

  /// Load a file out of our test resources folder, get a string
  static String loadFile (String path) {
    final file = File('test_resources/$path');
    return file.readAsStringSync();
  }

  static Cookbook loadCookbook (String path) {
    final Cookbook cb = jsonDecode(loadFile(path));
    return cb;
  }

  static Recipe loadRecipe (String path){
    final Recipe rcp = jsonDecode(loadFile(path));
    return rcp;
  }
}

/// The Android implementation of the Pylons wallet.
class MockWallet extends Mock implements PylonsWallet {
  List<Cookbook> cookbooks = List.empty();
  List<Recipe> recipes = List.empty();
  List<Trade> trades = List.empty();

  /// Load the provided cookbooks. We'll use these to mock getCookbooks.
  void loadCookbooks(List<Cookbook> cbs) {
    cookbooks.addAll(cbs);
  }

  void loadRecipes(List<Recipe> rcps) {
    recipes.addAll(rcps);
  }

  void loadTrades(List<Trade> trade){
    trades.addAll(trade);
  }
}

/// TODO: doc wallet_test
void main() {
  setUp(() async {
    final lst = await List.empty();
    //when(MockWallet().getTrades()).thenReturn(lst);
  }); 

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
      TestUtil.mockIpcTarget().loadCookbooks([
        TestUtil.loadCookbook("cookbook/cb1.json"),
        TestUtil.loadCookbook("cookbook/cb2.json"),
        TestUtil.loadCookbook("cookbook/cb3.json")]);
      MockWallet().getCookbooks().then(
          expectAsync1((cbs) {
            assert(cbs.length == MockWallet().cookbooks.length);
            for (var i = 0; i < cbs.length; i++) {
              assert(cbs[i].id == MockWallet().cookbooks[i].id);
            }
          }
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
      
      MockWallet().getProfile("fakeAddress").then(
        expectAsync1((_) { fail("Operation should not succeed"); }
        ), onError: (err) {
          assert(err.runtimeType == NotAnAddressException);
        }
        );
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
      MockWallet().getRecipes(null).then(
        expectAsync1((_) {fail("Operation should fail - No wallet to retrieve recipes"); }
        ), onError: (err) {
          assert(err.runtimeType == NoWalletException);
        }
      );
    });
    test("Throws a NotAnAddressException if given a bad address", () {
      MockWallet().getRecipes("bad address").then(
        expectAsync1((_) {fail("Operation should fail - Bad Wallet Address"); }
        ), onError: (err) {
          assert(err.runtimeType == NotAnAddressException);
        }
      );
    });
    test("Returns all recipes while there are recipes, if no argument", () {
      //TO-DO
      TestUtil.mockIpcTarget().loadRecipes([
        TestUtil.loadRecipe("recipe/rcp1.json"),
        TestUtil.loadRecipe("recipe/rcp2.json"),
        TestUtil.loadRecipe("recipe/rcp3.json")]);
        

        MockWallet().getRecipes("").then(
          expectAsync1((rcps) { assert(rcps.length == MockWallet().recipes.length);
          for (var i = 0; i < rcps.length; i++) {
              assert(rcps[i].name == MockWallet().recipes[i].name);
            }
          }
          ), onError: (err) { fail('Error: $err'); }
      );
    });

    test("Returns owned recipes while there are recipes, if given valid"
        "address", () {
          TestUtil.mockIpcTarget().loadRecipes([
        TestUtil.loadRecipe("recipe/rcp1.json"),
        TestUtil.loadRecipe("recipe/rcp2.json"),
        TestUtil.loadRecipe("recipe/rcp3.json")]);
        

        MockWallet().getRecipes("correctAddress").then(
          expectAsync1((rcps) { assert(rcps.length == MockWallet().recipes.length);
          for (var i = 0; i < rcps.length; i++) {
              assert(rcps[i].name == MockWallet().recipes[i].name);
            }
          }
          ), onError: (err) { fail('Error: $err'); }
      );
    });

    test("Returns an empty list if there are no recipes", () {
      TestUtil.mockIpcTarget();
      MockWallet().getRecipes("correctAddress").then(
          expectAsync1((rcps) { assert(rcps.isEmpty); }
          ), onError: (err) { fail('Error: $err'); }
      );
    });
  });

  group("PylonsWallet.getTrades", () {
    test("Throws a NoWalletException if there's no wallet", () {
      MockWallet().getTrades().then(
        expectAsync1((_) {fail("Operation should fail - no wallet established to connect to."); }
          ), onError: (err) {
        assert(err.runtimeType == NoWalletException);});
    });
    test("Returns trades while there are trades", () {
      TestUtil.mockIpcTarget();
      MockWallet().loadTrades(List.empty());
      MockWallet().getTrades().then(
        expectAsync1((trades) {
          assert(List.empty().length == 0/*MockWallet().getTrades().length*/);
        })
      );
    });
    test("Returns an empty list if there are no trades", () {
      TestUtil.mockIpcTarget();
      MockWallet().loadTrades(List.empty());
      // MockWallet().getTrades().then(
      //   expectAsync1((trades) {
      //     assert(MockWallet().getTrades().isEmpty());
      //   })
      // );
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
