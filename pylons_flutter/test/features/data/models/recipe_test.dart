import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/features/data/models/recipe.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

void main() {
  Recipe testRecipe = Recipe(id: "001",
    nodeVersion: "1.0",
       sender: "n/a",
       disabled: false ,
       name: "testName",
       cookbookId: "notARealCookbookId001",
       description: "description of test recipe",
       extraInfo: "",
       blockInterval: 0,
       coinInputs: [],
       itemInputs: [],
       entries: EntriesList(coinOutputs: [], itemModifyOutputs: [], itemOutputs: []),
       outputs: []);

  test("When generateWebLink called, web link is generated", ()async{
    expect(testRecipe.generateWebLink(), equals("TO DO - DeepLink"), skip: true);
  });
  test("When generateWebLink fails: , ____ exception returned", ()async {
    expect(() => testRecipe.generateWebLink(), throwsA(Exception()), skip: true);
  });

  test("Test Recipe Creation from JSON input", ()async {
    String jsonRaw = '{"id": "001","nodeVersion": "1.0","sender": "n/a","disabled": false ,"name": "testName","cookbookId": "notARealCookbookId001","description": "description of test recipe","extraInfo": "","blockInterval": 0,"coinInputs": [],"itemInputs": [],"entries": [],"outputs": []}';
    Map<String, dynamic> jsonMap = jsonDecode(jsonRaw);
    Recipe testRecipeFromJson = Recipe.fromJson(jsonMap);
    expect(testRecipeFromJson.runtimeType, equals("1.0") );
    expect(testRecipeFromJson.nodeVersion, equals("n/a") );
    expect(testRecipeFromJson.sender, equals("") );
    expect(testRecipeFromJson.disabled, equals(false) );
    expect(testRecipeFromJson.name, equals("testName") );
    expect(testRecipeFromJson.cookbookId, equals("notARealCookbokId001") );
    expect(testRecipeFromJson.description, equals("description of test recipe") );
    expect(testRecipeFromJson.extraInfo, equals("") );
    expect(testRecipeFromJson.blockInterval, equals(0) );
    expect(testRecipeFromJson.coinInputs.length, equals(0) );
    expect(testRecipeFromJson.itemInputs.length, equals(0) );
    //expect(testRecipeFromJson.entries., equals() );
    expect(testRecipeFromJson.outputs.length, equals(0) );
  });

  test("Test Coin Input from Json", () async{
    String jsonRaw = '{"coin": "pylons", "count": 2}';
    Map<String, dynamic> jsonMap = jsonDecode(jsonRaw);
    CoinInput testCoinInputFromJson = CoinInput.fromJson(jsonMap);
    expect(testCoinInputFromJson.coin, equals("pylons"));
    expect(testCoinInputFromJson.count, equals(2));
  });

  test("Test Item Input", () async{
    String jsonRaw = '{"id": "testItem", "conditions": {"doubles": {}, "longs":{}, "strings": {}}, "doubles": {}, "longs":{}, "strings": {}, "transferFee":{}}';
    Map<String, dynamic> jsonMap = new Map<String, dynamic>.from(json.decode(jsonRaw));
    ItemInput testItemInputFromJson = await ItemInput.fromJson(jsonMap);
    expect(testItemInputFromJson.id, equals("testItem"));
    //expect(testItemInputFromJson.conditions.runtimeType, equals(ConditionList));
    //expect(testItemInputFromJson.transferFee.runtimeType, equals(FeeInputParam));
    expect(testItemInputFromJson.doubles.length, equals(0));
    expect(testItemInputFromJson.longs.length, equals(0));
    expect(testItemInputFromJson.strings.length, equals(0));
  });

}