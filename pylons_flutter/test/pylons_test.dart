import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons.dart';

void main() {
  // TODO: set data for tests'
  final testVectors1 = {
    'add test address': 'add test mnemonoc',
  };

  // TODO: set data for tests'
  final testVectors2 = {
    'add test address': 'add test privet key',
  };
  test('Wallets are generated correctly from mnemonic', () {
    testVectors1.forEach((address, mnemonicString) {
      final mnemonic = mnemonicString;
      final wallet = Pylons.walletFromMnemonic(mnemonic: mnemonic);
      expect(wallet.address!, address);
    });
  });

  test('Wallets are generated correctly from keys', () {
    testVectors2.forEach((address, privateKey) {
      final wallet = Pylons.walletFromKey(privateKey: privateKey);
      expect(wallet.address!, address);
    });
  });
}
