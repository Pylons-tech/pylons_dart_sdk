import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/features/data/models/cookbook.dart';
import 'package:pylons_flutter/src/features/data/models/recipe.dart';

import '../../../helper/test_util.dart';

/// data_serialization_tests contains tests that verify that our data-model types serialize and deserialize to the same structures as
/// those expected by the wallet and the node.
void main() {
  group('Cookbook', () {
    test('Cookbook type serializes correctly', () {
      final cb = Cookbook(
          creator: 'pylo1akzpu26f36pgxr636uch8evdtdjepu93v5y9s2',
          iD: 'cookbookLOUD',
          name: 'Legend of the Undead Dragon',
          nodeVersion: 'v0.1.3',
          description: 'Cookbook for running pylons recreation of LOUD',
          developer: 'Pylons Inc',
          version: 'v0.0.1',
          supportEmail: 'alex@shmeeload.xyz',
          costPerBlock: CostPerBlock(denom: 'upylon', amount: '1000000'),
          enabled: true);
      const encoder = JsonEncoder();
      final encoded = encoder.convert(cb.toJson());
      // We have to do the encode/decode because we can't otherwise easily guarantee the same whitespace rules, but
      // we never convert the decoded json into a data type. We just consume the json, then emit it immediately.
      final decoded = encoder.convert(JsonDecoder().convert(TestUtil.loadFile('cookbook/cookbook_from_node.json')));
      assert(encoded == decoded);
    });
    test('Cookbook JSON from remote deserializes correctly', () {
      late final Cookbook cb;
      expect(() => cb = TestUtil.loadCookbook('cookbook/cookbook_from_node.json'), returnsNormally,
          reason: 'Deserialization failed');
      assert(cb.enabled == true);
      assert(cb.name == 'Legend of the Undead Dragon');
      assert(cb.costPerBlock.amount == '1000000');
      assert(cb.costPerBlock.denom == 'upylon');
      assert(cb.creator == 'pylo1akzpu26f36pgxr636uch8evdtdjepu93v5y9s2');
      assert(cb.developer == 'Pylons Inc');
      assert(cb.description == 'Cookbook for running pylons recreation of LOUD');
      assert(cb.iD == 'cookbookLOUD');
      assert(cb.nodeVersion == 'v0.1.3');
      assert(cb.supportEmail == 'alex@shmeeload.xyz');
      assert(cb.version == 'v0.0.1');
    });
  });
  group('Recipe', () {
    test('Recipe type serializes correctly', () {
      final r = Recipe(
          enabled: true,
          name: 'LOUDGetCharacter123125',
          cookbookId: 'cookbookLOUD',
          description: 'Creates a basic character in LOUD',
          extraInfo: 'extraInfo',
          version: 'v0.0.1',
          coinInputs: [],
          itemInputs: [],
          entries: EntriesList(coinOutputs: [],itemModifyOutputs: [],itemOutputs: [
            ItemOutput(
                doubles: [DoubleParam('1.000000000000000000', 'XP', [], '1')],
                longs: [],
                strings: [],
                transferFee: 0)
          ]),
          outputs: []);
      const encoder = JsonEncoder();
      final encoded = encoder.convert(r.toJson());
      // We have to do the encode/decode because we can't otherwise easily guarantee the same whitespace rules, but
      // we never convert the decoded json into a data type. We just consume the json, then emit it immediately.
      final decoded = encoder.convert(JsonDecoder().convert(TestUtil.loadFile('recipe/recipe_from_node.json')));
      assert(encoded == decoded);
    });
    test('Recipe JSON from remote deserializes correctly', () {
      throw UnimplementedError();
    });
  });
  group('Trade', () {
    test('Trade type serializes correctly', () {
      throw UnimplementedError();
    });
    test('Trade JSON from remote deserializes correctly', () {
      throw UnimplementedError();
    });
  });
}