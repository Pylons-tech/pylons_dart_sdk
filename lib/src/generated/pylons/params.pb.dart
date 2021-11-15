///
//  Generated code. Do not modify.
//  source: pylons/params.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../cosmos/base/v1beta1/coin.pb.dart' as $0;

class GoogleInAppPurchasePackage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GoogleInAppPurchasePackage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'Pylonstech.pylons.pylons'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packageName',
        protoName: 'packageName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'productID',
        protoName: 'productID')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'amount')
    ..hasRequiredFields = false;

  GoogleInAppPurchasePackage._() : super();
  factory GoogleInAppPurchasePackage({
    $core.String? packageName,
    $core.String? productID,
    $core.String? amount,
  }) {
    final _result = create();
    if (packageName != null) {
      _result.packageName = packageName;
    }
    if (productID != null) {
      _result.productID = productID;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory GoogleInAppPurchasePackage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GoogleInAppPurchasePackage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GoogleInAppPurchasePackage clone() =>
      GoogleInAppPurchasePackage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GoogleInAppPurchasePackage copyWith(
          void Function(GoogleInAppPurchasePackage) updates) =>
      super.copyWith(
              (message) => updates(message as GoogleInAppPurchasePackage))
          as GoogleInAppPurchasePackage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GoogleInAppPurchasePackage create() => GoogleInAppPurchasePackage._();
  GoogleInAppPurchasePackage createEmptyInstance() => create();
  static $pb.PbList<GoogleInAppPurchasePackage> createRepeated() =>
      $pb.PbList<GoogleInAppPurchasePackage>();
  @$core.pragma('dart2js:noInline')
  static GoogleInAppPurchasePackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoogleInAppPurchasePackage>(create);
  static GoogleInAppPurchasePackage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get packageName => $_getSZ(0);
  @$pb.TagNumber(1)
  set packageName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPackageName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get productID => $_getSZ(1);
  @$pb.TagNumber(2)
  set productID($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProductID() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get amount => $_getSZ(2);
  @$pb.TagNumber(3)
  set amount($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class CoinIssuer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CoinIssuer',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'Pylonstech.pylons.pylons'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coinDenom',
        protoName: 'coinDenom')
    ..pc<GoogleInAppPurchasePackage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packages',
        $pb.PbFieldType.PM,
        subBuilder: GoogleInAppPurchasePackage.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'googleInAppPurchasePubKey',
        protoName: 'googleInAppPurchasePubKey')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entityName',
        protoName: 'entityName')
    ..hasRequiredFields = false;

  CoinIssuer._() : super();
  factory CoinIssuer({
    $core.String? coinDenom,
    $core.Iterable<GoogleInAppPurchasePackage>? packages,
    $core.String? googleInAppPurchasePubKey,
    $core.String? entityName,
  }) {
    final _result = create();
    if (coinDenom != null) {
      _result.coinDenom = coinDenom;
    }
    if (packages != null) {
      _result.packages.addAll(packages);
    }
    if (googleInAppPurchasePubKey != null) {
      _result.googleInAppPurchasePubKey = googleInAppPurchasePubKey;
    }
    if (entityName != null) {
      _result.entityName = entityName;
    }
    return _result;
  }
  factory CoinIssuer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CoinIssuer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CoinIssuer clone() => CoinIssuer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CoinIssuer copyWith(void Function(CoinIssuer) updates) =>
      super.copyWith((message) => updates(message as CoinIssuer))
          as CoinIssuer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CoinIssuer create() => CoinIssuer._();
  CoinIssuer createEmptyInstance() => create();
  static $pb.PbList<CoinIssuer> createRepeated() => $pb.PbList<CoinIssuer>();
  @$core.pragma('dart2js:noInline')
  static CoinIssuer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CoinIssuer>(create);
  static CoinIssuer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coinDenom => $_getSZ(0);
  @$pb.TagNumber(1)
  set coinDenom($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCoinDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoinDenom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GoogleInAppPurchasePackage> get packages => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get googleInAppPurchasePubKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set googleInAppPurchasePubKey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGoogleInAppPurchasePubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoogleInAppPurchasePubKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get entityName => $_getSZ(3);
  @$pb.TagNumber(4)
  set entityName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEntityName() => $_has(3);
  @$pb.TagNumber(4)
  void clearEntityName() => clearField(4);
}

class PaymentProcessor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PaymentProcessor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'Pylonstech.pylons.pylons'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'CoinDenom',
        protoName: 'CoinDenom')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubKey',
        protoName: 'pubKey')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'processorPercentage',
        protoName: 'processorPercentage')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'validatorsPercentage',
        protoName: 'validatorsPercentage')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  PaymentProcessor._() : super();
  factory PaymentProcessor({
    $core.String? coinDenom,
    $core.String? pubKey,
    $core.String? processorPercentage,
    $core.String? validatorsPercentage,
    $core.String? name,
  }) {
    final _result = create();
    if (coinDenom != null) {
      _result.coinDenom = coinDenom;
    }
    if (pubKey != null) {
      _result.pubKey = pubKey;
    }
    if (processorPercentage != null) {
      _result.processorPercentage = processorPercentage;
    }
    if (validatorsPercentage != null) {
      _result.validatorsPercentage = validatorsPercentage;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory PaymentProcessor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentProcessor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PaymentProcessor clone() => PaymentProcessor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PaymentProcessor copyWith(void Function(PaymentProcessor) updates) =>
      super.copyWith((message) => updates(message as PaymentProcessor))
          as PaymentProcessor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentProcessor create() => PaymentProcessor._();
  PaymentProcessor createEmptyInstance() => create();
  static $pb.PbList<PaymentProcessor> createRepeated() =>
      $pb.PbList<PaymentProcessor>();
  @$core.pragma('dart2js:noInline')
  static PaymentProcessor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentProcessor>(create);
  static PaymentProcessor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coinDenom => $_getSZ(0);
  @$pb.TagNumber(1)
  set coinDenom($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCoinDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoinDenom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pubKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set pubKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPubKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPubKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get processorPercentage => $_getSZ(2);
  @$pb.TagNumber(3)
  set processorPercentage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProcessorPercentage() => $_has(2);
  @$pb.TagNumber(3)
  void clearProcessorPercentage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get validatorsPercentage => $_getSZ(3);
  @$pb.TagNumber(4)
  set validatorsPercentage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasValidatorsPercentage() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidatorsPercentage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Params',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'Pylonstech.pylons.pylons'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minNameFieldLength',
        $pb.PbFieldType.OU6,
        protoName: 'minNameFieldLength',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minDescriptionFieldLength',
        $pb.PbFieldType.OU6,
        protoName: 'minDescriptionFieldLength',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<CoinIssuer>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coinIssuers',
        $pb.PbFieldType.PM,
        protoName: 'coinIssuers',
        subBuilder: CoinIssuer.create)
    ..pc<PaymentProcessor>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paymentProcessors',
        $pb.PbFieldType.PM,
        protoName: 'paymentProcessors',
        subBuilder: PaymentProcessor.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recipeFeePercentage',
        protoName: 'recipeFeePercentage')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'itemTransferFeePercentage',
        protoName: 'itemTransferFeePercentage')
    ..aOM<$0.Coin>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateItemStringFee',
        protoName: 'updateItemStringFee',
        subBuilder: $0.Coin.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minTransferFee',
        protoName: 'minTransferFee')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxTransferFee',
        protoName: 'maxTransferFee')
    ..aOM<$0.Coin>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateUsernameFee',
        protoName: 'updateUsernameFee',
        subBuilder: $0.Coin.create)
    ..hasRequiredFields = false;

  Params._() : super();
  factory Params({
    $fixnum.Int64? minNameFieldLength,
    $fixnum.Int64? minDescriptionFieldLength,
    $core.Iterable<CoinIssuer>? coinIssuers,
    $core.Iterable<PaymentProcessor>? paymentProcessors,
    $core.String? recipeFeePercentage,
    $core.String? itemTransferFeePercentage,
    $0.Coin? updateItemStringFee,
    $core.String? minTransferFee,
    $core.String? maxTransferFee,
    $0.Coin? updateUsernameFee,
  }) {
    final _result = create();
    if (minNameFieldLength != null) {
      _result.minNameFieldLength = minNameFieldLength;
    }
    if (minDescriptionFieldLength != null) {
      _result.minDescriptionFieldLength = minDescriptionFieldLength;
    }
    if (coinIssuers != null) {
      _result.coinIssuers.addAll(coinIssuers);
    }
    if (paymentProcessors != null) {
      _result.paymentProcessors.addAll(paymentProcessors);
    }
    if (recipeFeePercentage != null) {
      _result.recipeFeePercentage = recipeFeePercentage;
    }
    if (itemTransferFeePercentage != null) {
      _result.itemTransferFeePercentage = itemTransferFeePercentage;
    }
    if (updateItemStringFee != null) {
      _result.updateItemStringFee = updateItemStringFee;
    }
    if (minTransferFee != null) {
      _result.minTransferFee = minTransferFee;
    }
    if (maxTransferFee != null) {
      _result.maxTransferFee = maxTransferFee;
    }
    if (updateUsernameFee != null) {
      _result.updateUsernameFee = updateUsernameFee;
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) =>
      super.copyWith((message) => updates(message as Params))
          as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get minNameFieldLength => $_getI64(0);
  @$pb.TagNumber(1)
  set minNameFieldLength($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinNameFieldLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinNameFieldLength() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get minDescriptionFieldLength => $_getI64(1);
  @$pb.TagNumber(2)
  set minDescriptionFieldLength($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinDescriptionFieldLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinDescriptionFieldLength() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<CoinIssuer> get coinIssuers => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<PaymentProcessor> get paymentProcessors => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get recipeFeePercentage => $_getSZ(4);
  @$pb.TagNumber(5)
  set recipeFeePercentage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRecipeFeePercentage() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecipeFeePercentage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get itemTransferFeePercentage => $_getSZ(5);
  @$pb.TagNumber(6)
  set itemTransferFeePercentage($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasItemTransferFeePercentage() => $_has(5);
  @$pb.TagNumber(6)
  void clearItemTransferFeePercentage() => clearField(6);

  @$pb.TagNumber(7)
  $0.Coin get updateItemStringFee => $_getN(6);
  @$pb.TagNumber(7)
  set updateItemStringFee($0.Coin v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUpdateItemStringFee() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateItemStringFee() => clearField(7);
  @$pb.TagNumber(7)
  $0.Coin ensureUpdateItemStringFee() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get minTransferFee => $_getSZ(7);
  @$pb.TagNumber(8)
  set minTransferFee($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMinTransferFee() => $_has(7);
  @$pb.TagNumber(8)
  void clearMinTransferFee() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get maxTransferFee => $_getSZ(8);
  @$pb.TagNumber(9)
  set maxTransferFee($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMaxTransferFee() => $_has(8);
  @$pb.TagNumber(9)
  void clearMaxTransferFee() => clearField(9);

  @$pb.TagNumber(10)
  $0.Coin get updateUsernameFee => $_getN(9);
  @$pb.TagNumber(10)
  set updateUsernameFee($0.Coin v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUpdateUsernameFee() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateUsernameFee() => clearField(10);
  @$pb.TagNumber(10)
  $0.Coin ensureUpdateUsernameFee() => $_ensure(9);
}
