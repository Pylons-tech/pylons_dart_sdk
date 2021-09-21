import 'package:flutter/cupertino.dart';
import 'package:pylons_flutter/features/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  const WalletModel(
      {required String address,
      required String privateKey,
      required String publicKey})
      : super(address: address, privateKey: privateKey, publicKey: publicKey);

  factory WalletModel.derive({required String mnemonic}) {
    return WalletModel(
        address: 'add test address', privateKey: '', publicKey: '');
  }

  factory WalletModel.fromKey({required String privateKey}) {
    return WalletModel(
        address: 'add test address', privateKey: '', publicKey: '');
  }

  @override
  Future<bool> exists() {
    // TODO: implement exists
    throw UnimplementedError();
  }
}
