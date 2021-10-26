///
//  Generated code. Do not modify.
//  source: pylons/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $13;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$13.MsgBurnDebtTokenResponse> burnDebtToken($pb.ServerContext ctx, $13.MsgBurnDebtToken request);
  $async.Future<$13.MsgUpdateAccountResponse> updateAccount($pb.ServerContext ctx, $13.MsgUpdateAccount request);
  $async.Future<$13.MsgFulfillTradeResponse> fulfillTrade($pb.ServerContext ctx, $13.MsgFulfillTrade request);
  $async.Future<$13.MsgCreateTradeResponse> createTrade($pb.ServerContext ctx, $13.MsgCreateTrade request);
  $async.Future<$13.MsgCancelTradeResponse> cancelTrade($pb.ServerContext ctx, $13.MsgCancelTrade request);
  $async.Future<$13.MsgCompleteExecutionEarlyResponse> completeExecutionEarly($pb.ServerContext ctx, $13.MsgCompleteExecutionEarly request);
  $async.Future<$13.MsgTransferCookbookResponse> transferCookbook($pb.ServerContext ctx, $13.MsgTransferCookbook request);
  $async.Future<$13.MsgGoogleInAppPurchaseGetCoinsResponse> googleInAppPurchaseGetCoins($pb.ServerContext ctx, $13.MsgGoogleInAppPurchaseGetCoins request);
  $async.Future<$13.MsgCreateAccountResponse> createAccount($pb.ServerContext ctx, $13.MsgCreateAccount request);
  $async.Future<$13.MsgSendItemsResponse> sendItems($pb.ServerContext ctx, $13.MsgSendItems request);
  $async.Future<$13.MsgExecuteRecipeResponse> executeRecipe($pb.ServerContext ctx, $13.MsgExecuteRecipe request);
  $async.Future<$13.MsgSetItemStringResponse> setItemString($pb.ServerContext ctx, $13.MsgSetItemString request);
  $async.Future<$13.MsgCreateRecipeResponse> createRecipe($pb.ServerContext ctx, $13.MsgCreateRecipe request);
  $async.Future<$13.MsgUpdateRecipeResponse> updateRecipe($pb.ServerContext ctx, $13.MsgUpdateRecipe request);
  $async.Future<$13.MsgCreateCookbookResponse> createCookbook($pb.ServerContext ctx, $13.MsgCreateCookbook request);
  $async.Future<$13.MsgUpdateCookbookResponse> updateCookbook($pb.ServerContext ctx, $13.MsgUpdateCookbook request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'BurnDebtToken': return $13.MsgBurnDebtToken();
      case 'UpdateAccount': return $13.MsgUpdateAccount();
      case 'FulfillTrade': return $13.MsgFulfillTrade();
      case 'CreateTrade': return $13.MsgCreateTrade();
      case 'CancelTrade': return $13.MsgCancelTrade();
      case 'CompleteExecutionEarly': return $13.MsgCompleteExecutionEarly();
      case 'TransferCookbook': return $13.MsgTransferCookbook();
      case 'GoogleInAppPurchaseGetCoins': return $13.MsgGoogleInAppPurchaseGetCoins();
      case 'CreateAccount': return $13.MsgCreateAccount();
      case 'SendItems': return $13.MsgSendItems();
      case 'ExecuteRecipe': return $13.MsgExecuteRecipe();
      case 'SetItemString': return $13.MsgSetItemString();
      case 'CreateRecipe': return $13.MsgCreateRecipe();
      case 'UpdateRecipe': return $13.MsgUpdateRecipe();
      case 'CreateCookbook': return $13.MsgCreateCookbook();
      case 'UpdateCookbook': return $13.MsgUpdateCookbook();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'BurnDebtToken': return this.burnDebtToken(ctx, request as $13.MsgBurnDebtToken);
      case 'UpdateAccount': return this.updateAccount(ctx, request as $13.MsgUpdateAccount);
      case 'FulfillTrade': return this.fulfillTrade(ctx, request as $13.MsgFulfillTrade);
      case 'CreateTrade': return this.createTrade(ctx, request as $13.MsgCreateTrade);
      case 'CancelTrade': return this.cancelTrade(ctx, request as $13.MsgCancelTrade);
      case 'CompleteExecutionEarly': return this.completeExecutionEarly(ctx, request as $13.MsgCompleteExecutionEarly);
      case 'TransferCookbook': return this.transferCookbook(ctx, request as $13.MsgTransferCookbook);
      case 'GoogleInAppPurchaseGetCoins': return this.googleInAppPurchaseGetCoins(ctx, request as $13.MsgGoogleInAppPurchaseGetCoins);
      case 'CreateAccount': return this.createAccount(ctx, request as $13.MsgCreateAccount);
      case 'SendItems': return this.sendItems(ctx, request as $13.MsgSendItems);
      case 'ExecuteRecipe': return this.executeRecipe(ctx, request as $13.MsgExecuteRecipe);
      case 'SetItemString': return this.setItemString(ctx, request as $13.MsgSetItemString);
      case 'CreateRecipe': return this.createRecipe(ctx, request as $13.MsgCreateRecipe);
      case 'UpdateRecipe': return this.updateRecipe(ctx, request as $13.MsgUpdateRecipe);
      case 'CreateCookbook': return this.createCookbook(ctx, request as $13.MsgCreateCookbook);
      case 'UpdateCookbook': return this.updateCookbook(ctx, request as $13.MsgUpdateCookbook);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MsgServiceBase$messageJson;
}

