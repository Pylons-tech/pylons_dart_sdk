library pylons_flutter;

import 'package:pylons_flutter/profile.dart';

/// Object representing a Pylons wallet.
class Wallet {

  Wallet._privateConstructor();

  static final Wallet _instance = Wallet._privateConstructor();

  factory Wallet() {
    return _instance;
  }

  /// Retrieves current state of profile with given address if provided,
  /// or current state of attached wallet's own profile if null.
  /// Calls callback with the retrieved profile as an argument, if the profile
  /// was successfully retrieved, or else with an error.
  /// TODO: What, specifically, is the type of the error we pass if
  /// we fail to retrieve a profile? (Any other type of error ofc just means
  /// our SDK screwed up.)
  void getProfile(String? address, Function(Error? error, Profile? profile) callback) {

  }

}