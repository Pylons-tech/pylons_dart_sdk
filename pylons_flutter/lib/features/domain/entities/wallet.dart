import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String? address;
  final String? privateKey;
  final String? publicKey;

  const Wallet({this.address, this.privateKey, this.publicKey});

  factory Wallet.fromKey({required String privateKey}) {
    throw UnimplementedError();
  }

  factory Wallet.derive({required String mnemonic}) {
    throw UnimplementedError();
  }

  @override
  List<Object> get props => [address!, privateKey!, publicKey!];
}
