import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

/// Utilities for building/checking messages for the current message protocol.
/// (Since this protocol is ad-hoc, specific, and strictly temporary, these may
/// be weird or fiddly or otherwise awkward to work with.)
class PylonsWalletCommUtil {



  /// This method checks whether the wallet exists or not
  /// [Input] : [PylonsWallet] is the wallet whose existence we are checking
  /// Can throw  the following exception in the event of no wallet
  ///
  /// [NoWalletException] : There's no attached wallet.
  static Future<void> validateExists(PylonsWallet wallet) async {
    var isExists = await wallet.exists();
      if (!isExists) {
        throw NoWalletException();
      }
  }

  static bool validateAddress(String? address) {
    throw UnimplementedError();
  }

  static bool validateRecipe(Recipe recipe) {
    throw UnimplementedError();
  }

  static bool responseIsError(String v, String key) {
    return v == 'err_$key';
  }



  /// This method checks whether the response contains the required key or not
  /// [Input] : [Strings] is the wallet whose existence we are checking ,
  /// [response]  Contains the response in which we are checking the key
  ///
  /// Can throw  the following exception in the event of no matching key in response
  /// or having error related with this key
  ///
  /// [ResponseException] : There is something wrong with response
  static void validateResponseMatchesKey(
      String key, Tuple2<String, List<String>> response) {

    if ((response.value1 != 'response_$key' && response.value1 != 'err_$key')) {
      throw ResponseException(
          const JsonEncoder().convert(response), 'Bad response: $response');
    }
  }



  /// This method checks whether the response contains the error of the supplied type or not
  /// [Input] : [err] is the type of error , [response]  is the response in which the error is to be check,
  /// [exception] is the exception which will be thrown if supplied error found
  ///
  /// Can throw  the following exception in the event of no matching key in response
  /// or having error related with this key
  ///
  /// [exception] : UnhandledErrorException if something wrong happens
  static bool procError(String err, Tuple2<String, List<String>> response,
      Exception exception) {
    if (response.value2[0] == err) {
      try {
        throw exception;
      } catch (e) {
        throw UnhandledErrorException(
            err, 'Bad error passed: ${response.value2}');
      }
    }
    return false;
  }

  static Tuple2<String, List<String>> procResponse(String response) {
    var decoder = const Utf8Decoder();
    var splut = response.split(',');
    var key = decoder.convert(base64Decode(splut.first));
    var elems = splut.sublist(1, splut.length);
    for (var i = 0; i < elems.length; i++) {
      elems[i] = decoder.convert(base64Decode(elems[i]));
    }
    return Tuple2<String, List<String>>(key, elems);
  }
}