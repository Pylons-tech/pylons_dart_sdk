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

}