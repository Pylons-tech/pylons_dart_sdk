import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/data/models/transaction.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_constants.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_flutter/src/generated/pylons/cookbook.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/item.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/payment_info.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/trade.pb.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../pylons_flutter.dart';
import '../pylons_wallet_comm_util.dart';

/// The Pylons class is used for the test net .
class PylonsWalletDevImpl implements PylonsWallet {
  late StreamSubscription _sub;


  final String host;


  PylonsWalletDevImpl(this.host) {
    // // Attach a listener to the stream
    _sub = linkStream.listen((String? link) {
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


  Future<void> handleLink(String link) async {
    log(link, name: '[IPCEngine : handleLink]');

    final getMessage = link.split('/').last;

    SDKIPCResponse sdkipcResponse;

    try {
      sdkipcResponse = SDKIPCResponse.fromIPCMessage(getMessage);

      IPCHandlerFactory.getHandler(sdkipcResponse);
    } catch (e) {
      print('Something went wrong in parsing');
      return;
    }
  }

  @override
  Future<List<Cookbook>> getCookbooks() {
    // TODO: implement getCookbooks
    throw UnimplementedError();
  }

  @override
  Future<Profile> getProfile(String? address) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> getRecipes(String? address) {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

  @override
  Future<List<Trade>> getTrades() {
    // TODO: implement getTrades
    throw UnimplementedError();
  }

  @override
  Future<String> sendMessage(List<String> msg) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyItem(
      String tradeId, String paymentId) {
    // TODO: implement txBuyItem
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyPylons(
      int pylons, String paymentId) {
    // TODO: implement txBuyPylons
    throw UnimplementedError();
  }

  @override
  Future<Transaction> txDisableRecipe(String recipeId) {
    // TODO: implement txDisableRecipe
    throw UnimplementedError();
  }

  @override
  Future<Transaction> txEnableRecipe(String recipeId) {
    // TODO: implement txEnableRecipe
    throw UnimplementedError();
  }



  @override
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale(
      Item item, int price) {
    // TODO: implement txPlaceForSale
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txUpdateCookbook(
      Cookbook cookbook) {
    // TODO: implement txUpdateCookbook
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) async {
    throw UnimplementedError();

  }

  @override
  Future<bool> exists() {
    // TODO: implement exists
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) {
    // TODO: implement txCreateCookbook
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_CREATE_RECIPE;

      var sdkIPCMessage = SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()), host);

      recipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }



  /// Async: Send the provided message over the IPC channel, then retrieve a
  /// response.
  ///
  /// [msg] is a list of strings which are converted to base64 and combined
  /// to form a single comma-separated string before being sent over the
  /// channel.
  ///
  /// The string that is eventually retrieved as a response fits the same
  /// format.
  Future<SDKIPCResponse> sendMessageNew(SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse> completer) {
    var encodedMessage = sdkipcMessage.createMessage();
    dispatchUniLink('$BASE_UNI_LINK/$encodedMessage');
    return completer.future;
  }


  /// This method sends the unilink to the wallet app
  /// [Input] : [unilink] is the unilink with data for the wallet app
  ///
  /// This method throws the following exception
  ///
  /// [NoWalletException] : If no wallet exists this method will throw the following error.
  void dispatchUniLink(String uniLink) async {
    await canLaunch(uniLink)
        ? await launch(uniLink)
        : throw NoWalletException();
  }

  @override
  Future<SDKIPCResponse> txExecuteRecipe({required String cookbookId, required String recipeName, required List<String> itemIds, required int coinInputIndex, required List<PaymentInfo> paymentInfo}) {
    // TODO: implement txExecuteRecipe
    throw UnimplementedError();
  }
}
