import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/features/data/models/address.dart';

import 'package:pylons_flutter/pylons_flutter.dart';

import 'core/constants/strings.dart';
import 'generated/pylons/recipe.pb.dart';

/// Utilities for building/checking messages for the current message protocol.
/// (Since this protocol is ad-hoc, specific, and strictly temporary, these may
/// be weird or fiddly or otherwise awkward to work with.)
class PylonsWalletCommUtil {
  /// Verifies that the provided address, if not null, is a legal Cosmos address.
  static void validateAddress(String address) {
    // Since we ported Bech32Cosmos, we actually have a much more granular
    // set of exceptions available than just NotAnAddressException, but it
    // may be better to err on the side of simplicity regardless.
    try {
      var v = AccAddress.verifyAddress(address);
      if (!v.value2) {
        throw NotAnAddressException(address);
      }
    } on AddressFormatException {
      throw NotAnAddressException(address);
    }
  }

  /// Verifies that all of a recipe's outputs are accessible, and that it
  /// doesn't refer to any outputs that are not present.
  static void validateRecipe(Recipe recipe) {
    var found = <String>[];
    var reFound = <String>[];
    var orphanOutputs = <String>[];
    var unknownOutputs = <String>[];
    for (var output in recipe.outputs) {
      for (var entry in output.entryIDs) {
        if (!found.contains(entry)) found.add(entry);
      }
    }
    for (var entryId in found) {
      for (var output in recipe.entries.coinOutputs) {
        if (found.contains(output.iD) && !reFound.contains(output.iD)) {
          reFound.add(output.iD);
        } else {
          orphanOutputs.add(output.iD);
        }
      }
      for (var output in recipe.entries.itemOutputs) {
        if (found.contains(output.iD) && !reFound.contains(output.iD)) {
          reFound.add(output.iD);
        } else {
          orphanOutputs.add(output.iD);
        }
      }
      if (!reFound.contains(entryId)) unknownOutputs.add(entryId);
    }
    if (unknownOutputs.isNotEmpty || orphanOutputs.isNotEmpty) {
      throw RecipeValidationException(
          recipe.cookbookID,
          recipe.name,
          recipe.iD,
          'Recipe validation failed\nUnknown entry ids:\n\n'
          '${const JsonEncoder().convert(unknownOutputs)}\n\n'
          'Orphaned entries:\n\n'
          '${const JsonEncoder().convert(orphanOutputs)}');
    }
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

  /// Handle all errors in [response] in the provided list [errors].
  /// If no errors in the list are present in the response, this throws an
  /// [UnhandledErrorException].
  /// This function assumes that the provided response is an error, so call it
  /// only after verifying that.
  static void handleErrors(
      Tuple2<String, List<String>> response, List<String> errors) {
    if (errors.contains(response.value2[0])) {
      switch (response.value1) {
        case Strings.ERR_NODE:
          {
            procError(
                Strings.ERR_NODE,
                response,
                NodeInternalErrorException(
                    int.parse(response.value2[1]),
                    response.value2[2],
                    'Node threw an unexpected error! Debug this!'));
            break;
          }
        case Strings.ERR_PROFILE_DOES_NOT_EXIST:
          {
            procError(Strings.ERR_PROFILE_DOES_NOT_EXIST, response,
                ProfileDoesNotExistException(response.value2[1]));
            break;
          }
        case Strings.ERR_PAYMENT_NOT_VALID:
          {
            procError(Strings.ERR_PAYMENT_NOT_VALID, response,
                PaymentNotValidException(response.value2[1], 'Bad payment'));
            break;
          }
        case Strings.ERR_INSUFFICIENT_FUNDS:
          {
            procError(Strings.ERR_INSUFFICIENT_FUNDS, response,
                ProfileStateException('Insufficient funds'));
            break;
          }
        case Strings.ERR_COOKBOOK_ALREADY_EXISTS:
          {
            procError(
                Strings.ERR_COOKBOOK_ALREADY_EXISTS,
                response,
                CookbookAlreadyExistsException(response.value2[1],
                    response.value2[2], 'Cookbook already exists'));
            break;
          }
        case Strings.ERR_COOKBOOK_DOES_NOT_EXIST:
          {
            procError(
              Strings.ERR_COOKBOOK_DOES_NOT_EXIST,
              response,
              CookbookDoesNotExistException(
                  response.value2[1], 'Cookbook does not exist'),
            );
            break;
          }
        case Strings.ERR_COOKBOOK_NOT_OWNED:
          {
            procError(
              Strings.ERR_COOKBOOK_NOT_OWNED,
              response,
              CookbookNotOwnedException(
                  response.value2[1], response.value2[2], 'Cookbook not owned'),
            );
            break;
          }
        case Strings.ERR_RECIPE_ALREADY_EXISTS:
          {
            procError(
              Strings.ERR_RECIPE_ALREADY_EXISTS,
              response,
              RecipeAlreadyExistsException(response.value2[1],
                  response.value2[2], 'Recipe already exists'),
            );
            break;
          }
        case Strings.ERR_RECIPE_ALREADY_DISABLED:
          {
            procError(
              Strings.ERR_RECIPE_ALREADY_DISABLED,
              response,
              RecipeStateException(response.value2[1], response.value2[2],
                  response.value2[3], 'Recipe already disabled'),
            );
            break;
          }
        case Strings.ERR_RECIPE_ALREADY_ENABLED:
          {
            procError(
              Strings.ERR_RECIPE_ALREADY_ENABLED,
              response,
              RecipeStateException(response.value2[1], response.value2[2],
                  response.value2[3], 'Recipe already enabled'),
            );
            break;
          }
      }
    } else {
      throw UnhandledErrorException(
          response.value1, 'Unknown error passed: ${response.value2}');
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
  static bool procError(
      String err, Tuple2<String, List<String>> response, Exception exception) {
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
