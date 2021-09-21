import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/features/data/models/wallet_model.dart';
import 'package:pylons_flutter/features/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  @override
  Future<Either<Exception, WalletModel>> createNewWallet() async {
    return await _getWallet(mnemonic: null, privateKey: null);
  }

  @override
  Future<Either<Exception, WalletModel>> getWalletFromKey(
      String privateKey) async {
    return await _getWallet(mnemonic: null, privateKey: privateKey);
  }

  @override
  Future<Either<Exception, WalletModel>> getWalletFromMnemonic(
      String mnemonic) async {
    return await _getWallet(mnemonic: mnemonic, privateKey: null);
  }

  Future<Either<Exception, WalletModel>> _getWallet(
      {String? privateKey, String? mnemonic}) async {
    return Right(WalletModel(
        address: 'address', privateKey: 'privateKey', publicKey: 'publicKey'));
  }
}
