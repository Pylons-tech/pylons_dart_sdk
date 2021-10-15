///
//  Generated code. Do not modify.
//  source: pylons/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../cosmos/base/query/v1beta1/pagination.pb.dart' as $9;
import 'trade.pb.dart' as $4;
import 'accounts.pb.dart' as $8;
import 'item.pb.dart' as $1;
import 'google_iap_order.pb.dart' as $6;
import 'execution.pb.dart' as $5;
import 'recipe.pb.dart' as $2;
import 'cookbook.pb.dart' as $3;

class QueryListTradesByCreatorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListTradesByCreatorRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creator')
    ..aOM<$9.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListTradesByCreatorRequest._() : super();
  factory QueryListTradesByCreatorRequest({
    $core.String? creator,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (creator != null) {
      _result.creator = creator;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListTradesByCreatorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListTradesByCreatorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListTradesByCreatorRequest clone() => QueryListTradesByCreatorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListTradesByCreatorRequest copyWith(void Function(QueryListTradesByCreatorRequest) updates) => super.copyWith((message) => updates(message as QueryListTradesByCreatorRequest)) as QueryListTradesByCreatorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListTradesByCreatorRequest create() => QueryListTradesByCreatorRequest._();
  QueryListTradesByCreatorRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListTradesByCreatorRequest> createRepeated() => $pb.PbList<QueryListTradesByCreatorRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListTradesByCreatorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListTradesByCreatorRequest>(create);
  static QueryListTradesByCreatorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creator => $_getSZ(0);
  @$pb.TagNumber(1)
  set creator($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreator() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreator() => clearField(1);

  @$pb.TagNumber(2)
  $9.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($9.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $9.PageRequest ensurePagination() => $_ensure(1);
}

class QueryListTradesByCreatorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListTradesByCreatorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$4.Trade>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Trades', $pb.PbFieldType.PM, protoName: 'Trades', subBuilder: $4.Trade.create)
    ..aOM<$9.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListTradesByCreatorResponse._() : super();
  factory QueryListTradesByCreatorResponse({
    $core.Iterable<$4.Trade>? trades,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (trades != null) {
      _result.trades.addAll(trades);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListTradesByCreatorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListTradesByCreatorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListTradesByCreatorResponse clone() => QueryListTradesByCreatorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListTradesByCreatorResponse copyWith(void Function(QueryListTradesByCreatorResponse) updates) => super.copyWith((message) => updates(message as QueryListTradesByCreatorResponse)) as QueryListTradesByCreatorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListTradesByCreatorResponse create() => QueryListTradesByCreatorResponse._();
  QueryListTradesByCreatorResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListTradesByCreatorResponse> createRepeated() => $pb.PbList<QueryListTradesByCreatorResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListTradesByCreatorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListTradesByCreatorResponse>(create);
  static QueryListTradesByCreatorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.Trade> get trades => $_getList(0);

  @$pb.TagNumber(2)
  $9.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($9.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $9.PageResponse ensurePagination() => $_ensure(1);
}

class QueryGetUsernameByAddressRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetUsernameByAddressRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryGetUsernameByAddressRequest._() : super();
  factory QueryGetUsernameByAddressRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryGetUsernameByAddressRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetUsernameByAddressRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetUsernameByAddressRequest clone() => QueryGetUsernameByAddressRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetUsernameByAddressRequest copyWith(void Function(QueryGetUsernameByAddressRequest) updates) => super.copyWith((message) => updates(message as QueryGetUsernameByAddressRequest)) as QueryGetUsernameByAddressRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetUsernameByAddressRequest create() => QueryGetUsernameByAddressRequest._();
  QueryGetUsernameByAddressRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetUsernameByAddressRequest> createRepeated() => $pb.PbList<QueryGetUsernameByAddressRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetUsernameByAddressRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetUsernameByAddressRequest>(create);
  static QueryGetUsernameByAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class QueryGetAddressByUsernameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetAddressByUsernameRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..hasRequiredFields = false
  ;

  QueryGetAddressByUsernameRequest._() : super();
  factory QueryGetAddressByUsernameRequest({
    $core.String? username,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    return _result;
  }
  factory QueryGetAddressByUsernameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetAddressByUsernameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetAddressByUsernameRequest clone() => QueryGetAddressByUsernameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetAddressByUsernameRequest copyWith(void Function(QueryGetAddressByUsernameRequest) updates) => super.copyWith((message) => updates(message as QueryGetAddressByUsernameRequest)) as QueryGetAddressByUsernameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetAddressByUsernameRequest create() => QueryGetAddressByUsernameRequest._();
  QueryGetAddressByUsernameRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetAddressByUsernameRequest> createRepeated() => $pb.PbList<QueryGetAddressByUsernameRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetAddressByUsernameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetAddressByUsernameRequest>(create);
  static QueryGetAddressByUsernameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
}

class QueryGetUsernameByAddressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetUsernameByAddressResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$8.Username>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username', subBuilder: $8.Username.create)
    ..hasRequiredFields = false
  ;

  QueryGetUsernameByAddressResponse._() : super();
  factory QueryGetUsernameByAddressResponse({
    $8.Username? username,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    return _result;
  }
  factory QueryGetUsernameByAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetUsernameByAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetUsernameByAddressResponse clone() => QueryGetUsernameByAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetUsernameByAddressResponse copyWith(void Function(QueryGetUsernameByAddressResponse) updates) => super.copyWith((message) => updates(message as QueryGetUsernameByAddressResponse)) as QueryGetUsernameByAddressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetUsernameByAddressResponse create() => QueryGetUsernameByAddressResponse._();
  QueryGetUsernameByAddressResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetUsernameByAddressResponse> createRepeated() => $pb.PbList<QueryGetUsernameByAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetUsernameByAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetUsernameByAddressResponse>(create);
  static QueryGetUsernameByAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.Username get username => $_getN(0);
  @$pb.TagNumber(1)
  set username($8.Username v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
  @$pb.TagNumber(1)
  $8.Username ensureUsername() => $_ensure(0);
}

class QueryGetAddressByUsernameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetAddressByUsernameResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$8.AccountAddr>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $8.AccountAddr.create)
    ..hasRequiredFields = false
  ;

  QueryGetAddressByUsernameResponse._() : super();
  factory QueryGetAddressByUsernameResponse({
    $8.AccountAddr? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryGetAddressByUsernameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetAddressByUsernameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetAddressByUsernameResponse clone() => QueryGetAddressByUsernameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetAddressByUsernameResponse copyWith(void Function(QueryGetAddressByUsernameResponse) updates) => super.copyWith((message) => updates(message as QueryGetAddressByUsernameResponse)) as QueryGetAddressByUsernameResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetAddressByUsernameResponse create() => QueryGetAddressByUsernameResponse._();
  QueryGetAddressByUsernameResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetAddressByUsernameResponse> createRepeated() => $pb.PbList<QueryGetAddressByUsernameResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetAddressByUsernameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetAddressByUsernameResponse>(create);
  static QueryGetAddressByUsernameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.AccountAddr get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($8.AccountAddr v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  $8.AccountAddr ensureAddress() => $_ensure(0);
}

class QueryGetTradeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetTradeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', $pb.PbFieldType.OU6, protoName: 'ID', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryGetTradeRequest._() : super();
  factory QueryGetTradeRequest({
    $fixnum.Int64? iD,
  }) {
    final _result = create();
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory QueryGetTradeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetTradeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetTradeRequest clone() => QueryGetTradeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetTradeRequest copyWith(void Function(QueryGetTradeRequest) updates) => super.copyWith((message) => updates(message as QueryGetTradeRequest)) as QueryGetTradeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetTradeRequest create() => QueryGetTradeRequest._();
  QueryGetTradeRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetTradeRequest> createRepeated() => $pb.PbList<QueryGetTradeRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetTradeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetTradeRequest>(create);
  static QueryGetTradeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iD => $_getI64(0);
  @$pb.TagNumber(1)
  set iD($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(1)
  void clearID() => clearField(1);
}

class QueryGetTradeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetTradeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$4.Trade>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Trade', protoName: 'Trade', subBuilder: $4.Trade.create)
    ..hasRequiredFields = false
  ;

  QueryGetTradeResponse._() : super();
  factory QueryGetTradeResponse({
    $4.Trade? trade,
  }) {
    final _result = create();
    if (trade != null) {
      _result.trade = trade;
    }
    return _result;
  }
  factory QueryGetTradeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetTradeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetTradeResponse clone() => QueryGetTradeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetTradeResponse copyWith(void Function(QueryGetTradeResponse) updates) => super.copyWith((message) => updates(message as QueryGetTradeResponse)) as QueryGetTradeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetTradeResponse create() => QueryGetTradeResponse._();
  QueryGetTradeResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetTradeResponse> createRepeated() => $pb.PbList<QueryGetTradeResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetTradeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetTradeResponse>(create);
  static QueryGetTradeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.Trade get trade => $_getN(0);
  @$pb.TagNumber(1)
  set trade($4.Trade v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrade() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrade() => clearField(1);
  @$pb.TagNumber(1)
  $4.Trade ensureTrade() => $_ensure(0);
}

class QueryListItemByOwnerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListItemByOwnerRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOM<$9.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListItemByOwnerRequest._() : super();
  factory QueryListItemByOwnerRequest({
    $core.String? owner,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (owner != null) {
      _result.owner = owner;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListItemByOwnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListItemByOwnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListItemByOwnerRequest clone() => QueryListItemByOwnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListItemByOwnerRequest copyWith(void Function(QueryListItemByOwnerRequest) updates) => super.copyWith((message) => updates(message as QueryListItemByOwnerRequest)) as QueryListItemByOwnerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListItemByOwnerRequest create() => QueryListItemByOwnerRequest._();
  QueryListItemByOwnerRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListItemByOwnerRequest> createRepeated() => $pb.PbList<QueryListItemByOwnerRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListItemByOwnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListItemByOwnerRequest>(create);
  static QueryListItemByOwnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get owner => $_getSZ(0);
  @$pb.TagNumber(1)
  set owner($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => clearField(1);

  @$pb.TagNumber(3)
  $9.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(3)
  set pagination($9.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageRequest ensurePagination() => $_ensure(1);
}

class QueryListItemByOwnerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListItemByOwnerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$1.Item>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Items', $pb.PbFieldType.PM, protoName: 'Items', subBuilder: $1.Item.create)
    ..aOM<$9.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListItemByOwnerResponse._() : super();
  factory QueryListItemByOwnerResponse({
    $core.Iterable<$1.Item>? items,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListItemByOwnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListItemByOwnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListItemByOwnerResponse clone() => QueryListItemByOwnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListItemByOwnerResponse copyWith(void Function(QueryListItemByOwnerResponse) updates) => super.copyWith((message) => updates(message as QueryListItemByOwnerResponse)) as QueryListItemByOwnerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListItemByOwnerResponse create() => QueryListItemByOwnerResponse._();
  QueryListItemByOwnerResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListItemByOwnerResponse> createRepeated() => $pb.PbList<QueryListItemByOwnerResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListItemByOwnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListItemByOwnerResponse>(create);
  static QueryListItemByOwnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Item> get items => $_getList(0);

  @$pb.TagNumber(2)
  $9.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($9.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $9.PageResponse ensurePagination() => $_ensure(1);
}

class QueryGetGoogleInAppPurchaseOrderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetGoogleInAppPurchaseOrderRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PurchaseToken', protoName: 'PurchaseToken')
    ..hasRequiredFields = false
  ;

  QueryGetGoogleInAppPurchaseOrderRequest._() : super();
  factory QueryGetGoogleInAppPurchaseOrderRequest({
    $core.String? purchaseToken,
  }) {
    final _result = create();
    if (purchaseToken != null) {
      _result.purchaseToken = purchaseToken;
    }
    return _result;
  }
  factory QueryGetGoogleInAppPurchaseOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetGoogleInAppPurchaseOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetGoogleInAppPurchaseOrderRequest clone() => QueryGetGoogleInAppPurchaseOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetGoogleInAppPurchaseOrderRequest copyWith(void Function(QueryGetGoogleInAppPurchaseOrderRequest) updates) => super.copyWith((message) => updates(message as QueryGetGoogleInAppPurchaseOrderRequest)) as QueryGetGoogleInAppPurchaseOrderRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetGoogleInAppPurchaseOrderRequest create() => QueryGetGoogleInAppPurchaseOrderRequest._();
  QueryGetGoogleInAppPurchaseOrderRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetGoogleInAppPurchaseOrderRequest> createRepeated() => $pb.PbList<QueryGetGoogleInAppPurchaseOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetGoogleInAppPurchaseOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetGoogleInAppPurchaseOrderRequest>(create);
  static QueryGetGoogleInAppPurchaseOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get purchaseToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPurchaseToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseToken() => clearField(1);
}

class QueryGetGoogleInAppPurchaseOrderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetGoogleInAppPurchaseOrderResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$6.GoogleInAppPurchaseOrder>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Order', protoName: 'Order', subBuilder: $6.GoogleInAppPurchaseOrder.create)
    ..hasRequiredFields = false
  ;

  QueryGetGoogleInAppPurchaseOrderResponse._() : super();
  factory QueryGetGoogleInAppPurchaseOrderResponse({
    $6.GoogleInAppPurchaseOrder? order,
  }) {
    final _result = create();
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory QueryGetGoogleInAppPurchaseOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetGoogleInAppPurchaseOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetGoogleInAppPurchaseOrderResponse clone() => QueryGetGoogleInAppPurchaseOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetGoogleInAppPurchaseOrderResponse copyWith(void Function(QueryGetGoogleInAppPurchaseOrderResponse) updates) => super.copyWith((message) => updates(message as QueryGetGoogleInAppPurchaseOrderResponse)) as QueryGetGoogleInAppPurchaseOrderResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetGoogleInAppPurchaseOrderResponse create() => QueryGetGoogleInAppPurchaseOrderResponse._();
  QueryGetGoogleInAppPurchaseOrderResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetGoogleInAppPurchaseOrderResponse> createRepeated() => $pb.PbList<QueryGetGoogleInAppPurchaseOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetGoogleInAppPurchaseOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetGoogleInAppPurchaseOrderResponse>(create);
  static QueryGetGoogleInAppPurchaseOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $6.GoogleInAppPurchaseOrder get order => $_getN(0);
  @$pb.TagNumber(1)
  set order($6.GoogleInAppPurchaseOrder v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrder() => clearField(1);
  @$pb.TagNumber(1)
  $6.GoogleInAppPurchaseOrder ensureOrder() => $_ensure(0);
}

class QueryListExecutionsByItemRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListExecutionsByItemRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CookbookID', protoName: 'CookbookID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ItemID', protoName: 'ItemID')
    ..aOM<$9.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListExecutionsByItemRequest._() : super();
  factory QueryListExecutionsByItemRequest({
    $core.String? cookbookID,
    $core.String? itemID,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (cookbookID != null) {
      _result.cookbookID = cookbookID;
    }
    if (itemID != null) {
      _result.itemID = itemID;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListExecutionsByItemRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListExecutionsByItemRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByItemRequest clone() => QueryListExecutionsByItemRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByItemRequest copyWith(void Function(QueryListExecutionsByItemRequest) updates) => super.copyWith((message) => updates(message as QueryListExecutionsByItemRequest)) as QueryListExecutionsByItemRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByItemRequest create() => QueryListExecutionsByItemRequest._();
  QueryListExecutionsByItemRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListExecutionsByItemRequest> createRepeated() => $pb.PbList<QueryListExecutionsByItemRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByItemRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListExecutionsByItemRequest>(create);
  static QueryListExecutionsByItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cookbookID => $_getSZ(0);
  @$pb.TagNumber(1)
  set cookbookID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbookID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get itemID => $_getSZ(1);
  @$pb.TagNumber(2)
  set itemID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasItemID() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemID() => clearField(2);

  @$pb.TagNumber(3)
  $9.PageRequest get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($9.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageRequest ensurePagination() => $_ensure(2);
}

class QueryListExecutionsByItemResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListExecutionsByItemResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$5.Execution>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CompletedExecutions', $pb.PbFieldType.PM, protoName: 'CompletedExecutions', subBuilder: $5.Execution.create)
    ..pc<$5.Execution>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PendingExecutions', $pb.PbFieldType.PM, protoName: 'PendingExecutions', subBuilder: $5.Execution.create)
    ..aOM<$9.PageResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListExecutionsByItemResponse._() : super();
  factory QueryListExecutionsByItemResponse({
    $core.Iterable<$5.Execution>? completedExecutions,
    $core.Iterable<$5.Execution>? pendingExecutions,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (completedExecutions != null) {
      _result.completedExecutions.addAll(completedExecutions);
    }
    if (pendingExecutions != null) {
      _result.pendingExecutions.addAll(pendingExecutions);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListExecutionsByItemResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListExecutionsByItemResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByItemResponse clone() => QueryListExecutionsByItemResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByItemResponse copyWith(void Function(QueryListExecutionsByItemResponse) updates) => super.copyWith((message) => updates(message as QueryListExecutionsByItemResponse)) as QueryListExecutionsByItemResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByItemResponse create() => QueryListExecutionsByItemResponse._();
  QueryListExecutionsByItemResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListExecutionsByItemResponse> createRepeated() => $pb.PbList<QueryListExecutionsByItemResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByItemResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListExecutionsByItemResponse>(create);
  static QueryListExecutionsByItemResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.Execution> get completedExecutions => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$5.Execution> get pendingExecutions => $_getList(1);

  @$pb.TagNumber(3)
  $9.PageResponse get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($9.PageResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageResponse ensurePagination() => $_ensure(2);
}

class QueryListExecutionsByRecipeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListExecutionsByRecipeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CookbookID', protoName: 'CookbookID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RecipeID', protoName: 'RecipeID')
    ..aOM<$9.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListExecutionsByRecipeRequest._() : super();
  factory QueryListExecutionsByRecipeRequest({
    $core.String? cookbookID,
    $core.String? recipeID,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (cookbookID != null) {
      _result.cookbookID = cookbookID;
    }
    if (recipeID != null) {
      _result.recipeID = recipeID;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListExecutionsByRecipeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListExecutionsByRecipeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByRecipeRequest clone() => QueryListExecutionsByRecipeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByRecipeRequest copyWith(void Function(QueryListExecutionsByRecipeRequest) updates) => super.copyWith((message) => updates(message as QueryListExecutionsByRecipeRequest)) as QueryListExecutionsByRecipeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByRecipeRequest create() => QueryListExecutionsByRecipeRequest._();
  QueryListExecutionsByRecipeRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListExecutionsByRecipeRequest> createRepeated() => $pb.PbList<QueryListExecutionsByRecipeRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByRecipeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListExecutionsByRecipeRequest>(create);
  static QueryListExecutionsByRecipeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cookbookID => $_getSZ(0);
  @$pb.TagNumber(1)
  set cookbookID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbookID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get recipeID => $_getSZ(1);
  @$pb.TagNumber(2)
  set recipeID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecipeID() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecipeID() => clearField(2);

  @$pb.TagNumber(3)
  $9.PageRequest get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($9.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageRequest ensurePagination() => $_ensure(2);
}

class QueryListExecutionsByRecipeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListExecutionsByRecipeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$5.Execution>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CompletedExecutions', $pb.PbFieldType.PM, protoName: 'CompletedExecutions', subBuilder: $5.Execution.create)
    ..pc<$5.Execution>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PendingExecutions', $pb.PbFieldType.PM, protoName: 'PendingExecutions', subBuilder: $5.Execution.create)
    ..aOM<$9.PageResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListExecutionsByRecipeResponse._() : super();
  factory QueryListExecutionsByRecipeResponse({
    $core.Iterable<$5.Execution>? completedExecutions,
    $core.Iterable<$5.Execution>? pendingExecutions,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (completedExecutions != null) {
      _result.completedExecutions.addAll(completedExecutions);
    }
    if (pendingExecutions != null) {
      _result.pendingExecutions.addAll(pendingExecutions);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListExecutionsByRecipeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListExecutionsByRecipeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByRecipeResponse clone() => QueryListExecutionsByRecipeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListExecutionsByRecipeResponse copyWith(void Function(QueryListExecutionsByRecipeResponse) updates) => super.copyWith((message) => updates(message as QueryListExecutionsByRecipeResponse)) as QueryListExecutionsByRecipeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByRecipeResponse create() => QueryListExecutionsByRecipeResponse._();
  QueryListExecutionsByRecipeResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListExecutionsByRecipeResponse> createRepeated() => $pb.PbList<QueryListExecutionsByRecipeResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListExecutionsByRecipeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListExecutionsByRecipeResponse>(create);
  static QueryListExecutionsByRecipeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.Execution> get completedExecutions => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$5.Execution> get pendingExecutions => $_getList(1);

  @$pb.TagNumber(3)
  $9.PageResponse get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($9.PageResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageResponse ensurePagination() => $_ensure(2);
}

class QueryGetExecutionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetExecutionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', protoName: 'ID')
    ..hasRequiredFields = false
  ;

  QueryGetExecutionRequest._() : super();
  factory QueryGetExecutionRequest({
    $core.String? iD,
  }) {
    final _result = create();
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory QueryGetExecutionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetExecutionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetExecutionRequest clone() => QueryGetExecutionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetExecutionRequest copyWith(void Function(QueryGetExecutionRequest) updates) => super.copyWith((message) => updates(message as QueryGetExecutionRequest)) as QueryGetExecutionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetExecutionRequest create() => QueryGetExecutionRequest._();
  QueryGetExecutionRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetExecutionRequest> createRepeated() => $pb.PbList<QueryGetExecutionRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetExecutionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetExecutionRequest>(create);
  static QueryGetExecutionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get iD => $_getSZ(0);
  @$pb.TagNumber(1)
  set iD($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(1)
  void clearID() => clearField(1);
}

class QueryGetExecutionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetExecutionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$5.Execution>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Execution', protoName: 'Execution', subBuilder: $5.Execution.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Completed', protoName: 'Completed')
    ..hasRequiredFields = false
  ;

  QueryGetExecutionResponse._() : super();
  factory QueryGetExecutionResponse({
    $5.Execution? execution,
    $core.bool? completed,
  }) {
    final _result = create();
    if (execution != null) {
      _result.execution = execution;
    }
    if (completed != null) {
      _result.completed = completed;
    }
    return _result;
  }
  factory QueryGetExecutionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetExecutionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetExecutionResponse clone() => QueryGetExecutionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetExecutionResponse copyWith(void Function(QueryGetExecutionResponse) updates) => super.copyWith((message) => updates(message as QueryGetExecutionResponse)) as QueryGetExecutionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetExecutionResponse create() => QueryGetExecutionResponse._();
  QueryGetExecutionResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetExecutionResponse> createRepeated() => $pb.PbList<QueryGetExecutionResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetExecutionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetExecutionResponse>(create);
  static QueryGetExecutionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Execution get execution => $_getN(0);
  @$pb.TagNumber(1)
  set execution($5.Execution v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExecution() => $_has(0);
  @$pb.TagNumber(1)
  void clearExecution() => clearField(1);
  @$pb.TagNumber(1)
  $5.Execution ensureExecution() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get completed => $_getBF(1);
  @$pb.TagNumber(2)
  set completed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompleted() => clearField(2);
}

class QueryListRecipesByCookbookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListRecipesByCookbookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CookbookID', protoName: 'CookbookID')
    ..aOM<$9.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListRecipesByCookbookRequest._() : super();
  factory QueryListRecipesByCookbookRequest({
    $core.String? cookbookID,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (cookbookID != null) {
      _result.cookbookID = cookbookID;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListRecipesByCookbookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListRecipesByCookbookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListRecipesByCookbookRequest clone() => QueryListRecipesByCookbookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListRecipesByCookbookRequest copyWith(void Function(QueryListRecipesByCookbookRequest) updates) => super.copyWith((message) => updates(message as QueryListRecipesByCookbookRequest)) as QueryListRecipesByCookbookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListRecipesByCookbookRequest create() => QueryListRecipesByCookbookRequest._();
  QueryListRecipesByCookbookRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListRecipesByCookbookRequest> createRepeated() => $pb.PbList<QueryListRecipesByCookbookRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListRecipesByCookbookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListRecipesByCookbookRequest>(create);
  static QueryListRecipesByCookbookRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cookbookID => $_getSZ(0);
  @$pb.TagNumber(1)
  set cookbookID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbookID() => clearField(1);

  @$pb.TagNumber(2)
  $9.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($9.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $9.PageRequest ensurePagination() => $_ensure(1);
}

class QueryListRecipesByCookbookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListRecipesByCookbookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$2.Recipe>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Recipes', $pb.PbFieldType.PM, protoName: 'Recipes', subBuilder: $2.Recipe.create)
    ..aOM<$9.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListRecipesByCookbookResponse._() : super();
  factory QueryListRecipesByCookbookResponse({
    $core.Iterable<$2.Recipe>? recipes,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (recipes != null) {
      _result.recipes.addAll(recipes);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListRecipesByCookbookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListRecipesByCookbookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListRecipesByCookbookResponse clone() => QueryListRecipesByCookbookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListRecipesByCookbookResponse copyWith(void Function(QueryListRecipesByCookbookResponse) updates) => super.copyWith((message) => updates(message as QueryListRecipesByCookbookResponse)) as QueryListRecipesByCookbookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListRecipesByCookbookResponse create() => QueryListRecipesByCookbookResponse._();
  QueryListRecipesByCookbookResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListRecipesByCookbookResponse> createRepeated() => $pb.PbList<QueryListRecipesByCookbookResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListRecipesByCookbookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListRecipesByCookbookResponse>(create);
  static QueryListRecipesByCookbookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Recipe> get recipes => $_getList(0);

  @$pb.TagNumber(2)
  $9.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($9.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $9.PageResponse ensurePagination() => $_ensure(1);
}

class QueryGetItemRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetItemRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CookbookID', protoName: 'CookbookID')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', protoName: 'ID')
    ..hasRequiredFields = false
  ;

  QueryGetItemRequest._() : super();
  factory QueryGetItemRequest({
    $core.String? cookbookID,
    $core.String? iD,
  }) {
    final _result = create();
    if (cookbookID != null) {
      _result.cookbookID = cookbookID;
    }
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory QueryGetItemRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetItemRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetItemRequest clone() => QueryGetItemRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetItemRequest copyWith(void Function(QueryGetItemRequest) updates) => super.copyWith((message) => updates(message as QueryGetItemRequest)) as QueryGetItemRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetItemRequest create() => QueryGetItemRequest._();
  QueryGetItemRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetItemRequest> createRepeated() => $pb.PbList<QueryGetItemRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetItemRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetItemRequest>(create);
  static QueryGetItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cookbookID => $_getSZ(0);
  @$pb.TagNumber(1)
  set cookbookID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbookID() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get iD => $_getSZ(1);
  @$pb.TagNumber(3)
  set iD($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasID() => $_has(1);
  @$pb.TagNumber(3)
  void clearID() => clearField(3);
}

class QueryGetItemResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetItemResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$1.Item>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Item', protoName: 'Item', subBuilder: $1.Item.create)
    ..hasRequiredFields = false
  ;

  QueryGetItemResponse._() : super();
  factory QueryGetItemResponse({
    $1.Item? item,
  }) {
    final _result = create();
    if (item != null) {
      _result.item = item;
    }
    return _result;
  }
  factory QueryGetItemResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetItemResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetItemResponse clone() => QueryGetItemResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetItemResponse copyWith(void Function(QueryGetItemResponse) updates) => super.copyWith((message) => updates(message as QueryGetItemResponse)) as QueryGetItemResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetItemResponse create() => QueryGetItemResponse._();
  QueryGetItemResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetItemResponse> createRepeated() => $pb.PbList<QueryGetItemResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetItemResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetItemResponse>(create);
  static QueryGetItemResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Item get item => $_getN(0);
  @$pb.TagNumber(1)
  set item($1.Item v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => clearField(1);
  @$pb.TagNumber(1)
  $1.Item ensureItem() => $_ensure(0);
}

class QueryGetRecipeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetRecipeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CookbookID', protoName: 'CookbookID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', protoName: 'ID')
    ..hasRequiredFields = false
  ;

  QueryGetRecipeRequest._() : super();
  factory QueryGetRecipeRequest({
    $core.String? cookbookID,
    $core.String? iD,
  }) {
    final _result = create();
    if (cookbookID != null) {
      _result.cookbookID = cookbookID;
    }
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory QueryGetRecipeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetRecipeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetRecipeRequest clone() => QueryGetRecipeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetRecipeRequest copyWith(void Function(QueryGetRecipeRequest) updates) => super.copyWith((message) => updates(message as QueryGetRecipeRequest)) as QueryGetRecipeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetRecipeRequest create() => QueryGetRecipeRequest._();
  QueryGetRecipeRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetRecipeRequest> createRepeated() => $pb.PbList<QueryGetRecipeRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetRecipeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetRecipeRequest>(create);
  static QueryGetRecipeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cookbookID => $_getSZ(0);
  @$pb.TagNumber(1)
  set cookbookID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbookID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get iD => $_getSZ(1);
  @$pb.TagNumber(2)
  set iD($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasID() => $_has(1);
  @$pb.TagNumber(2)
  void clearID() => clearField(2);
}

class QueryGetRecipeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetRecipeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$2.Recipe>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Recipe', protoName: 'Recipe', subBuilder: $2.Recipe.create)
    ..hasRequiredFields = false
  ;

  QueryGetRecipeResponse._() : super();
  factory QueryGetRecipeResponse({
    $2.Recipe? recipe,
  }) {
    final _result = create();
    if (recipe != null) {
      _result.recipe = recipe;
    }
    return _result;
  }
  factory QueryGetRecipeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetRecipeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetRecipeResponse clone() => QueryGetRecipeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetRecipeResponse copyWith(void Function(QueryGetRecipeResponse) updates) => super.copyWith((message) => updates(message as QueryGetRecipeResponse)) as QueryGetRecipeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetRecipeResponse create() => QueryGetRecipeResponse._();
  QueryGetRecipeResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetRecipeResponse> createRepeated() => $pb.PbList<QueryGetRecipeResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetRecipeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetRecipeResponse>(create);
  static QueryGetRecipeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Recipe get recipe => $_getN(0);
  @$pb.TagNumber(1)
  set recipe($2.Recipe v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecipe() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipe() => clearField(1);
  @$pb.TagNumber(1)
  $2.Recipe ensureRecipe() => $_ensure(0);
}

class QueryListCookbooksByCreatorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListCookbooksByCreatorRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creator')
    ..aOM<$9.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryListCookbooksByCreatorRequest._() : super();
  factory QueryListCookbooksByCreatorRequest({
    $core.String? creator,
    $9.PageRequest? pagination,
  }) {
    final _result = create();
    if (creator != null) {
      _result.creator = creator;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListCookbooksByCreatorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListCookbooksByCreatorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListCookbooksByCreatorRequest clone() => QueryListCookbooksByCreatorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListCookbooksByCreatorRequest copyWith(void Function(QueryListCookbooksByCreatorRequest) updates) => super.copyWith((message) => updates(message as QueryListCookbooksByCreatorRequest)) as QueryListCookbooksByCreatorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListCookbooksByCreatorRequest create() => QueryListCookbooksByCreatorRequest._();
  QueryListCookbooksByCreatorRequest createEmptyInstance() => create();
  static $pb.PbList<QueryListCookbooksByCreatorRequest> createRepeated() => $pb.PbList<QueryListCookbooksByCreatorRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryListCookbooksByCreatorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListCookbooksByCreatorRequest>(create);
  static QueryListCookbooksByCreatorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creator => $_getSZ(0);
  @$pb.TagNumber(1)
  set creator($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreator() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreator() => clearField(1);

  @$pb.TagNumber(3)
  $9.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(3)
  set pagination($9.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageRequest ensurePagination() => $_ensure(1);
}

class QueryListCookbooksByCreatorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryListCookbooksByCreatorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..pc<$3.Cookbook>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Cookbooks', $pb.PbFieldType.PM, protoName: 'Cookbooks', subBuilder: $3.Cookbook.create)
    ..aOM<$9.PageResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $9.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryListCookbooksByCreatorResponse._() : super();
  factory QueryListCookbooksByCreatorResponse({
    $core.Iterable<$3.Cookbook>? cookbooks,
    $9.PageResponse? pagination,
  }) {
    final _result = create();
    if (cookbooks != null) {
      _result.cookbooks.addAll(cookbooks);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryListCookbooksByCreatorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryListCookbooksByCreatorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryListCookbooksByCreatorResponse clone() => QueryListCookbooksByCreatorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryListCookbooksByCreatorResponse copyWith(void Function(QueryListCookbooksByCreatorResponse) updates) => super.copyWith((message) => updates(message as QueryListCookbooksByCreatorResponse)) as QueryListCookbooksByCreatorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryListCookbooksByCreatorResponse create() => QueryListCookbooksByCreatorResponse._();
  QueryListCookbooksByCreatorResponse createEmptyInstance() => create();
  static $pb.PbList<QueryListCookbooksByCreatorResponse> createRepeated() => $pb.PbList<QueryListCookbooksByCreatorResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryListCookbooksByCreatorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryListCookbooksByCreatorResponse>(create);
  static QueryListCookbooksByCreatorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Cookbook> get cookbooks => $_getList(0);

  @$pb.TagNumber(3)
  $9.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(3)
  set pagination($9.PageResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $9.PageResponse ensurePagination() => $_ensure(1);
}

class QueryGetCookbookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetCookbookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', protoName: 'ID')
    ..hasRequiredFields = false
  ;

  QueryGetCookbookRequest._() : super();
  factory QueryGetCookbookRequest({
    $core.String? iD,
  }) {
    final _result = create();
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory QueryGetCookbookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetCookbookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetCookbookRequest clone() => QueryGetCookbookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetCookbookRequest copyWith(void Function(QueryGetCookbookRequest) updates) => super.copyWith((message) => updates(message as QueryGetCookbookRequest)) as QueryGetCookbookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetCookbookRequest create() => QueryGetCookbookRequest._();
  QueryGetCookbookRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetCookbookRequest> createRepeated() => $pb.PbList<QueryGetCookbookRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetCookbookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetCookbookRequest>(create);
  static QueryGetCookbookRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get iD => $_getSZ(0);
  @$pb.TagNumber(1)
  set iD($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(1)
  void clearID() => clearField(1);
}

class QueryGetCookbookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetCookbookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pylonstech.pylons.pylons'), createEmptyInstance: create)
    ..aOM<$3.Cookbook>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Cookbook', protoName: 'Cookbook', subBuilder: $3.Cookbook.create)
    ..hasRequiredFields = false
  ;

  QueryGetCookbookResponse._() : super();
  factory QueryGetCookbookResponse({
    $3.Cookbook? cookbook,
  }) {
    final _result = create();
    if (cookbook != null) {
      _result.cookbook = cookbook;
    }
    return _result;
  }
  factory QueryGetCookbookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetCookbookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetCookbookResponse clone() => QueryGetCookbookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetCookbookResponse copyWith(void Function(QueryGetCookbookResponse) updates) => super.copyWith((message) => updates(message as QueryGetCookbookResponse)) as QueryGetCookbookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetCookbookResponse create() => QueryGetCookbookResponse._();
  QueryGetCookbookResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetCookbookResponse> createRepeated() => $pb.PbList<QueryGetCookbookResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetCookbookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetCookbookResponse>(create);
  static QueryGetCookbookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Cookbook get cookbook => $_getN(0);
  @$pb.TagNumber(1)
  set cookbook($3.Cookbook v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCookbook() => $_has(0);
  @$pb.TagNumber(1)
  void clearCookbook() => clearField(1);
  @$pb.TagNumber(1)
  $3.Cookbook ensureCookbook() => $_ensure(0);
}

class QueryApi {
  $pb.RpcClient _client;
  QueryApi(this._client);

  $async.Future<QueryListTradesByCreatorResponse> listTradesByCreator($pb.ClientContext? ctx, QueryListTradesByCreatorRequest request) {
    var emptyResponse = QueryListTradesByCreatorResponse();
    return _client.invoke<QueryListTradesByCreatorResponse>(ctx, 'Query', 'ListTradesByCreator', request, emptyResponse);
  }
  $async.Future<QueryGetUsernameByAddressResponse> usernameByAddress($pb.ClientContext? ctx, QueryGetUsernameByAddressRequest request) {
    var emptyResponse = QueryGetUsernameByAddressResponse();
    return _client.invoke<QueryGetUsernameByAddressResponse>(ctx, 'Query', 'UsernameByAddress', request, emptyResponse);
  }
  $async.Future<QueryGetAddressByUsernameResponse> addressByUsername($pb.ClientContext? ctx, QueryGetAddressByUsernameRequest request) {
    var emptyResponse = QueryGetAddressByUsernameResponse();
    return _client.invoke<QueryGetAddressByUsernameResponse>(ctx, 'Query', 'AddressByUsername', request, emptyResponse);
  }
  $async.Future<QueryGetTradeResponse> trade($pb.ClientContext? ctx, QueryGetTradeRequest request) {
    var emptyResponse = QueryGetTradeResponse();
    return _client.invoke<QueryGetTradeResponse>(ctx, 'Query', 'Trade', request, emptyResponse);
  }
  $async.Future<QueryListItemByOwnerResponse> listItemByOwner($pb.ClientContext? ctx, QueryListItemByOwnerRequest request) {
    var emptyResponse = QueryListItemByOwnerResponse();
    return _client.invoke<QueryListItemByOwnerResponse>(ctx, 'Query', 'ListItemByOwner', request, emptyResponse);
  }
  $async.Future<QueryGetGoogleInAppPurchaseOrderResponse> googleInAppPurchaseOrder($pb.ClientContext? ctx, QueryGetGoogleInAppPurchaseOrderRequest request) {
    var emptyResponse = QueryGetGoogleInAppPurchaseOrderResponse();
    return _client.invoke<QueryGetGoogleInAppPurchaseOrderResponse>(ctx, 'Query', 'GoogleInAppPurchaseOrder', request, emptyResponse);
  }
  $async.Future<QueryListExecutionsByItemResponse> listExecutionsByItem($pb.ClientContext? ctx, QueryListExecutionsByItemRequest request) {
    var emptyResponse = QueryListExecutionsByItemResponse();
    return _client.invoke<QueryListExecutionsByItemResponse>(ctx, 'Query', 'ListExecutionsByItem', request, emptyResponse);
  }
  $async.Future<QueryListExecutionsByRecipeResponse> listExecutionsByRecipe($pb.ClientContext? ctx, QueryListExecutionsByRecipeRequest request) {
    var emptyResponse = QueryListExecutionsByRecipeResponse();
    return _client.invoke<QueryListExecutionsByRecipeResponse>(ctx, 'Query', 'ListExecutionsByRecipe', request, emptyResponse);
  }
  $async.Future<QueryGetExecutionResponse> execution($pb.ClientContext? ctx, QueryGetExecutionRequest request) {
    var emptyResponse = QueryGetExecutionResponse();
    return _client.invoke<QueryGetExecutionResponse>(ctx, 'Query', 'Execution', request, emptyResponse);
  }
  $async.Future<QueryListRecipesByCookbookResponse> listRecipesByCookbook($pb.ClientContext? ctx, QueryListRecipesByCookbookRequest request) {
    var emptyResponse = QueryListRecipesByCookbookResponse();
    return _client.invoke<QueryListRecipesByCookbookResponse>(ctx, 'Query', 'ListRecipesByCookbook', request, emptyResponse);
  }
  $async.Future<QueryGetItemResponse> item($pb.ClientContext? ctx, QueryGetItemRequest request) {
    var emptyResponse = QueryGetItemResponse();
    return _client.invoke<QueryGetItemResponse>(ctx, 'Query', 'Item', request, emptyResponse);
  }
  $async.Future<QueryGetRecipeResponse> recipe($pb.ClientContext? ctx, QueryGetRecipeRequest request) {
    var emptyResponse = QueryGetRecipeResponse();
    return _client.invoke<QueryGetRecipeResponse>(ctx, 'Query', 'Recipe', request, emptyResponse);
  }
  $async.Future<QueryListCookbooksByCreatorResponse> listCookbooksByCreator($pb.ClientContext? ctx, QueryListCookbooksByCreatorRequest request) {
    var emptyResponse = QueryListCookbooksByCreatorResponse();
    return _client.invoke<QueryListCookbooksByCreatorResponse>(ctx, 'Query', 'ListCookbooksByCreator', request, emptyResponse);
  }
  $async.Future<QueryGetCookbookResponse> cookbook($pb.ClientContext? ctx, QueryGetCookbookRequest request) {
    var emptyResponse = QueryGetCookbookResponse();
    return _client.invoke<QueryGetCookbookResponse>(ctx, 'Query', 'Cookbook', request, emptyResponse);
  }
}

