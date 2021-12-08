import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/pylons_sdk.dart';
import 'package:pylons_sdk/src/features/validations/validate_recipe.dart';

void main() {
  test('should throw error on empty cookbook name ', () {
    var recipe = Recipe(
        cookbookID: '',
        iD: '',
        nodeVersion: 'v0.1.3',
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: 'this recipe is used to buy wooden sword lv1.',
        version: 'v0.1.3',
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: 'copper_sword_lv1',
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ['copper_sword_lv1'], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: false,
        extraInfo: 'extraInfo');

    expect(() => ValidateRecipe.validate(recipe), throwsA(isA<RecipeValidationException>()));
  });

  test('should throw error on empty recipe id ', () {
    var recipe = Recipe(
        cookbookID: 'JawadCookBook',
        iD: '',
        nodeVersion: 'v0.1.3',
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: 'this recipe is used to buy wooden sword lv1.',
        version: 'v0.1.3',
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: 'copper_sword_lv1',
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ['copper_sword_lv1'], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: false,
        extraInfo: 'extraInfo');

    expect(() => ValidateRecipe.validate(recipe), throwsA(isA<RecipeValidationException>()));
  });

  test('should throw error on short recipe name ', () {
    var recipe = Recipe(
        cookbookID: 'JawadCookBook',
        iD: '12342312',
        nodeVersion: 'v0.1.3',
        name: "LOUD's",
        description: 'this recipe is used to buy wooden sword lv1.',
        version: 'v0.1.3',
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: 'copper_sword_lv1',
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ['copper_sword_lv1'], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: false,
        extraInfo: 'extraInfo');

    expect(() => ValidateRecipe.validate(recipe), throwsA(isA<RecipeValidationException>()));
  });

  test('should throw error on short recipe description ', () {
    var recipe = Recipe(
        cookbookID: 'JawadCookBook',
        iD: '12342312',
        nodeVersion: 'v0.1.3',
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: 'this recipe ',
        version: 'v0.1.3',
        coinInputs: [],
        itemInputs: [],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: 'copper_sword_lv1',
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ['copper_sword_lv1'], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: false,
        extraInfo: 'extraInfo');

    expect(() => ValidateRecipe.validate(recipe), throwsA(isA<RecipeValidationException>()));
  });

  test('should throw error on empty item inputs', () {
    var recipe = Recipe(
        cookbookID: 'JawadCookBook',
        iD: '12342312',
        nodeVersion: 'v0.1.3',
        name: "LOUD's Wooden sword lv1 buy recipe",
        description: 'this recipe is used to buy wooden sword lv1.',
        version: 'v0.1.3',
        coinInputs: [],
        itemInputs: [ItemInput()..createEmptyInstance()],
        entries: EntriesList(coinOutputs: [], itemOutputs: [
          ItemOutput(
            iD: 'copper_sword_lv1',
            doubles: [],
            longs: [],
            strings: [],
            mutableStrings: [],
            transferFee: [],
            tradePercentage: DecString.decStringFromDouble(0.1),
            tradeable: true,
          ),
        ], itemModifyOutputs: []),
        outputs: [
          WeightedOutputs(entryIDs: ['copper_sword_lv1'], weight: Int64(1))
        ],
        blockInterval: Int64(0),
        enabled: false,
        extraInfo: 'extraInfo');

    expect(() => ValidateRecipe.validate(recipe), throwsA(isA<RecipeValidationException>()));
  });
}
