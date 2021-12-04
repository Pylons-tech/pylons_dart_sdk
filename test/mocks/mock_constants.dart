import 'package:fixnum/fixnum.dart';
import 'package:pylons_sdk/pylons_sdk.dart';

var MOCK_COOKBOOK = '''{
  "creator": "pylo1akzpu26f36pgxr636uch8evdtdjepu93v5y9s2",
  "ID": "$MOCK_COOKBOOK_ID",
  "name": "Legend of the Undead Dragon",
  "nodeVersion": "v0.1.3",
  "description": "Cookbook for running pylons recreation of LOUD",
  "developer": "Pylons Inc",
  "version": "$MOCK_VERSION",
  "supportEmail": "alex@shmeeload.xyz",
  "costPerBlock": {"denom":  "upylon", "amount":  "1000000"},
  "enabled": true
}''';

var MOCK_RECIPE = Recipe(
    cookbookID: MOCK_COOKBOOK_ID,
    iD: MOCK_RECIPE_ID,
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

const String MOCK_COOKBOOK_ID = 'cookbookLOUD';
const String MOCK_ITEM_ID = 'item_id';
const String MOCK_RECIPE_ID = 'RecipeId';
const String MOCK_RECIPE_NAME = 'recipe name';
const String MOCK_OWNER = 'pyloabs8112932012asjdahk33';
const String MOCK_VERSION = 'v0.0.1';
const String MOCK_HOST = 'example';
const String MOCK_ERR_ = 'example';
const String MOCK_USERNAME = 'Jawad';
const String MOCK_ERR_CODE = 'Something went wrong';



Cookbook MOCK_COOK_BOOK_OBJECT = Cookbook(
    creator: '',
    iD: MOCK_COOKBOOK_ID,
    name: 'Legend of the Undead Dragon',
    nodeVersion: 'v0.1.3',
    description: 'Cookbook for running pylons recreation of LOUD',
    developer: 'Pylons Inc',
    version: 'v0.0.1',
    supportEmail: 'alex@shmeeload.xyz',
    costPerBlock: Coin(denom: 'upylon', amount: '1000000'),
    enabled: true);

Item MOCK_ITEM = Item(
  owner: '',
  cookbookID: MOCK_COOKBOOK_ID,
  iD: MOCK_ITEM_ID,
  nodeVersion: 'v0.1.3',
  doubles: [],
  longs: [],
  strings: [],
);
