import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

void main() {
  test('Test Profile input from Json Variable', () async {
    var jsonRaw =
        '{"address": "testAddress","name": "testName","coins": {},"items": []}';
    Map<String, dynamic> jsonData = jsonDecode(jsonRaw);
    var testProfileFromJson = Profile.fromJson((jsonData));
    expect(testProfileFromJson.runtimeType, equals(Profile));
    expect(testProfileFromJson.address, equals('testAddress'));
    expect(testProfileFromJson.name, equals('testName'));
    expect(testProfileFromJson.coins.length, equals(0));
    expect(testProfileFromJson.items.length, equals(0));
  });
}
