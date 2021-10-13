import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

import '../../../helper/test_util.dart';

/// data_serialization_tests contains tests that verify that our data-model types serialize and deserialize to the same structures as
/// those expected by the wallet and the node.
void main() {
  group('Cookbook', () {
    test('Cookbook type serializes correctly', () {
      throw UnimplementedError();
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
      assert(cb.ID == 'cookbookLOUD');
      assert(cb.nodeVersion == 'v0.1.3');
      assert(cb.supportEmail == 'alex@shmeeload.xyz');
      assert(cb.version == 'v0.0.1');
    });
  });
  group('Recipe', () {
    test('Recipe type serializes correctly', () {
      throw UnimplementedError();
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