import 'dart:async';
import 'package:pylons_sdk/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_sdk/src/generated/pylons/cookbook.pb.dart';
import 'package:pylons_sdk/src/generated/pylons/item.pb.dart';
import 'package:pylons_sdk/src/generated/pylons/payment_info.pb.dart';
import 'package:pylons_sdk/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';
import '../../pylons_sdk.dart';

/// The Pylons class is used for the test net .
class PylonsWalletDevImpl extends PylonsWallet {

  final String host;
  final UniLinksPlatform uniLink;

  PylonsWalletDevImpl(this.host, this.uniLink);

  @override
  Future<bool> exists() {
    // TODO: implement exists
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse<Cookbook>> getCookbook(String id) {
    // TODO: implement getCookbook
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse<List<Recipe>>> getRecipes(String cookbook) {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> getTrades() {
    // TODO: implement getTrades
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> sendMessage(SDKIPCMessage sdkipcMessage, Completer<SDKIPCResponse<dynamic>> completer) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txBuyItem(String tradeId, String paymentId) {
    // TODO: implement txBuyItem
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txBuyPylons(int pylons, String paymentId) {
    // TODO: implement txBuyPylons
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txCreateCookbook(Cookbook cookbook) {
    // TODO: implement txCreateCookbook
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) {
    // TODO: implement txCreateRecipe
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txDisableRecipe(String recipeId) {
    // TODO: implement txDisableRecipe
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txEnableRecipe(String cookBookId, String recipeId, String version) {
    // TODO: implement txEnableRecipe
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txExecuteRecipe({required String cookbookId, required String recipeName, required List<String> itemIds, required int coinInputIndex, required List<PaymentInfo> paymentInfo}) {
    // TODO: implement txExecuteRecipe
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txPlaceForSale(Item item, int price) {
    // TODO: implement txPlaceForSale
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txUpdateCookbook(Cookbook cookbook) {
    // TODO: implement txUpdateCookbook
    throw UnimplementedError();
  }

  @override
  Future<SDKIPCResponse> txUpdateRecipe(Recipe recipe) {
    // TODO: implement txUpdateRecipe
    throw UnimplementedError();
  }
}