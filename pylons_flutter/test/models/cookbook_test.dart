import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/features/data/models/cookbook.dart';

import '../helper/test_util.dart';

void main() {

  test("AutoCookbook generation returns Cookbook", () async{
    Cookbook testAutoCb = Cookbook.auto("TestCookbook");
    expect(testAutoCb.runtimeType, Cookbook);
  });


  
    test("Test Cookbook from Json", () async{
      String jsonRaw = '{"nodeVersion": "1.0","id": "notARealCookbook001","name": "notARealCookbook001","description": "notARealCookbook001","version": "1.0","developer": "n/a","sender": "","supportEmail": "example@example.com","costPerBlock": 1}';
      Map<String, dynamic> jsonData = jsonDecode(jsonRaw);
      Cookbook testCookbookFromJson = Cookbook.fromJson((jsonData));
      expect(testCookbookFromJson.runtimeType, equals(Cookbook));
      expect(testCookbookFromJson.nodeVersion, equals("1.0"));
      expect(testCookbookFromJson.name, equals("notARealCookbook001"));
      expect(testCookbookFromJson.description, equals("notARealCookbook001"));
      expect(testCookbookFromJson.version, equals("1.0"));
      expect(testCookbookFromJson.developer, equals("n/a"));
      expect(testCookbookFromJson.sender, equals(""));
      expect(testCookbookFromJson.supportEmail, equals("example@example.com"));
      expect(testCookbookFromJson.costPerBlock, equals(1));

    });

}