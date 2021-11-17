/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.
library pylons_flutter_impl;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/features/data/models/transaction.dart';
import 'package:pylons_flutter/src/features/ipc/responseCompleters.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_constants.dart';
import 'package:pylons_flutter/src/generated/cosmos/tx/v1beta1/tx.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/cookbook.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/item.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/payment_info.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/trade.pb.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_flutter/src/pylons_wallet_comm_util.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

import '../core/constants/strings.dart';

/// The Pylons class is the main endpoint developers use for structured,
/// high-level interactions with the Pylons wallet.
class PylonsWalletImpl implements PylonsWallet {
  late StreamSubscription _sub;

  final String host;
  final UniLinksPlatform uniLink;

  PylonsWalletImpl({required this.host, required this.uniLink}) {
    // // Attach a listener to the stream
    _sub = uniLink.linkStream.listen((String? link) {
      if (link == null) {
        return;
      }

      handleLink(link);
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      _sub.cancel();
    });

    // startIPC();
  }

  Future<SDKIPCResponse> _dispatch(String key, String data) async {
    final sdkIPCMessage = SDKIPCMessage(key, data, getHostBasedOnOS(Platform.isAndroid));
    return sendMessage(sdkIPCMessage, initResponseCompleter(key));
  }

  /// Parses [link] for an IPC message, gets a response, and dispatches the response to the appropriate handler.
  Future<void> handleLink(String link) async {
    log(link, name: '[IPCEngine : handleLink]');
    final getMessage = link.split('/').last;
    var sdkipcResponse;
    try {
      sdkipcResponse = SDKIPCResponse.fromIPCMessage(getMessage);
      IPCHandlerFactory.getHandler(sdkipcResponse);
    } catch (e) {
      print('Something went wrong in parsing');
      return;
    }
  }

  @override
  Future<SDKIPCResponse> sendMessage(
      SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse> completer) {
    final encodedMessage = sdkipcMessage.createMessage();
    final universalLink = createLinkBasedOnOS(
        encodedMessage: encodedMessage, isAndroid: Platform.isAndroid);
    dispatchUniLink(universalLink);
    return completer.future;
  }

  @override
  Future<SDKIPCResponse> getCookbooks() async {
    return Future.sync(() async {
      return await _dispatch(Strings.GET_COOKBOOKS, '');
    });
  }

  @override
  Future<SDKIPCResponse> getProfile() async {
    return Future.sync(() async {
      return await _dispatch(Strings.GET_PROFILE, '');
    });
  }

  @override
  Future<SDKIPCResponse> getRecipes(String? address) async {
    return Future.sync(() async {
      if (address != null) {
        PylonsWalletCommUtil.validateAddress(address);
      } // address is an optional field
      return await _dispatch(Strings.GET_PROFILE, address == null ? address! : '');
    });
  }

  @override
  Future<SDKIPCResponse> getTrades() async {
    return Future.sync(() async {
      return await _dispatch(Strings.GET_TRADES, '');
    });
  }

  @override
  Future<SDKIPCResponse> txBuyItem(String tradeId, String paymentId) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_BUY_ITEMS, jsonEncode([tradeId, paymentId]));
    });
  }

  @override
  Future<SDKIPCResponse> txBuyPylons(int pylons, String paymentId) {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_BUY_PYLONS, jsonEncode([pylons, paymentId]));
    });
  }

  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_CREATE_COOKBOOK, jsonEncode(cookbook.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_CREATE_RECIPE, jsonEncode(recipe.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txDisableRecipe(String recipeId) async {
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txEnableRecipe(String cookbookId, String recipeId, String version) async {
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txExecuteRecipe(
      {required String cookbookId,
      required String recipeName,
      required List<String> itemIds,
      required int coinInputIndex,
      required List<PaymentInfo> paymentInfo}) async {

    return Future.sync(() async {
      return await _dispatch(Strings.TX_EXECUTE_RECIPE, jsonEncode(MsgExecuteRecipe(
          creator: '',
          cookbookID: cookbookId,
          recipeID: recipeName,
          coinInputsIndex: fixnum.Int64(coinInputIndex),
          itemIDs: itemIds,
          paymentInfos: paymentInfo).toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txPlaceForSale(Item item, int price) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_PLACE_FOR_SALE, jsonEncode([jsonEncode(item.toProto3Json()), price]));
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_UPDATE_COOKBOOK, jsonEncode(cookbook.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_UPDATE_RECIPE, jsonEncode(recipe.toProto3Json()));
    });
  }

  @override
  Future<bool> exists() {
    return Future.sync(() {
      if (Platform.isAndroid) {
        return canLaunch(BASE_UNI_LINK);
      }
      return canLaunch(BASE_UNI_LINK_IOS);
    });
  }

  /// Encodes a message [msg] to be sent to the wallet.
  ///
  /// Argument is provided as a list of strings corresponding to each piece of data in the message.
  ///
  /// Returns a string containing the encoded base64 representation of the message.
  String encodeMessage(List<String> msg) {
    var encodedMessageWithComma =
        msg.map((e) => base64Url.encode(utf8.encode(e))).join(',');
    return base64Url.encode(utf8.encode(encodedMessageWithComma));
  }

  /// Decodes a message [msg] received from the wallet.
  ///
  /// Argument is provided as a Base64-encoded string.
  ///
  /// Returns a [List<String>] containing the data from the decoded message.
  List<String> decodeMessage(String msg) {
    var decoded = utf8.decode(base64Url.decode(msg));
    return decoded
        .split(',')
        .map((e) => utf8.decode(base64Url.decode(e)))
        .toList();
  }

  /// Sends [unilink] to wallet app.
  ///
  /// Throws a [NoWalletException] if the wallet doesn't exist.
  void dispatchUniLink(String uniLink) async {
    await canLaunch(uniLink)
        ? await launch(uniLink)
        : throw NoWalletException();
  }

  /// Create a unilink for the current OS.
  ///
  /// [encodedMessage] is the message to be sent to the wallet; [isAndroid] is whether or not we're running on Android.
  ///
  /// Returns a string containing the correct platform-specific unilink.
  String createLinkBasedOnOS(
      {required String encodedMessage, required bool isAndroid}) {
    if (isAndroid) {
      return '$BASE_UNI_LINK/$encodedMessage';
    }

    return '$BASE_UNI_LINK_IOS$encodedMessage';
  }

  /// Get the host for the current OS.
  ///
  /// [isAndroid] is whether or not we're running on Android.
  ///
  /// Returns a string containing the correct platform-specific host.
  String getHostBasedOnOS(bool isAndroid) {
    if (isAndroid) {
      return host;
    }

    return 'pylons-$host';
  }
}
