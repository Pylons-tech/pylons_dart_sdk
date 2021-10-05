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

  static Trade loadTrade (String path){
    final Trade trade = jsonDecode(loadFile(path));
    return trade;
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
      TestUtil.mockIpcTarget().loadTrades([
        TestUtil.loadTrade("trade/trade1.json"),
        TestUtil.loadTrade("trade/trade2.json"),
        TestUtil.loadTrade("trade/trade3.json")
      ]);
      MockWallet().getTrades().then(
        expectAsync1((trades) { assert(trades.length == MockWallet().trades.length);
          for (var i = 0; i < trades.length; i++) {
              assert(trades[i].id == MockWallet().trades[i].id);
            }
          }
          ), onError: (err) { fail('Error: $err'); 
        }
      );
    });
    test("Returns an empty list if there are no trades", () {
      TestUtil.mockIpcTarget();
      MockWallet().loadTrades(List.empty());
      expect(MockWallet().getTrades(), hasLength(0));
    });
  });

  group("PylonsWallet.txBuyItem", () {
    test("Throws a NoWalletException if there's no wallet", () {
      MockWallet().txBuyItem("shouldFailTradeId", "shouldFailPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - No wallet to retrieve recipes"); }
        ), onError: (err) {
          assert(err.runtimeType == NoWalletException);
        }
      );
    });
    test("Throws a PaymentNotValidException if the payment is garbage", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyItem("trade1", "failure on payment").then(
        expectAsync1((_) {fail("Operation should fail - Payment is garbage");}
        ), onError: (err){
          assert(err.runtimeType == PaymentNotValidException);
        }
      );
    });
    test("Throws a PaymentNotValidException if the payment is real but"
        "incorrect", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyItem("tradeId1", "incorrectPayment").then(
        expectAsync1((_) {fail("Operation should fail - real payment but incorrect");}
        ), onError:(err){
          assert(err.runtimeType == PaymentNotValidException);
        });
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"pylons": 1};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      MockWallet().txBuyItem("tradeId1", "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - insufficent funds");}),
        onError: (err){
          assert(err.runtimeType == ProfileStateException("Insufficient Funds"));
        }
      );
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      TestUtil.mockIpcTarget();
      Future<Profile> mockedNullProfile = Future<Profile>.value(null);
      when(MockWallet().getProfile(any)).thenReturn(mockedNullProfile);

      MockWallet().txBuyItem("tradeId1", "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - Profile doesn't exist");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"pylons": 1};
      Future<Profile> mockedNullProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedNullProfile);

      MockWallet().txBuyItem("tradeId1", "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - Profile doesn't exist");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects item purchase if TX accepted", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"pylons": 1000};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      //MockWallet().txBuyItem("tradeId1", "testPaymentId").then(null);

    });
    test("If TX rejected, profile state unchanged", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyItem("tradeId2", "falsePayment").then(
        expectAsync1((_) {assert(MockWallet().trades.isEmpty);})
      );
    });
  });

  group("PylonsWallet.txBuyPylons", () {
    test("Throws a NoWalletException if there's no wallet", () {
      MockWallet().txBuyPylons(10, "paymentId").then(
        expectAsync1((_) {fail("Operation should fail - No wallet to retrieve recipes"); }
        ), onError: (err) {
          assert(err.runtimeType == NoWalletException);
        }
      );
    });
    test("Throws a PaymentNotValidException if the payment is garbage", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyPylons(10, "failure on payment").then(
        expectAsync1((_) {fail("Operation should fail - Payment is garbage");}
        ), onError: (err){
          assert(err.runtimeType == PaymentNotValidException);
        }
      );
    });
    test("Throws a PaymentNotValidException if the payment is real but"
        "incorrect", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyPylons(10, "incorrectPayment").then(
        expectAsync1((_) {fail("Operation should fail - real payment but incorrect");}
        ), onError:(err){
          assert(err.runtimeType == PaymentNotValidException);
        });
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"usd": 1};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      MockWallet().txBuyPylons(10, "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - insufficent funds");}),
        onError: (err){
          assert(err.runtimeType == ProfileStateException("Insufficient Funds"));
        }
      );
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      TestUtil.mockIpcTarget();
      Future<Profile> mockedNullProfile = Future<Profile>.value(null);
      when(MockWallet().getProfile(any)).thenReturn(mockedNullProfile);

      MockWallet().txBuyPylons(10, "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - Profile doesn't exist");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"pylons": 1};
      Future<Profile> mockedNullProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedNullProfile);

      MockWallet().txBuyPylons(10, "testPaymentId").then(
        expectAsync1((_) {fail("Operation should fail - Profile doesn't exist");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO");
    });
    test("Profile state reflects item purchase if TX accepted", () {
      TestUtil.mockIpcTarget();
      Map<String, int> testCoins = {"pylons": 1000};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));
      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      //MockWallet().txBuyItem("tradeId1", "testPaymentId").then(null);

    });
    test("If TX rejected, profile state unchanged", () {
      TestUtil.mockIpcTarget();
      MockWallet().txBuyPylons(10, "falsePayment").then(
        /*"TO-DO"*/
        expectAsync1((_) {assert(/*MockWallet().pylons()*/ true);})
      );
    });
  });

  group("PylonsWallet.txCreateCookbook", () {
    test("Throws a NoWalletException if there's no wallet", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      MockWallet().txCreateCookbook(mockCookbook).then(
          expectAsync1((_) { fail("Operation should not succeed"); }
          ), onError: (err) {
        assert(err.runtimeType == NoWalletException);
      }
      );
    });
    test("Throws a CookbookAlreadyExistsException if the cookbook exists", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      TestUtil.mockIpcTarget().loadCookbooks([mockCookbook]);

      MockWallet().txCreateCookbook(mockCookbook).then(
        expectAsync1((_) {fail("Operation should fail - Cookbook already exists");}
        ), onError: (err){
          assert(err.runtimeType == CookbookAlreadyExistsException("name", "sender", "errMsg"));
        });
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      TestUtil.mockIpcTarget().loadCookbooks([mockCookbook]);
      Map<String, int> testCoins = {"pylons": 0};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));

      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      MockWallet().txCreateCookbook(mockCookbook).then(
        expectAsync1((_) {fail("Operation should fail - Insufficient funds");}
        ), onError: (err){
          assert(err.runtimeType == ProfileStateException("Insufficient funds"));
        });
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      TestUtil.mockIpcTarget().loadCookbooks([mockCookbook]);
      Map<String, int> testCoins = {"pylons": 0};
      Future<Profile> mockedProfile = Future<Profile>.value(null);

      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

      MockWallet().txCreateCookbook(mockCookbook).then(
        expectAsync1((_) {fail("Operation should fail - Profile does not exist");}
        ), onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        });
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
      throw UnimplementedError("TODO - M");
    });
    test("Throws a NodeInternalErrorException if node errors during "
        "handling", () {
      throw UnimplementedError("TODO - M");
    });
    test("Profile state reflects cookbook creation costs if TX accepted", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      TestUtil.mockIpcTarget().loadCookbooks([mockCookbook]);
      Map<String, int> testCoins = {"pylons": 100};
      Future<Profile> mockedProfile = Future<Profile>.value(Profile("testAddress", "testProfile", testCoins, []));


      when(MockWallet().getProfile(any)).thenReturn(mockedProfile);

    throw UnimplementedError("TODO - m");
      // MockWallet().txCreateCookbook(mockCookbook).then(
      //   assert(testCoins.), onError: (err){
      //     assert(err.runtimeType == ProfileDoesNotExistException);
      //   });
    });
    test("If TX rejected, profile state unchanged", () {
      throw UnimplementedError("TODO - m");
    });
    test("If TX accepted, returned cookbook matches that obtained by using"
        "getCookbooks", () {
      Cookbook mockCookbook = new Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 1);
      TestUtil.mockIpcTarget().loadCookbooks([mockCookbook]);

      MockWallet().getCookbooks().then(
        expectAsync1((_) {assert(MockWallet().getCookbooks() == mockCookbook);}
        ));
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
      Cookbook cookbook = Cookbook("nodeVersion","id", "name", "description", "version", "developer",  "sender", "supportEmail", 2);
      MockWallet().txUpdateCookbook(cookbook).then(
        expectAsync1((_) {fail("Operation should fail - NoWalletExpection");})
      );
    });
    test("Throws a CookbookNotOwnedException if we don't own the cookbook", () {
      Cookbook cookbook = Cookbook("nodeVersion","id", "name", "description", "version", "developer",  "sender", "***@pylons.tech", 2);
      MockWallet().txUpdateCookbook(cookbook).then(
        expectAsync1((cookbook) {assert(MockWallet().cookbooks.length == 1);
        var emailLength = MockWallet().cookbooks[0].supportEmail.length;
        assert("pylons.tech" == MockWallet().cookbooks[0].supportEmail.substring(emailLength - 11));
            
          }
          ), onError: (err) { fail('Error: $err'); 
        }

      );
    });
    test("Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        "exist", () {
      Cookbook cookbookDoesNotExist = Cookbook("null", "null", "null","null","null","null","null","null",0);
      TestUtil.mockIpcTarget();
      MockWallet().txUpdateCookbook(cookbookDoesNotExist).then(
        expectAsync1((cookbookDoesNotExist) {fail("Operation should fail - cookbook should not exist."); }
          ), onError: (err) {
        assert(err.runtimeType == CookbookDoesNotExistException);});
    });
    test("Throws a ProfileStateException if insufficient funds", () {
      throw UnimplementedError("TODO");
    });
    test("Throws a ProfileDoesNotExistException if no profile", () {
      TestUtil.mockIpcTarget().getProfile(null);
      Cookbook ckbk = Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 0);
      MockWallet().txUpdateCookbook(ckbk).then(
        expectAsync1((_) {fail(" Operation should fail - no profile");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
    });
    test("Throws a ProfileDoesNotExistException if active profile doesn't "
        "exist", () {
          TestUtil.mockIpcTarget();
      when(MockWallet().getProfile(any)).thenReturn(MockWallet().getProfile(null));
      MockWallet().getProfile(null);
      Cookbook ckbk = Cookbook("nodeVersion", "id", "name", "description", "version", "developer", "sender", "supportEmail", 0);
      MockWallet().txUpdateCookbook(ckbk).then(
        expectAsync1((_) {fail(" Operation should fail - no profile");}),
        onError: (err){
          assert(err.runtimeType == ProfileDoesNotExistException);
        }
      );
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
      
      Cookbook originalCkbk = Cookbook("nodeVersion", "id", "originalCookbook", "description", "version", "developer", "sender", "supportEmail", 0);
      TestUtil.mockIpcTarget().loadCookbooks([originalCkbk]);
      Cookbook updatedCkbk = Cookbook("nodeVersion", "id", "updatedCookbook", "description", "version", "developer", "sender", "supportEmail", 0);

      MockWallet().txUpdateCookbook(updatedCkbk).then(
        expectAsync1((updatedCkbk) {
          assert(MockWallet().cookbooks[0].name == "updatedCookbook");
        })
      );
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
  });
}
