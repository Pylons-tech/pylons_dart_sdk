///
//  Generated code. Do not modify.
//  source: pylons/params.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use googleInAppPurchasePackageDescriptor instead')
const GoogleInAppPurchasePackage$json = const {
  '1': 'GoogleInAppPurchasePackage',
  '2': const [
    const {
      '1': 'packageName',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'packageName'
    },
    const {
      '1': 'productID',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'productID'
    },
    const {
      '1': 'amount',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'amount'
    },
  ],
};

/// Descriptor for `GoogleInAppPurchasePackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List googleInAppPurchasePackageDescriptor =
    $convert.base64Decode(
        'ChpHb29nbGVJbkFwcFB1cmNoYXNlUGFja2FnZRI5CgtwYWNrYWdlTmFtZRgBIAEoCUIX8t4fE3lhbWw6InBhY2thZ2VfbmFtZSJSC3BhY2thZ2VOYW1lEjMKCXByb2R1Y3RJRBgCIAEoCUIV8t4fEXlhbWw6InByb2R1Y3RfaWQiUglwcm9kdWN0SUQSVwoGYW1vdW50GAMgASgJQj/I3h8A8t4fDXlhbWw6ImFtb3VudCLa3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5JbnRSBmFtb3VudA==');
@$core.Deprecated('Use coinIssuerDescriptor instead')
const CoinIssuer$json = const {
  '1': 'CoinIssuer',
  '2': const [
    const {
      '1': 'coinDenom',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'coinDenom'
    },
    const {
      '1': 'packages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Pylonstech.pylons.pylons.GoogleInAppPurchasePackage',
      '8': const {},
      '10': 'packages'
    },
    const {
      '1': 'googleInAppPurchasePubKey',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'googleInAppPurchasePubKey'
    },
    const {'1': 'entityName', '3': 4, '4': 1, '5': 9, '10': 'entityName'},
  ],
};

/// Descriptor for `CoinIssuer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coinIssuerDescriptor = $convert.base64Decode(
    'CgpDb2luSXNzdWVyEjMKCWNvaW5EZW5vbRgBIAEoCUIV8t4fEXlhbWw6ImNvaW5fZGVub20iUgljb2luRGVub20SdAoIcGFja2FnZXMYAiADKAsyNC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuR29vZ2xlSW5BcHBQdXJjaGFzZVBhY2thZ2VCIvLeHxp5YW1sOiJnb29nbGVfaWFwX3BhY2thZ2VzIsjeHwBSCHBhY2thZ2VzEloKGWdvb2dsZUluQXBwUHVyY2hhc2VQdWJLZXkYAyABKAlCHPLeHxh5YW1sOiJnb29nbGVfaWFwX3B1YmtleSJSGWdvb2dsZUluQXBwUHVyY2hhc2VQdWJLZXkSHgoKZW50aXR5TmFtZRgEIAEoCVIKZW50aXR5TmFtZQ==');
