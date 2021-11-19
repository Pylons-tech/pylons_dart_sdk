import 'package:dartz/dartz.dart';
import 'package:pylons_sdk/core/bech32_cosmos.dart';

class AccAddress {
  /// The number of bytes in an address
  static const addressLength = 20;

  /// Main prefix for all Bech32 strings
  static const bech32MainPrefix = 'cosmos';

  /// Prefix part for account keys
  static const prefixAccount = 'acc';

  /// Prefix part for public keys
  static const prefixPublic = 'pub';

  /// Prefix part for addresses
  static const prefixAddress = 'addr';

  /// Account address prefix is just main Bech32 prefix
  static const bech32PrefixAccAddr = bech32MainPrefix;

  /// Public key prefix is main Bech32 prefix + [prefixPublic]
  static const bech32PrefixAccPub = bech32MainPrefix + prefixPublic;

  /// Verifies that the provided string [address] matches the Cosmos address format.
  ///
  /// Returns a [Tuple2] of a string containing additional information (in the event
  /// that verification fails) and a bool which is true if the address fits format,
  /// false otherwise.
  static Tuple2<String, bool> verifyAddress(String address) {
    var bech = Bech32Cosmos.decodeAndConvert(address);
    if (bech.hrp != 'cosmos') {
      return Tuple2('Address does not start with correct prefix', false);
    }
    if (bech.data.isEmpty) {
      return Tuple2('Address is empty', false);
    }
    if (bech.data.length != addressLength) {
      return Tuple2('Address length is incorrect', false);
    }
    return Tuple2('', true);
  }
}
