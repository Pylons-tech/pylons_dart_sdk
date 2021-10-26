///
//  Generated code. Do not modify.
//  source: pylons/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $10;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$10.QueryListTradesByCreatorResponse> listTradesByCreator($pb.ServerContext ctx, $10.QueryListTradesByCreatorRequest request);
  $async.Future<$10.QueryGetUsernameByAddressResponse> usernameByAddress($pb.ServerContext ctx, $10.QueryGetUsernameByAddressRequest request);
  $async.Future<$10.QueryGetAddressByUsernameResponse> addressByUsername($pb.ServerContext ctx, $10.QueryGetAddressByUsernameRequest request);
  $async.Future<$10.QueryGetTradeResponse> trade($pb.ServerContext ctx, $10.QueryGetTradeRequest request);
  $async.Future<$10.QueryListItemByOwnerResponse> listItemByOwner($pb.ServerContext ctx, $10.QueryListItemByOwnerRequest request);
  $async.Future<$10.QueryGetGoogleInAppPurchaseOrderResponse> googleInAppPurchaseOrder($pb.ServerContext ctx, $10.QueryGetGoogleInAppPurchaseOrderRequest request);
  $async.Future<$10.QueryListExecutionsByItemResponse> listExecutionsByItem($pb.ServerContext ctx, $10.QueryListExecutionsByItemRequest request);
  $async.Future<$10.QueryListExecutionsByRecipeResponse> listExecutionsByRecipe($pb.ServerContext ctx, $10.QueryListExecutionsByRecipeRequest request);
  $async.Future<$10.QueryGetExecutionResponse> execution($pb.ServerContext ctx, $10.QueryGetExecutionRequest request);
  $async.Future<$10.QueryListRecipesByCookbookResponse> listRecipesByCookbook($pb.ServerContext ctx, $10.QueryListRecipesByCookbookRequest request);
  $async.Future<$10.QueryGetItemResponse> item($pb.ServerContext ctx, $10.QueryGetItemRequest request);
  $async.Future<$10.QueryGetRecipeResponse> recipe($pb.ServerContext ctx, $10.QueryGetRecipeRequest request);
  $async.Future<$10.QueryListCookbooksByCreatorResponse> listCookbooksByCreator($pb.ServerContext ctx, $10.QueryListCookbooksByCreatorRequest request);
  $async.Future<$10.QueryGetCookbookResponse> cookbook($pb.ServerContext ctx, $10.QueryGetCookbookRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'ListTradesByCreator': return $10.QueryListTradesByCreatorRequest();
      case 'UsernameByAddress': return $10.QueryGetUsernameByAddressRequest();
      case 'AddressByUsername': return $10.QueryGetAddressByUsernameRequest();
      case 'Trade': return $10.QueryGetTradeRequest();
      case 'ListItemByOwner': return $10.QueryListItemByOwnerRequest();
      case 'GoogleInAppPurchaseOrder': return $10.QueryGetGoogleInAppPurchaseOrderRequest();
      case 'ListExecutionsByItem': return $10.QueryListExecutionsByItemRequest();
      case 'ListExecutionsByRecipe': return $10.QueryListExecutionsByRecipeRequest();
      case 'Execution': return $10.QueryGetExecutionRequest();
      case 'ListRecipesByCookbook': return $10.QueryListRecipesByCookbookRequest();
      case 'Item': return $10.QueryGetItemRequest();
      case 'Recipe': return $10.QueryGetRecipeRequest();
      case 'ListCookbooksByCreator': return $10.QueryListCookbooksByCreatorRequest();
      case 'Cookbook': return $10.QueryGetCookbookRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'ListTradesByCreator': return this.listTradesByCreator(ctx, request as $10.QueryListTradesByCreatorRequest);
      case 'UsernameByAddress': return this.usernameByAddress(ctx, request as $10.QueryGetUsernameByAddressRequest);
      case 'AddressByUsername': return this.addressByUsername(ctx, request as $10.QueryGetAddressByUsernameRequest);
      case 'Trade': return this.trade(ctx, request as $10.QueryGetTradeRequest);
      case 'ListItemByOwner': return this.listItemByOwner(ctx, request as $10.QueryListItemByOwnerRequest);
      case 'GoogleInAppPurchaseOrder': return this.googleInAppPurchaseOrder(ctx, request as $10.QueryGetGoogleInAppPurchaseOrderRequest);
      case 'ListExecutionsByItem': return this.listExecutionsByItem(ctx, request as $10.QueryListExecutionsByItemRequest);
      case 'ListExecutionsByRecipe': return this.listExecutionsByRecipe(ctx, request as $10.QueryListExecutionsByRecipeRequest);
      case 'Execution': return this.execution(ctx, request as $10.QueryGetExecutionRequest);
      case 'ListRecipesByCookbook': return this.listRecipesByCookbook(ctx, request as $10.QueryListRecipesByCookbookRequest);
      case 'Item': return this.item(ctx, request as $10.QueryGetItemRequest);
      case 'Recipe': return this.recipe(ctx, request as $10.QueryGetRecipeRequest);
      case 'ListCookbooksByCreator': return this.listCookbooksByCreator(ctx, request as $10.QueryListCookbooksByCreatorRequest);
      case 'Cookbook': return this.cookbook(ctx, request as $10.QueryGetCookbookRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

