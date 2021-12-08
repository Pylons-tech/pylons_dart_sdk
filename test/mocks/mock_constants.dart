import 'package:fixnum/fixnum.dart';
import 'package:pylons_sdk/pylons_sdk.dart';
import 'package:pylons_sdk/src/generated/pylons/execution.pb.dart';

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
    nodeVersion: MOCK_NODE_VERSION,
    name: "LOUD's Wooden sword lv1 buy recipe",
    description: 'this recipe is used to buy wooden sword lv1.',
    version: MOCK_VERSION,
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

var MOCK_TRADE = Trade(
  creator: MOCK_CREATOR,
  iD: Int64(20211207),
  coinInputs: [],
  itemInputs: [],
  coinOutputs: [],
  itemOutputs: [
    ItemRef(cookbookID: MOCK_COOKBOOK_ID, itemID: MOCK_ITEM_ID),
  ],
  extraInfo: 'extraInfo',
  receiver: '',
  tradedItemInputs: [],
);

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
const String MOCK_EXECUTION_ID = 'executionid';
const String MOCK_RECIPE_VERSION = 'v0.1.3';
const String MOCK_NODE_VERSION = '0.1.3';
const String MOCK_CREATOR = 'pylo1akzpu26f36pgxr636uch8evdtdjepu93v5y9s2';



Cookbook MOCK_COOK_BOOK_OBJECT = Cookbook(
    creator: '',
    iD: MOCK_COOKBOOK_ID,
    name: 'Legend of the Undead Dragon',
    nodeVersion: MOCK_NODE_VERSION,
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
  nodeVersion: MOCK_NODE_VERSION,
  doubles: [],
  longs: [],
  strings: [],
);



Execution MOCK_EXECUTION = Execution(
  creator: MOCK_OWNER,
  iD: MOCK_EXECUTION_ID,
  cookbookID: MOCK_COOKBOOK_ID,
  recipeVersion: MOCK_RECIPE_VERSION,
  nodeVersion: MOCK_NODE_VERSION,


);
