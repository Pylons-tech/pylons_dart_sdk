import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/core/bech32_cosmos.dart';


class AccAddress {
  /// The number of bytes in an address
  static const addressLength = 20;

  /// The bech32 prefix of an address
  static const bech32MainPrefix = 'cosmos';

  /// PrefixAccount is the prefix for account keys
  static const prefixAccount = 'acc';

  /// PrefixPublic is the prefix for public keys
  static const prefixPublic = 'pub';

  /// PrefixAddress is the prefix for addresses
  static const prefixAddress = 'addr';

  /// Bech32PrefixAccAddr defines the Bech32 prefix of an account's address
  static const bech32PrefixAccAddr = bech32MainPrefix;

  /// Bech32PrefixAccPub defines the Bech32 prefix of an account's public key
  static const bech32PrefixAccPub = bech32MainPrefix + prefixPublic;

  /// Verifies that the provided string [address] matches the Cosmos address format.
  /// Returns a [Tuple2] of a string containing additional information (in the event
  /// that verification fails) and a bool
  static Tuple2<String, bool> verifyAddress(String address) {
    var bech = Bech32Cosmos.decodeAndConvert(address);
    if (bech.hrp != 'cosmos') {
      return Tuple2('Address does not start with correct prefix', false);
    }
    var bz = <int>[3];
    if (bech.data.isEmpty) {
      return Tuple2('Address is empty', false);
    }
    if (bech.data.length != addressLength) {
      return Tuple2('Address length is incorrect', false);
    }
    return Tuple2('', true);
  }
}
