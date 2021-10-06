import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

/// Utilities for building/checking messages for the current message protocol.
/// (Since this protocol is ad-hoc, specific, and strictly temporary, these may
/// be weird or fiddly or otherwise awkward to work with.)
class PylonsWalletCommUtil {
  static void validateExists(PylonsWallet wallet, Completer completer) {
    wallet.exists().then((bool v) {
      if (v == false) {
        completer.completeError(NoWalletException());
      }
    });
  }

  static bool validateAddress(String? address, Completer completer) {
    throw UnimplementedError();
  }

  static bool validateRecipe(Recipe recipe, Completer completer) {
    throw UnimplementedError();
  }

  static bool responseIsError(String v, String key) {
    return v == "err_$key";
  }

  static void validateResponseMatchesKey(
      String key, Tuple2<String, List<String>> response, Completer completer) {
    if ((response.value1 != "response_$key" && response.value1 != "err_$key")) {
      completer.completeError(ResponseException(
          const JsonEncoder().convert(response), "Bad response: $response"));
    }
  }

  static bool procError(String err, Tuple2<String, List<String>> response,
      Exception exception, Completer completer) {
    if (response.value2[0] == err) {
      try {
        completer.completeError(exception);
      } catch (e) {
        completer.completeError(UnhandledErrorException(
            err, "Bad error passed: ${response.value2}"));
      }
    }
    return response.value2[0] == err;
  }

  static Tuple2<String, List<String>> procResponse(String response) {
    Utf8Decoder decoder = const Utf8Decoder();
    List<String> splut = response.split(',');
    String key = decoder.convert(base64Decode(splut.first));
    List<String> elems = splut.sublist(1, splut.length);
    for (int i = 0; i < elems.length; i++) {
      elems[i] = decoder.convert(base64Decode(elems[i]));
    }
    return Tuple2<String, List<String>>(key, elems);
  }
}