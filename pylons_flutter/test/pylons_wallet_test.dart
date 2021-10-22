import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:mockito/mockito.dart';

import 'helper/test_util.dart';
import 'mocks/mockedWallet.dart';

/// TODO: doc wallet_test
void main() {
  setUp(() async {});

  group('PylonsWallet.exists', () {
    test('Returns true when the target exists', () async {
      var target = TestUtil.mockIpcTarget();
      var response = await target.exists();
      expect(true, response);
    });
    test("Returns false when it doesn't", () async {
      var target = TestUtil.mockIpcTarget(exists: false);
      var response = await target.exists();
      expect(false, response);
    });
  });

  group('PylonsWallet.getCookbooks', () {
    test("Throws a NoWalletException if there's no wallet", () async {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.getCookbooks(), throwsA(NoWalletException));
    });
    test('Returns cookbooks while there are cookbooks', () async {
      var mockedWalletWithCookbooks = TestUtil.mockIpcTarget();
      mockedWalletWithCookbooks
          .loadCookbooks([TestUtil.loadCookbook('cookbook/cb1.json')]);
      var cookbooksFromMockedWallet =
          await mockedWalletWithCookbooks.getCookbooks();
      expect(cookbooksFromMockedWallet.length, equals(1));
    });
    test('Returns an empty list if there are no cookbooks', () async {
      var mockedWalletWithNoCookbooks = TestUtil.mockIpcTarget();
      var cookbooksFromMockedWallet =
          await mockedWalletWithNoCookbooks.getCookbooks();
      expect(cookbooksFromMockedWallet, equals(List.empty()));
    });
  });

  group('PylonsWallet.getProfile', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.getProfile(null), throwsA(NoWalletException));
    });
    test('Throws a NotAnAddressException if given a bad address', () {
      var mockWallet = TestUtil.mockIpcTarget();
      expect(() => mockWallet.getProfile('Bad Address'),
          throwsA(NotAnAddressException));
    });
    test("When there's no argument, get the active profile", () {
      var mockWallet = TestUtil.mockIpcTarget();
      expect(Profile, mockWallet.getProfile(null).runtimeType);
    });
    test("When there's a valid address, get the correct profile", () {
      var mockWallet = TestUtil.mockIpcTarget();
      //can i set a profile for our  mocked wallet?
      //expect(Profile("correctAddress", "testName", {},[]), mockWallet.getProfile("correctAddress"));
    });
  });

  group('PylonsWallet.getRecipes', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.getRecipes('not_a_real_address'), throwsA(NoWalletException));
    });
    test('Throws a NotAnAddressException if given a bad address', () {
      throw UnimplementedError('M - REDO');
    });
    test('Returns all recipes while there are recipes, if no argument', () {
      throw UnimplementedError('M - REDO');
    });

    test(
        'Returns owned recipes while there are recipes, if given valid'
        'address', () {
      throw UnimplementedError('M - REDO');
    });

    test('Returns an empty list if there are no recipes', () {
      throw UnimplementedError('M - REDO');
    });
  });

  group('PylonsWallet.getTrades', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.getTrades(), throwsA(NoWalletException));
    });
    test('Returns trades while there are trades', () {
      throw UnimplementedError('M - REDO');
    });
    test('Returns an empty list if there are no trades', () {
      throw UnimplementedError('M - REDO');
    });
  });

  group('PylonsWallet.txBuyItem', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txBuyItem('not_a_real_trade', 'not_a_real_payment'), throwsA(NoWalletException));
    });
    test('Throws a PaymentNotValidException if the payment is garbage', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        'Throws a PaymentNotValidException if the payment is real but'
        'incorrect', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileStateException if insufficient funds', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('Profile state reflects item purchase if TX accepted', () {
      throw UnimplementedError('M - REDO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('M - REDO');
    });
  });

  group('PylonsWallet.txBuyPylons', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txBuyPylons(123, 'not_a_real_payment'), throwsA(NoWalletException));
    });
    test('Throws a PaymentNotValidException if the payment is garbage', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        'Throws a PaymentNotValidException if the payment is real but'
        'incorrect', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileStateException if insufficient funds', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('Profile state reflects item purchase if TX accepted', () {
      throw UnimplementedError('M - REDO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('M - REDO');
    });
  });

  group('PylonsWallet.txCreateCookbook', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txCreateCookbook(TestUtil.loadCookbook('cb1.json')), throwsA(NoWalletException));
    });
    test('Throws a CookbookAlreadyExistsException if the cookbook exists', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileStateException if insufficient funds', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO - M');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO - M');
    });
    test('Profile state reflects cookbook creation costs if TX accepted', () {
      throw UnimplementedError('M - REDO');
      // MockWallet().txCreateCookbook(mockCookbook).then(
      //   assert(testCoins.), onError: (err){
      //     assert(err.runtimeType == ProfileDoesNotExistException);
      //   });
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('TODO - m');
    });
    test(
        'If TX accepted, returned cookbook matches that obtained by using'
        'getCookbooks', () {
      throw UnimplementedError('M - REDO');
    });
  });

  group('PylonsWallet.txCreateRecipe', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txCreateRecipe(TestUtil.loadRecipe('rcp1.json')), throwsA(NoWalletException));
    });
    test('Throws a RecipeValidationException when given a bad recipe', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a RecipeAlreadyExistsException if the recipe already '
        'exists', () {
      throw UnimplementedError('TODO');
    });
    test("Throws a CookbookNotOwnedException if we don't own the cookbook", () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileStateException if insufficient funds', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('Profile state reflects recipe creation costs if TX accepted', () {
      throw UnimplementedError('TODO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('TODO');
    });
    test(
        'If TX accepted, returned recipe matches that obtained by using'
        'getRecipes', () {
      throw UnimplementedError('TODO');
    });
  });

  group('PylonsWallet.txDisableRecipe', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txDisableRecipe('not_a_real_recipe'), throwsA(NoWalletException));
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a RecipeDoesNotExist exception if the recipe doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a RecipeStateException if recipe is disabled', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('If TX accepted, recipe is disabled', () {
      throw UnimplementedError('TODO');
    });
  });

  group('PylonsWallet.txEnableRecipe', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txEnableRecipe('not_a_real_recipe'), throwsA(NoWalletException));
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a RecipeDoesNotExist exception if the recipe doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a RecipeStateException if recipe is enabled', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('If TX accepted, recipe is enabled', () {
      throw UnimplementedError('TODO');
    });
  });

  group('PylonsWallet.txExecuteRecipe', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txExecuteRecipe('not_a_real_cookbook', 'not_a_real_recipe', []), throwsA(NoWalletException));
    });
    test(
        "Throws a RecipeDoesNotExist exception if the recipe doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileStateException if missing recipe inputs', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('If TX accepted, profile state reflects recipe execution', () {
      throw UnimplementedError('TODO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('TODO');
    });
  });

  group('PylonsWallet.txPlaceForSale', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txPlaceForSale(TestUtil.loadItem('itm1.json'), 1), throwsA(NoWalletException));
    });
    test(
        "Throws an ItemDoesNotExist exception if the item doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test("Throws a ItemNotOwnedException if we don't own the item", () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('If TX accepted, profile state reflects trade creation', () {
      throw UnimplementedError('TODO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('TODO');
    });
    test(
        'If TX accepted, returned trade matches that obtained by using'
        'getTrades', () {
      throw UnimplementedError('TODO');
    });
  });

  group('PylonsWallet.txUpdateCookbook', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txUpdateCookbook(TestUtil.loadCookbook('cb1.json')), throwsA(NoWalletException));
    });
    test("Throws a CookbookNotOwnedException if we don't own the cookbook", () {
      throw UnimplementedError('M - REDO');
    });
    test(
        "Throws a CookbookDoesNotExist exception if the cookbook doesn't "
        'exist', () {
      throw UnimplementedError('M - REDO');
    });
    test('Throws a ProfileStateException if insufficient funds', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('M - REDO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test('Profile state reflects cookbook update costs if TX accepted', () {
      throw UnimplementedError('TODO');
    });
    test('If TX rejected, profile state unchanged', () {
      throw UnimplementedError('TODO');
    });
    test(
        'If TX accepted, returned cookbook matches that obtained by using'
        'getCookbooks', () {
      throw UnimplementedError('M - REDO');
    });
  });
  group('PylonsWallet.txUpdateRecipe', () {
    test("Throws a NoWalletException if there's no wallet", () {
      var target = TestUtil.mockIpcTarget(exists: false);
      expect(() => target.txUpdateRecipe(TestUtil.loadRecipe('rcp1.json')), throwsA(NoWalletException));
    });
    test('Throws a RecipeValidationException when given a bad recipe', () {
      throw UnimplementedError('TODO');
    });
    test("Throws a RecipeNotOwnedException if we don't own the recipe", () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a RecipeDoesNotExist exception if the recipe doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test('Throws a ProfileDoesNotExistException if no profile', () {
      throw UnimplementedError('TODO');
    });
    test(
        "Throws a ProfileDoesNotExistException if active profile doesn't "
        'exist', () {
      throw UnimplementedError('TODO');
    });
    test(
        'Throws a NodeInternalErrorException if node errors during '
        'handling', () {
      throw UnimplementedError('TODO');
    });
    test(
        'If TX accepted, returned recipe matches that obtained by using'
        'getRecipes', () {
      throw UnimplementedError('TODO');
    });
  });
}
