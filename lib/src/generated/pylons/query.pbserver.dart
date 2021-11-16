///
//  Generated code. Do not modify.
//  source: pylons/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $12;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$12.QueryListTradesByCreatorResponse> listTradesByCreator(
      $pb.ServerContext ctx, $12.QueryListTradesByCreatorRequest request);
  $async.Future<$12.QueryGetRedeemInfoResponse> redeemInfo(
      $pb.ServerContext ctx, $12.QueryGetRedeemInfoRequest request);
  $async.Future<$12.QueryAllRedeemInfoResponse> redeemInfoAll(
      $pb.ServerContext ctx, $12.QueryAllRedeemInfoRequest request);
  $async.Future<$12.QueryGetPaymentInfoResponse> paymentInfo(
      $pb.ServerContext ctx, $12.QueryGetPaymentInfoRequest request);
  $async.Future<$12.QueryAllPaymentInfoResponse> paymentInfoAll(
      $pb.ServerContext ctx, $12.QueryAllPaymentInfoRequest request);
  $async.Future<$12.QueryGetUsernameByAddressResponse> usernameByAddress(
      $pb.ServerContext ctx, $12.QueryGetUsernameByAddressRequest request);
  $async.Future<$12.QueryGetAddressByUsernameResponse> addressByUsername(
      $pb.ServerContext ctx, $12.QueryGetAddressByUsernameRequest request);
  $async.Future<$12.QueryGetTradeResponse> trade(
      $pb.ServerContext ctx, $12.QueryGetTradeRequest request);
  $async.Future<$12.QueryListItemByOwnerResponse> listItemByOwner(
      $pb.ServerContext ctx, $12.QueryListItemByOwnerRequest request);
  $async.Future<$12.QueryGetGoogleInAppPurchaseOrderResponse>
      googleInAppPurchaseOrder($pb.ServerContext ctx,
          $12.QueryGetGoogleInAppPurchaseOrderRequest request);
  $async.Future<$12.QueryListExecutionsByItemResponse> listExecutionsByItem(
      $pb.ServerContext ctx, $12.QueryListExecutionsByItemRequest request);
  $async.Future<$12.QueryListExecutionsByRecipeResponse> listExecutionsByRecipe(
      $pb.ServerContext ctx, $12.QueryListExecutionsByRecipeRequest request);
  $async.Future<$12.QueryGetExecutionResponse> execution(
      $pb.ServerContext ctx, $12.QueryGetExecutionRequest request);
  $async.Future<$12.QueryListRecipesByCookbookResponse> listRecipesByCookbook(
      $pb.ServerContext ctx, $12.QueryListRecipesByCookbookRequest request);
  $async.Future<$12.QueryGetItemResponse> item(
      $pb.ServerContext ctx, $12.QueryGetItemRequest request);
  $async.Future<$12.QueryGetRecipeResponse> recipe(
      $pb.ServerContext ctx, $12.QueryGetRecipeRequest request);
  $async.Future<$12.QueryListCookbooksByCreatorResponse> listCookbooksByCreator(
      $pb.ServerContext ctx, $12.QueryListCookbooksByCreatorRequest request);
  $async.Future<$12.QueryGetCookbookResponse> cookbook(
      $pb.ServerContext ctx, $12.QueryGetCookbookRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'ListTradesByCreator':
        return $12.QueryListTradesByCreatorRequest();
      case 'RedeemInfo':
        return $12.QueryGetRedeemInfoRequest();
      case 'RedeemInfoAll':
        return $12.QueryAllRedeemInfoRequest();
      case 'PaymentInfo':
        return $12.QueryGetPaymentInfoRequest();
      case 'PaymentInfoAll':
        return $12.QueryAllPaymentInfoRequest();
      case 'UsernameByAddress':
        return $12.QueryGetUsernameByAddressRequest();
      case 'AddressByUsername':
        return $12.QueryGetAddressByUsernameRequest();
      case 'Trade':
        return $12.QueryGetTradeRequest();
      case 'ListItemByOwner':
        return $12.QueryListItemByOwnerRequest();
      case 'GoogleInAppPurchaseOrder':
        return $12.QueryGetGoogleInAppPurchaseOrderRequest();
      case 'ListExecutionsByItem':
        return $12.QueryListExecutionsByItemRequest();
      case 'ListExecutionsByRecipe':
        return $12.QueryListExecutionsByRecipeRequest();
      case 'Execution':
        return $12.QueryGetExecutionRequest();
      case 'ListRecipesByCookbook':
        return $12.QueryListRecipesByCookbookRequest();
      case 'Item':
        return $12.QueryGetItemRequest();
      case 'Recipe':
        return $12.QueryGetRecipeRequest();
      case 'ListCookbooksByCreator':
        return $12.QueryListCookbooksByCreatorRequest();
      case 'Cookbook':
        return $12.QueryGetCookbookRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'ListTradesByCreator':
        return this.listTradesByCreator(
            ctx, request as $12.QueryListTradesByCreatorRequest);
      case 'RedeemInfo':
        return this.redeemInfo(ctx, request as $12.QueryGetRedeemInfoRequest);
      case 'RedeemInfoAll':
        return this
            .redeemInfoAll(ctx, request as $12.QueryAllRedeemInfoRequest);
      case 'PaymentInfo':
        return this.paymentInfo(ctx, request as $12.QueryGetPaymentInfoRequest);
      case 'PaymentInfoAll':
        return this
            .paymentInfoAll(ctx, request as $12.QueryAllPaymentInfoRequest);
      case 'UsernameByAddress':
        return this.usernameByAddress(
            ctx, request as $12.QueryGetUsernameByAddressRequest);
      case 'AddressByUsername':
        return this.addressByUsername(
            ctx, request as $12.QueryGetAddressByUsernameRequest);
      case 'Trade':
        return this.trade(ctx, request as $12.QueryGetTradeRequest);
      case 'ListItemByOwner':
        return this
            .listItemByOwner(ctx, request as $12.QueryListItemByOwnerRequest);
      case 'GoogleInAppPurchaseOrder':
        return this.googleInAppPurchaseOrder(
            ctx, request as $12.QueryGetGoogleInAppPurchaseOrderRequest);
      case 'ListExecutionsByItem':
        return this.listExecutionsByItem(
            ctx, request as $12.QueryListExecutionsByItemRequest);
      case 'ListExecutionsByRecipe':
        return this.listExecutionsByRecipe(
            ctx, request as $12.QueryListExecutionsByRecipeRequest);
      case 'Execution':
        return this.execution(ctx, request as $12.QueryGetExecutionRequest);
      case 'ListRecipesByCookbook':
        return this.listRecipesByCookbook(
            ctx, request as $12.QueryListRecipesByCookbookRequest);
      case 'Item':
        return this.item(ctx, request as $12.QueryGetItemRequest);
      case 'Recipe':
        return this.recipe(ctx, request as $12.QueryGetRecipeRequest);
      case 'ListCookbooksByCreator':
        return this.listCookbooksByCreator(
            ctx, request as $12.QueryListCookbooksByCreatorRequest);
      case 'Cookbook':
        return this.cookbook(ctx, request as $12.QueryGetCookbookRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
