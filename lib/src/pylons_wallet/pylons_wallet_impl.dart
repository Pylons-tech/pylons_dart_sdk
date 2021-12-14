/// Types and functionality for interacting with the Pylons wallet.
///
/// The APIs exposed by this library, specifically, are the main way most
/// client apps should structure their interactions with the wallet.
library pylons_flutter_impl;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:pylons_sdk/src/features/ipc/ipc_constants.dart';
import 'package:pylons_sdk/src/features/models/execution_list_by_recipe_response.dart';
import 'package:pylons_sdk/src/features/validations/validate_recipe.dart';
import 'package:pylons_sdk/src/generated/pylons/execution.pb.dart';
import 'package:pylons_sdk/src/generated/pylons/payment_info.pb.dart';
import 'package:pylons_sdk/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

import '../../pylons_sdk.dart';
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

  Future<SDKIPCResponse> _dispatch<T>(String key, String data) async {
    final sdkIPCMessage =
        SDKIPCMessage(key, data, getHostBasedOnOS(Platform.isAndroid));
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
  Future<SDKIPCResponse<Cookbook>> getCookbook(String id) {
    return Future<SDKIPCResponse<Cookbook>>.sync(() async {
      final response = await _dispatch(
          Strings.GET_COOKBOOK, jsonEncode({Strings.COOKBOOK_ID: id}));
      if (response is SDKIPCResponse<Cookbook>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse> getProfile() async {
    return Future.sync(() async {
      return await _dispatch(Strings.GET_PROFILE, '');
    });
  }

  @override
  Future<SDKIPCResponse<List<Recipe>>> getRecipes(String cookbook) async {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_RECIPES, jsonEncode({Strings.COOKBOOK_ID: cookbook}));
      if (response is SDKIPCResponse<List<Recipe>>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse<List<Trade>>> getTrades(String creator) async {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_TRADES, jsonEncode({Strings.CREATOR: creator}));
      if (response is SDKIPCResponse<List<Trade>>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse> txBuyItem(String tradeId) async {
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_BUY_ITEMS, jsonEncode([tradeId]));
    });
  }

  @override
  Future<SDKIPCResponse> txBuyPylons(int pylons) {
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_BUY_PYLONS, jsonEncode([pylons]));
    });
  }

  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) async {
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_CREATE_COOKBOOK, jsonEncode(cookbook.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    ValidateRecipe.validate(recipe);
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_CREATE_RECIPE, jsonEncode(recipe.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txExecuteRecipe(
      {required String cookbookId,
      required String recipeName,
      required List<String> itemIds,
      required int coinInputIndex,
      required List<PaymentInfo> paymentInfo}) async {
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_EXECUTE_RECIPE,
          jsonEncode(MsgExecuteRecipe(
                  creator: '',
                  cookbookID: cookbookId,
                  recipeID: recipeName,
                  coinInputsIndex: fixnum.Int64(coinInputIndex),
                  itemIDs: itemIds,
                  paymentInfos: paymentInfo)
              .toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txPlaceForSale(ItemRef item, int price) async {
    return Future.sync(() async {
      return await _dispatch(Strings.TX_PLACE_FOR_SALE,
          jsonEncode([jsonEncode(item.toProto3Json()), price]));
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook) async {
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_UPDATE_COOKBOOK, jsonEncode(cookbook.toProto3Json()));
    });
  }

  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) async {
    ValidateRecipe.validate(recipe);
    return Future.sync(() async {
      return await _dispatch(
          Strings.TX_UPDATE_RECIPE, jsonEncode(recipe.toProto3Json()));
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

  @override
  Future<SDKIPCResponse<Recipe>> getRecipe(String cookbookId, String recipeId) {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_RECIPE,
          jsonEncode(
              {Strings.COOKBOOK_ID: cookbookId, Strings.RECIPE_ID: recipeId}));
      if (response is SDKIPCResponse<Recipe>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse<ExecutionListByRecipeResponse>>
      getExecutionBasedOnRecipe(
          {required String cookbookId, required String recipeId}) {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_EXECUTION_BY_RECIPE_ID,
          jsonEncode(
              {Strings.COOKBOOK_ID: cookbookId, Strings.RECIPE_ID: recipeId}));
      if (response is SDKIPCResponse<ExecutionListByRecipeResponse>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse<List<Item>>> getItemListByOwner(
      {required String owner}) {
    return Future<SDKIPCResponse<List<Item>>>.sync(() async {
      final response = await _dispatch(Strings.GET_ITEMS_BY_OWNER,
          jsonEncode({Strings.OWNER_ADDRESS: owner}));
      if (response is SDKIPCResponse<List<Item>>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse<Item>> getItemById(
      {required String cookbookId, required String itemId}) {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_ITEM_BY_ID,
          jsonEncode(
              {Strings.COOKBOOK_ID: cookbookId, Strings.ITEM_ID: itemId}));
      if (response is SDKIPCResponse<Item>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }

  @override
  Future<SDKIPCResponse<Execution>> getExecutionBasedOnId(
      {required String id}) async {
    return Future.sync(() async {
      final response = await _dispatch(
          Strings.GET_EXECUTION_BY_ID, jsonEncode({Strings.EXECUTION_ID: id}));
      if (response is SDKIPCResponse<Execution>) {
        return response;
      }
      throw Exception('Response malformed');
    });
  }
}
