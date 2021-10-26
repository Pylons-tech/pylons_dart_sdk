///
//  Generated code. Do not modify.
//  source: pylons/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $11;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$11.MsgUpdateAccountResponse> updateAccount($pb.ServerContext ctx, $11.MsgUpdateAccount request);
  $async.Future<$11.MsgFulfillTradeResponse> fulfillTrade($pb.ServerContext ctx, $11.MsgFulfillTrade request);
  $async.Future<$11.MsgCreateTradeResponse> createTrade($pb.ServerContext ctx, $11.MsgCreateTrade request);
  $async.Future<$11.MsgCancelTradeResponse> cancelTrade($pb.ServerContext ctx, $11.MsgCancelTrade request);
  $async.Future<$11.MsgCompleteExecutionEarlyResponse> completeExecutionEarly($pb.ServerContext ctx, $11.MsgCompleteExecutionEarly request);
  $async.Future<$11.MsgTransferCookbookResponse> transferCookbook($pb.ServerContext ctx, $11.MsgTransferCookbook request);
  $async.Future<$11.MsgGoogleInAppPurchaseGetCoinsResponse> googleInAppPurchaseGetCoins($pb.ServerContext ctx, $11.MsgGoogleInAppPurchaseGetCoins request);
  $async.Future<$11.MsgCreateAccountResponse> createAccount($pb.ServerContext ctx, $11.MsgCreateAccount request);
  $async.Future<$11.MsgSendItemsResponse> sendItems($pb.ServerContext ctx, $11.MsgSendItems request);
  $async.Future<$11.MsgExecuteRecipeResponse> executeRecipe($pb.ServerContext ctx, $11.MsgExecuteRecipe request);
  $async.Future<$11.MsgSetItemStringResponse> setItemString($pb.ServerContext ctx, $11.MsgSetItemString request);
  $async.Future<$11.MsgCreateRecipeResponse> createRecipe($pb.ServerContext ctx, $11.MsgCreateRecipe request);
  $async.Future<$11.MsgUpdateRecipeResponse> updateRecipe($pb.ServerContext ctx, $11.MsgUpdateRecipe request);
  $async.Future<$11.MsgCreateCookbookResponse> createCookbook($pb.ServerContext ctx, $11.MsgCreateCookbook request);
  $async.Future<$11.MsgUpdateCookbookResponse> updateCookbook($pb.ServerContext ctx, $11.MsgUpdateCookbook request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'UpdateAccount': return $11.MsgUpdateAccount();
      case 'FulfillTrade': return $11.MsgFulfillTrade();
      case 'CreateTrade': return $11.MsgCreateTrade();
      case 'CancelTrade': return $11.MsgCancelTrade();
      case 'CompleteExecutionEarly': return $11.MsgCompleteExecutionEarly();
      case 'TransferCookbook': return $11.MsgTransferCookbook();
      case 'GoogleInAppPurchaseGetCoins': return $11.MsgGoogleInAppPurchaseGetCoins();
      case 'CreateAccount': return $11.MsgCreateAccount();
      case 'SendItems': return $11.MsgSendItems();
      case 'ExecuteRecipe': return $11.MsgExecuteRecipe();
      case 'SetItemString': return $11.MsgSetItemString();
      case 'CreateRecipe': return $11.MsgCreateRecipe();
      case 'UpdateRecipe': return $11.MsgUpdateRecipe();
      case 'CreateCookbook': return $11.MsgCreateCookbook();
      case 'UpdateCookbook': return $11.MsgUpdateCookbook();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'UpdateAccount': return this.updateAccount(ctx, request as $11.MsgUpdateAccount);
      case 'FulfillTrade': return this.fulfillTrade(ctx, request as $11.MsgFulfillTrade);
      case 'CreateTrade': return this.createTrade(ctx, request as $11.MsgCreateTrade);
      case 'CancelTrade': return this.cancelTrade(ctx, request as $11.MsgCancelTrade);
      case 'CompleteExecutionEarly': return this.completeExecutionEarly(ctx, request as $11.MsgCompleteExecutionEarly);
      case 'TransferCookbook': return this.transferCookbook(ctx, request as $11.MsgTransferCookbook);
      case 'GoogleInAppPurchaseGetCoins': return this.googleInAppPurchaseGetCoins(ctx, request as $11.MsgGoogleInAppPurchaseGetCoins);
      case 'CreateAccount': return this.createAccount(ctx, request as $11.MsgCreateAccount);
      case 'SendItems': return this.sendItems(ctx, request as $11.MsgSendItems);
      case 'ExecuteRecipe': return this.executeRecipe(ctx, request as $11.MsgExecuteRecipe);
      case 'SetItemString': return this.setItemString(ctx, request as $11.MsgSetItemString);
      case 'CreateRecipe': return this.createRecipe(ctx, request as $11.MsgCreateRecipe);
      case 'UpdateRecipe': return this.updateRecipe(ctx, request as $11.MsgUpdateRecipe);
      case 'CreateCookbook': return this.createCookbook(ctx, request as $11.MsgCreateCookbook);
      case 'UpdateCookbook': return this.updateCookbook(ctx, request as $11.MsgUpdateCookbook);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MsgServiceBase$messageJson;
}

