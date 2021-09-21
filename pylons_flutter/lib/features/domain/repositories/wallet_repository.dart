import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/features/data/models/wallet_model.dart';

abstract class WalletRepository {
  Future<Either<Exception, WalletModel>> getWalletFromKey(String privateKey);

  Future<Either<Exception, WalletModel>> getWalletFromMnemonic(String mnemonic);

  Future<Either<Exception, WalletModel>> createNewWallet();
}