@$core.Deprecated('Use paymentProcessorDescriptor instead')
const PaymentProcessor$json = const {
  '1': 'PaymentProcessor',
  '2': const [
    const {
      '1': 'CoinDenom',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'CoinDenom'
    },
    const {
      '1': 'pubKey',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'pubKey'
    },
    const {
      '1': 'processorPercentage',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'processorPercentage'
    },
    const {
      '1': 'validatorsPercentage',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'validatorsPercentage'
    },
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `PaymentProcessor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentProcessorDescriptor = $convert.base64Decode(
    'ChBQYXltZW50UHJvY2Vzc29yEjMKCUNvaW5EZW5vbRgBIAEoCUIV8t4fEXlhbWw6ImNvaW5fZGVub20iUglDb2luRGVub20SKgoGcHViS2V5GAIgASgJQhLy3h8OeWFtbDoicHViX2tleSJSBnB1YktleRJ/ChNwcm9jZXNzb3JQZXJjZW50YWdlGAMgASgJQk3y3h8beWFtbDoicHJvY2Vzc29yX3BlcmNlbnRhZ2UiyN4fANreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY1ITcHJvY2Vzc29yUGVyY2VudGFnZRKBAQoUdmFsaWRhdG9yc1BlcmNlbnRhZ2UYBCABKAlCTfLeHxt5YW1sOiJ2YWxpZGF0b3JzX3BlY2VudGFnZSLI3h8A2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuRGVjUhR2YWxpZGF0b3JzUGVyY2VudGFnZRISCgRuYW1lGAUgASgJUgRuYW1l');
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {
      '1': 'minNameFieldLength',
      '3': 1,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'minNameFieldLength'
    },
    const {
      '1': 'minDescriptionFieldLength',
      '3': 2,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'minDescriptionFieldLength'
    },
    const {
      '1': 'coinIssuers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.Pylonstech.pylons.pylons.CoinIssuer',
      '8': const {},
      '10': 'coinIssuers'
    },
    const {
      '1': 'paymentProcessors',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.Pylonstech.pylons.pylons.PaymentProcessor',
      '8': const {},
      '10': 'paymentProcessors'
    },
    const {
      '1': 'recipeFeePercentage',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'recipeFeePercentage'
    },
    const {
      '1': 'itemTransferFeePercentage',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'itemTransferFeePercentage'
    },
    const {
      '1': 'updateItemStringFee',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'updateItemStringFee'
    },
    const {
      '1': 'minTransferFee',
      '3': 8,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'minTransferFee'
    },
    const {
      '1': 'maxTransferFee',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'maxTransferFee'
    },
    const {
      '1': 'updateUsernameFee',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'updateUsernameFee'
    },
  ],
  '7': const {},
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode(
    'CgZQYXJhbXMSUAoSbWluTmFtZUZpZWxkTGVuZ3RoGAEgASgEQiDy3h8ceWFtbDoibWluX25hbWVfZmllbGRfbGVuZ3RoIlISbWluTmFtZUZpZWxkTGVuZ3RoEmUKGW1pbkRlc2NyaXB0aW9uRmllbGRMZW5ndGgYAiABKARCJ/LeHyN5YW1sOiJtaW5fZGVzY3JpcHRpb25fZmllbGRfbGVuZ3RoIlIZbWluRGVzY3JpcHRpb25GaWVsZExlbmd0aBJjCgtjb2luSXNzdWVycxgDIAMoCzIkLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Db2luSXNzdWVyQhvy3h8TeWFtbDoiY29pbl9pc3N1ZXJzIsjeHwBSC2NvaW5Jc3N1ZXJzEnsKEXBheW1lbnRQcm9jZXNzb3JzGAQgAygLMiouUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlBheW1lbnRQcm9jZXNzb3JCIfLeHxl5YW1sOiJwYXltZW50X3Byb2Nlc3NvcnMiyN4fAFIRcGF5bWVudFByb2Nlc3NvcnMSgAEKE3JlY2lwZUZlZVBlcmNlbnRhZ2UYBSABKAlCTvLeHxx5YW1sOiJyZWNpcGVfZmVlX3BlcmNlbnRhZ2UiyN4fANreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY1ITcmVjaXBlRmVlUGVyY2VudGFnZRKTAQoZaXRlbVRyYW5zZmVyRmVlUGVyY2VudGFnZRgGIAEoCUJV8t4fI3lhbWw6Iml0ZW1fdHJhbnNmZXJfZmVlX3BlcmNlbnRhZ2UiyN4fANreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY1IZaXRlbVRyYW5zZmVyRmVlUGVyY2VudGFnZRJyChN1cGRhdGVJdGVtU3RyaW5nRmVlGAcgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQiXy3h8deWFtbDoidXBkYXRlX2l0ZW1fc3RyaW5nX2ZlZSLI3h8AUhN1cGRhdGVJdGVtU3RyaW5nRmVlEnEKDm1pblRyYW5zZmVyRmVlGAggASgJQkny3h8XeWFtbDoibWluX3RyYW5zZmVyX2ZlZSLI3h8A2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW50Ug5taW5UcmFuc2ZlckZlZRJxCg5tYXhUcmFuc2ZlckZlZRgJIAEoCUJJ8t4fF3lhbWw6Im1heF90cmFuc2Zlcl9mZWUiyN4fANreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludFIObWF4VHJhbnNmZXJGZWUSawoRdXBkYXRlVXNlcm5hbWVGZWUYCiABKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CIvLeHxp5YW1sOiJ1cGRhdGVfdXNlcm5hbWVfZmVlIsjeHwBSEXVwZGF0ZVVzZXJuYW1lRmVlOgSYoB8A');
