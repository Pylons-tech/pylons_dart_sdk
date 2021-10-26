///
//  Generated code. Do not modify.
//  source: pylons/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import '../cosmos/base/query/v1beta1/pagination.pbjson.dart' as $9;
import 'trade.pbjson.dart' as $4;
import 'recipe.pbjson.dart' as $2;
import '../cosmos/base/v1beta1/coin.pbjson.dart' as $0;
import 'accounts.pbjson.dart' as $8;
import 'item.pbjson.dart' as $1;
import 'google_iap_order.pbjson.dart' as $6;
import 'execution.pbjson.dart' as $5;
import 'cookbook.pbjson.dart' as $3;

@$core.Deprecated('Use queryListTradesByCreatorRequestDescriptor instead')
const QueryListTradesByCreatorRequest$json = const {
  '1': 'QueryListTradesByCreatorRequest',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListTradesByCreatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListTradesByCreatorRequestDescriptor = $convert.base64Decode('Ch9RdWVyeUxpc3RUcmFkZXNCeUNyZWF0b3JSZXF1ZXN0EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISRgoKcGFnaW5hdGlvbhgCIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryListTradesByCreatorResponseDescriptor instead')
const QueryListTradesByCreatorResponse$json = const {
  '1': 'QueryListTradesByCreatorResponse',
  '2': const [
    const {'1': 'Trades', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Trade', '8': const {}, '10': 'Trades'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryListTradesByCreatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListTradesByCreatorResponseDescriptor = $convert.base64Decode('CiBRdWVyeUxpc3RUcmFkZXNCeUNyZWF0b3JSZXNwb25zZRI9CgZUcmFkZXMYASADKAsyHy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuVHJhZGVCBMjeHwBSBlRyYWRlcxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb246COigHwCIoB8A');
@$core.Deprecated('Use queryGetUsernameByAddressRequestDescriptor instead')
const QueryGetUsernameByAddressRequest$json = const {
  '1': 'QueryGetUsernameByAddressRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryGetUsernameByAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetUsernameByAddressRequestDescriptor = $convert.base64Decode('CiBRdWVyeUdldFVzZXJuYW1lQnlBZGRyZXNzUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use queryGetAddressByUsernameRequestDescriptor instead')
const QueryGetAddressByUsernameRequest$json = const {
  '1': 'QueryGetAddressByUsernameRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `QueryGetAddressByUsernameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetAddressByUsernameRequestDescriptor = $convert.base64Decode('CiBRdWVyeUdldEFkZHJlc3NCeVVzZXJuYW1lUmVxdWVzdBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWU=');
@$core.Deprecated('Use queryGetUsernameByAddressResponseDescriptor instead')
const QueryGetUsernameByAddressResponse$json = const {
  '1': 'QueryGetUsernameByAddressResponse',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Username', '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `QueryGetUsernameByAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetUsernameByAddressResponseDescriptor = $convert.base64Decode('CiFRdWVyeUdldFVzZXJuYW1lQnlBZGRyZXNzUmVzcG9uc2USRAoIdXNlcm5hbWUYASABKAsyIi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuVXNlcm5hbWVCBMjeHwBSCHVzZXJuYW1l');
@$core.Deprecated('Use queryGetAddressByUsernameResponseDescriptor instead')
const QueryGetAddressByUsernameResponse$json = const {
  '1': 'QueryGetAddressByUsernameResponse',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.AccountAddr', '8': const {}, '10': 'address'},
  ],
};

/// Descriptor for `QueryGetAddressByUsernameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetAddressByUsernameResponseDescriptor = $convert.base64Decode('CiFRdWVyeUdldEFkZHJlc3NCeVVzZXJuYW1lUmVzcG9uc2USRQoHYWRkcmVzcxgBIAEoCzIlLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5BY2NvdW50QWRkckIEyN4fAFIHYWRkcmVzcw==');
@$core.Deprecated('Use queryGetTradeRequestDescriptor instead')
const QueryGetTradeRequest$json = const {
  '1': 'QueryGetTradeRequest',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 4, '10': 'ID'},
  ],
};

/// Descriptor for `QueryGetTradeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetTradeRequestDescriptor = $convert.base64Decode('ChRRdWVyeUdldFRyYWRlUmVxdWVzdBIOCgJJRBgBIAEoBFICSUQ=');
@$core.Deprecated('Use queryGetTradeResponseDescriptor instead')
const QueryGetTradeResponse$json = const {
  '1': 'QueryGetTradeResponse',
  '2': const [
    const {'1': 'Trade', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Trade', '8': const {}, '10': 'Trade'},
  ],
};

/// Descriptor for `QueryGetTradeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetTradeResponseDescriptor = $convert.base64Decode('ChVRdWVyeUdldFRyYWRlUmVzcG9uc2USOwoFVHJhZGUYASABKAsyHy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuVHJhZGVCBMjeHwBSBVRyYWRl');
@$core.Deprecated('Use queryListItemByOwnerRequestDescriptor instead')
const QueryListItemByOwnerRequest$json = const {
  '1': 'QueryListItemByOwnerRequest',
  '2': const [
    const {'1': 'owner', '3': 1, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListItemByOwnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListItemByOwnerRequestDescriptor = $convert.base64Decode('ChtRdWVyeUxpc3RJdGVtQnlPd25lclJlcXVlc3QSFAoFb3duZXIYASABKAlSBW93bmVyEkYKCnBhZ2luYXRpb24YAyABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryListItemByOwnerResponseDescriptor instead')
const QueryListItemByOwnerResponse$json = const {
  '1': 'QueryListItemByOwnerResponse',
  '2': const [
    const {'1': 'Items', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Item', '8': const {}, '10': 'Items'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryListItemByOwnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListItemByOwnerResponseDescriptor = $convert.base64Decode('ChxRdWVyeUxpc3RJdGVtQnlPd25lclJlc3BvbnNlEjoKBUl0ZW1zGAEgAygLMh4uUHlsb25zdGVjaC5weWxvbnMucHlsb25zLkl0ZW1CBMjeHwBSBUl0ZW1zEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbjoI6KAfAIigHwA=');
@$core.Deprecated('Use queryGetGoogleInAppPurchaseOrderRequestDescriptor instead')
const QueryGetGoogleInAppPurchaseOrderRequest$json = const {
  '1': 'QueryGetGoogleInAppPurchaseOrderRequest',
  '2': const [
    const {'1': 'PurchaseToken', '3': 1, '4': 1, '5': 9, '10': 'PurchaseToken'},
  ],
};

/// Descriptor for `QueryGetGoogleInAppPurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetGoogleInAppPurchaseOrderRequestDescriptor = $convert.base64Decode('CidRdWVyeUdldEdvb2dsZUluQXBwUHVyY2hhc2VPcmRlclJlcXVlc3QSJAoNUHVyY2hhc2VUb2tlbhgBIAEoCVINUHVyY2hhc2VUb2tlbg==');
@$core.Deprecated('Use queryGetGoogleInAppPurchaseOrderResponseDescriptor instead')
const QueryGetGoogleInAppPurchaseOrderResponse$json = const {
  '1': 'QueryGetGoogleInAppPurchaseOrderResponse',
  '2': const [
    const {'1': 'Order', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.GoogleInAppPurchaseOrder', '8': const {}, '10': 'Order'},
  ],
};

/// Descriptor for `QueryGetGoogleInAppPurchaseOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetGoogleInAppPurchaseOrderResponseDescriptor = $convert.base64Decode('CihRdWVyeUdldEdvb2dsZUluQXBwUHVyY2hhc2VPcmRlclJlc3BvbnNlEk4KBU9yZGVyGAEgASgLMjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLkdvb2dsZUluQXBwUHVyY2hhc2VPcmRlckIEyN4fAFIFT3JkZXI=');
@$core.Deprecated('Use queryListExecutionsByItemRequestDescriptor instead')
const QueryListExecutionsByItemRequest$json = const {
  '1': 'QueryListExecutionsByItemRequest',
  '2': const [
    const {'1': 'CookbookID', '3': 1, '4': 1, '5': 9, '10': 'CookbookID'},
    const {'1': 'ItemID', '3': 2, '4': 1, '5': 9, '10': 'ItemID'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryListExecutionsByItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListExecutionsByItemRequestDescriptor = $convert.base64Decode('CiBRdWVyeUxpc3RFeGVjdXRpb25zQnlJdGVtUmVxdWVzdBIeCgpDb29rYm9va0lEGAEgASgJUgpDb29rYm9va0lEEhYKBkl0ZW1JRBgCIAEoCVIGSXRlbUlEEkYKCnBhZ2luYXRpb24YAyABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9uOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryListExecutionsByItemResponseDescriptor instead')
const QueryListExecutionsByItemResponse$json = const {
  '1': 'QueryListExecutionsByItemResponse',
  '2': const [
    const {'1': 'CompletedExecutions', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Execution', '8': const {}, '10': 'CompletedExecutions'},
    const {'1': 'PendingExecutions', '3': 2, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Execution', '8': const {}, '10': 'PendingExecutions'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListExecutionsByItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListExecutionsByItemResponseDescriptor = $convert.base64Decode('CiFRdWVyeUxpc3RFeGVjdXRpb25zQnlJdGVtUmVzcG9uc2USWwoTQ29tcGxldGVkRXhlY3V0aW9ucxgBIAMoCzIjLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5FeGVjdXRpb25CBMjeHwBSE0NvbXBsZXRlZEV4ZWN1dGlvbnMSVwoRUGVuZGluZ0V4ZWN1dGlvbnMYAiADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuRXhlY3V0aW9uQgTI3h8AUhFQZW5kaW5nRXhlY3V0aW9ucxJHCgpwYWdpbmF0aW9uGAMgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryListExecutionsByRecipeRequestDescriptor instead')
const QueryListExecutionsByRecipeRequest$json = const {
  '1': 'QueryListExecutionsByRecipeRequest',
  '2': const [
    const {'1': 'CookbookID', '3': 1, '4': 1, '5': 9, '10': 'CookbookID'},
    const {'1': 'RecipeID', '3': 2, '4': 1, '5': 9, '10': 'RecipeID'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryListExecutionsByRecipeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListExecutionsByRecipeRequestDescriptor = $convert.base64Decode('CiJRdWVyeUxpc3RFeGVjdXRpb25zQnlSZWNpcGVSZXF1ZXN0Eh4KCkNvb2tib29rSUQYASABKAlSCkNvb2tib29rSUQSGgoIUmVjaXBlSUQYAiABKAlSCFJlY2lwZUlEEkYKCnBhZ2luYXRpb24YAyABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9uOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryListExecutionsByRecipeResponseDescriptor instead')
const QueryListExecutionsByRecipeResponse$json = const {
  '1': 'QueryListExecutionsByRecipeResponse',
  '2': const [
    const {'1': 'CompletedExecutions', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Execution', '8': const {}, '10': 'CompletedExecutions'},
    const {'1': 'PendingExecutions', '3': 2, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Execution', '8': const {}, '10': 'PendingExecutions'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListExecutionsByRecipeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListExecutionsByRecipeResponseDescriptor = $convert.base64Decode('CiNRdWVyeUxpc3RFeGVjdXRpb25zQnlSZWNpcGVSZXNwb25zZRJbChNDb21wbGV0ZWRFeGVjdXRpb25zGAEgAygLMiMuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLkV4ZWN1dGlvbkIEyN4fAFITQ29tcGxldGVkRXhlY3V0aW9ucxJXChFQZW5kaW5nRXhlY3V0aW9ucxgCIAMoCzIjLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5FeGVjdXRpb25CBMjeHwBSEVBlbmRpbmdFeGVjdXRpb25zEkcKCnBhZ2luYXRpb24YAyABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryGetExecutionRequestDescriptor instead')
const QueryGetExecutionRequest$json = const {
  '1': 'QueryGetExecutionRequest',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `QueryGetExecutionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetExecutionRequestDescriptor = $convert.base64Decode('ChhRdWVyeUdldEV4ZWN1dGlvblJlcXVlc3QSDgoCSUQYASABKAlSAklE');
@$core.Deprecated('Use queryGetExecutionResponseDescriptor instead')
const QueryGetExecutionResponse$json = const {
  '1': 'QueryGetExecutionResponse',
  '2': const [
    const {'1': 'Execution', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Execution', '8': const {}, '10': 'Execution'},
    const {'1': 'Completed', '3': 2, '4': 1, '5': 8, '10': 'Completed'},
  ],
};

/// Descriptor for `QueryGetExecutionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetExecutionResponseDescriptor = $convert.base64Decode('ChlRdWVyeUdldEV4ZWN1dGlvblJlc3BvbnNlEkcKCUV4ZWN1dGlvbhgBIAEoCzIjLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5FeGVjdXRpb25CBMjeHwBSCUV4ZWN1dGlvbhIcCglDb21wbGV0ZWQYAiABKAhSCUNvbXBsZXRlZA==');
@$core.Deprecated('Use queryListRecipesByCookbookRequestDescriptor instead')
const QueryListRecipesByCookbookRequest$json = const {
  '1': 'QueryListRecipesByCookbookRequest',
  '2': const [
    const {'1': 'CookbookID', '3': 1, '4': 1, '5': 9, '10': 'CookbookID'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListRecipesByCookbookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListRecipesByCookbookRequestDescriptor = $convert.base64Decode('CiFRdWVyeUxpc3RSZWNpcGVzQnlDb29rYm9va1JlcXVlc3QSHgoKQ29va2Jvb2tJRBgBIAEoCVIKQ29va2Jvb2tJRBJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryListRecipesByCookbookResponseDescriptor instead')
const QueryListRecipesByCookbookResponse$json = const {
  '1': 'QueryListRecipesByCookbookResponse',
  '2': const [
    const {'1': 'Recipes', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Recipe', '8': const {}, '10': 'Recipes'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListRecipesByCookbookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListRecipesByCookbookResponseDescriptor = $convert.base64Decode('CiJRdWVyeUxpc3RSZWNpcGVzQnlDb29rYm9va1Jlc3BvbnNlEkAKB1JlY2lwZXMYASADKAsyIC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUmVjaXBlQgTI3h8AUgdSZWNpcGVzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryGetItemRequestDescriptor instead')
const QueryGetItemRequest$json = const {
  '1': 'QueryGetItemRequest',
  '2': const [
    const {'1': 'CookbookID', '3': 1, '4': 1, '5': 9, '10': 'CookbookID'},
    const {'1': 'ID', '3': 3, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `QueryGetItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetItemRequestDescriptor = $convert.base64Decode('ChNRdWVyeUdldEl0ZW1SZXF1ZXN0Eh4KCkNvb2tib29rSUQYASABKAlSCkNvb2tib29rSUQSDgoCSUQYAyABKAlSAklE');
@$core.Deprecated('Use queryGetItemResponseDescriptor instead')
const QueryGetItemResponse$json = const {
  '1': 'QueryGetItemResponse',
  '2': const [
    const {'1': 'Item', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Item', '8': const {}, '10': 'Item'},
  ],
};

/// Descriptor for `QueryGetItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetItemResponseDescriptor = $convert.base64Decode('ChRRdWVyeUdldEl0ZW1SZXNwb25zZRI4CgRJdGVtGAEgASgLMh4uUHlsb25zdGVjaC5weWxvbnMucHlsb25zLkl0ZW1CBMjeHwBSBEl0ZW0=');
@$core.Deprecated('Use queryGetRecipeRequestDescriptor instead')
const QueryGetRecipeRequest$json = const {
  '1': 'QueryGetRecipeRequest',
  '2': const [
    const {'1': 'CookbookID', '3': 1, '4': 1, '5': 9, '10': 'CookbookID'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `QueryGetRecipeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetRecipeRequestDescriptor = $convert.base64Decode('ChVRdWVyeUdldFJlY2lwZVJlcXVlc3QSHgoKQ29va2Jvb2tJRBgBIAEoCVIKQ29va2Jvb2tJRBIOCgJJRBgCIAEoCVICSUQ=');
@$core.Deprecated('Use queryGetRecipeResponseDescriptor instead')
const QueryGetRecipeResponse$json = const {
  '1': 'QueryGetRecipeResponse',
  '2': const [
    const {'1': 'Recipe', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Recipe', '8': const {}, '10': 'Recipe'},
  ],
};

/// Descriptor for `QueryGetRecipeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetRecipeResponseDescriptor = $convert.base64Decode('ChZRdWVyeUdldFJlY2lwZVJlc3BvbnNlEj4KBlJlY2lwZRgBIAEoCzIgLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5SZWNpcGVCBMjeHwBSBlJlY2lwZQ==');
@$core.Deprecated('Use queryListCookbooksByCreatorRequestDescriptor instead')
const QueryListCookbooksByCreatorRequest$json = const {
  '1': 'QueryListCookbooksByCreatorRequest',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListCookbooksByCreatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListCookbooksByCreatorRequestDescriptor = $convert.base64Decode('CiJRdWVyeUxpc3RDb29rYm9va3NCeUNyZWF0b3JSZXF1ZXN0EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISRgoKcGFnaW5hdGlvbhgDIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryListCookbooksByCreatorResponseDescriptor instead')
const QueryListCookbooksByCreatorResponse$json = const {
  '1': 'QueryListCookbooksByCreatorResponse',
  '2': const [
    const {'1': 'Cookbooks', '3': 1, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.Cookbook', '8': const {}, '10': 'Cookbooks'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryListCookbooksByCreatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryListCookbooksByCreatorResponseDescriptor = $convert.base64Decode('CiNRdWVyeUxpc3RDb29rYm9va3NCeUNyZWF0b3JSZXNwb25zZRJGCglDb29rYm9va3MYASADKAsyIi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuQ29va2Jvb2tCBMjeHwBSCUNvb2tib29rcxJHCgpwYWdpbmF0aW9uGAMgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryGetCookbookRequestDescriptor instead')
const QueryGetCookbookRequest$json = const {
  '1': 'QueryGetCookbookRequest',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `QueryGetCookbookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetCookbookRequestDescriptor = $convert.base64Decode('ChdRdWVyeUdldENvb2tib29rUmVxdWVzdBIOCgJJRBgBIAEoCVICSUQ=');
@$core.Deprecated('Use queryGetCookbookResponseDescriptor instead')
const QueryGetCookbookResponse$json = const {
  '1': 'QueryGetCookbookResponse',
  '2': const [
    const {'1': 'Cookbook', '3': 1, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.Cookbook', '8': const {}, '10': 'Cookbook'},
  ],
};

/// Descriptor for `QueryGetCookbookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetCookbookResponseDescriptor = $convert.base64Decode('ChhRdWVyeUdldENvb2tib29rUmVzcG9uc2USRAoIQ29va2Jvb2sYASABKAsyIi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuQ29va2Jvb2tCBMjeHwBSCENvb2tib29r');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {'1': 'ListTradesByCreator', '2': '.Pylonstech.pylons.pylons.QueryListTradesByCreatorRequest', '3': '.Pylonstech.pylons.pylons.QueryListTradesByCreatorResponse', '4': const {}},
    const {'1': 'UsernameByAddress', '2': '.Pylonstech.pylons.pylons.QueryGetUsernameByAddressRequest', '3': '.Pylonstech.pylons.pylons.QueryGetUsernameByAddressResponse', '4': const {}},
    const {'1': 'AddressByUsername', '2': '.Pylonstech.pylons.pylons.QueryGetAddressByUsernameRequest', '3': '.Pylonstech.pylons.pylons.QueryGetAddressByUsernameResponse', '4': const {}},
    const {'1': 'Trade', '2': '.Pylonstech.pylons.pylons.QueryGetTradeRequest', '3': '.Pylonstech.pylons.pylons.QueryGetTradeResponse', '4': const {}},
    const {'1': 'ListItemByOwner', '2': '.Pylonstech.pylons.pylons.QueryListItemByOwnerRequest', '3': '.Pylonstech.pylons.pylons.QueryListItemByOwnerResponse', '4': const {}},
    const {'1': 'GoogleInAppPurchaseOrder', '2': '.Pylonstech.pylons.pylons.QueryGetGoogleInAppPurchaseOrderRequest', '3': '.Pylonstech.pylons.pylons.QueryGetGoogleInAppPurchaseOrderResponse', '4': const {}},
    const {'1': 'ListExecutionsByItem', '2': '.Pylonstech.pylons.pylons.QueryListExecutionsByItemRequest', '3': '.Pylonstech.pylons.pylons.QueryListExecutionsByItemResponse', '4': const {}},
    const {'1': 'ListExecutionsByRecipe', '2': '.Pylonstech.pylons.pylons.QueryListExecutionsByRecipeRequest', '3': '.Pylonstech.pylons.pylons.QueryListExecutionsByRecipeResponse', '4': const {}},
    const {'1': 'Execution', '2': '.Pylonstech.pylons.pylons.QueryGetExecutionRequest', '3': '.Pylonstech.pylons.pylons.QueryGetExecutionResponse', '4': const {}},
    const {'1': 'ListRecipesByCookbook', '2': '.Pylonstech.pylons.pylons.QueryListRecipesByCookbookRequest', '3': '.Pylonstech.pylons.pylons.QueryListRecipesByCookbookResponse', '4': const {}},
    const {'1': 'Item', '2': '.Pylonstech.pylons.pylons.QueryGetItemRequest', '3': '.Pylonstech.pylons.pylons.QueryGetItemResponse', '4': const {}},
    const {'1': 'Recipe', '2': '.Pylonstech.pylons.pylons.QueryGetRecipeRequest', '3': '.Pylonstech.pylons.pylons.QueryGetRecipeResponse', '4': const {}},
    const {'1': 'ListCookbooksByCreator', '2': '.Pylonstech.pylons.pylons.QueryListCookbooksByCreatorRequest', '3': '.Pylonstech.pylons.pylons.QueryListCookbooksByCreatorResponse', '4': const {}},
    const {'1': 'Cookbook', '2': '.Pylonstech.pylons.pylons.QueryGetCookbookRequest', '3': '.Pylonstech.pylons.pylons.QueryGetCookbookResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> QueryServiceBase$messageJson = const {
  '.Pylonstech.pylons.pylons.QueryListTradesByCreatorRequest': QueryListTradesByCreatorRequest$json,
  '.cosmos.base.query.v1beta1.PageRequest': $9.PageRequest$json,
  '.Pylonstech.pylons.pylons.QueryListTradesByCreatorResponse': QueryListTradesByCreatorResponse$json,
  '.Pylonstech.pylons.pylons.Trade': $4.Trade$json,
  '.Pylonstech.pylons.pylons.CoinInput': $2.CoinInput$json,
  '.cosmos.base.v1beta1.Coin': $0.Coin$json,
  '.Pylonstech.pylons.pylons.ItemInput': $2.ItemInput$json,
  '.Pylonstech.pylons.pylons.DoubleInputParam': $2.DoubleInputParam$json,
  '.Pylonstech.pylons.pylons.LongInputParam': $2.LongInputParam$json,
  '.Pylonstech.pylons.pylons.StringInputParam': $2.StringInputParam$json,
  '.Pylonstech.pylons.pylons.ConditionList': $2.ConditionList$json,
  '.Pylonstech.pylons.pylons.ItemRef': $4.ItemRef$json,
  '.cosmos.base.query.v1beta1.PageResponse': $9.PageResponse$json,
  '.Pylonstech.pylons.pylons.QueryGetUsernameByAddressRequest': QueryGetUsernameByAddressRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetUsernameByAddressResponse': QueryGetUsernameByAddressResponse$json,
  '.Pylonstech.pylons.pylons.Username': $8.Username$json,
  '.Pylonstech.pylons.pylons.QueryGetAddressByUsernameRequest': QueryGetAddressByUsernameRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetAddressByUsernameResponse': QueryGetAddressByUsernameResponse$json,
  '.Pylonstech.pylons.pylons.AccountAddr': $8.AccountAddr$json,
  '.Pylonstech.pylons.pylons.QueryGetTradeRequest': QueryGetTradeRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetTradeResponse': QueryGetTradeResponse$json,
  '.Pylonstech.pylons.pylons.QueryListItemByOwnerRequest': QueryListItemByOwnerRequest$json,
  '.Pylonstech.pylons.pylons.QueryListItemByOwnerResponse': QueryListItemByOwnerResponse$json,
  '.Pylonstech.pylons.pylons.Item': $1.Item$json,
  '.Pylonstech.pylons.pylons.DoubleKeyValue': $1.DoubleKeyValue$json,
  '.Pylonstech.pylons.pylons.LongKeyValue': $1.LongKeyValue$json,
  '.Pylonstech.pylons.pylons.StringKeyValue': $1.StringKeyValue$json,
  '.Pylonstech.pylons.pylons.QueryGetGoogleInAppPurchaseOrderRequest': QueryGetGoogleInAppPurchaseOrderRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetGoogleInAppPurchaseOrderResponse': QueryGetGoogleInAppPurchaseOrderResponse$json,
  '.Pylonstech.pylons.pylons.GoogleInAppPurchaseOrder': $6.GoogleInAppPurchaseOrder$json,
  '.Pylonstech.pylons.pylons.QueryListExecutionsByItemRequest': QueryListExecutionsByItemRequest$json,
  '.Pylonstech.pylons.pylons.QueryListExecutionsByItemResponse': QueryListExecutionsByItemResponse$json,
  '.Pylonstech.pylons.pylons.Execution': $5.Execution$json,
  '.Pylonstech.pylons.pylons.ItemRecord': $5.ItemRecord$json,
  '.Pylonstech.pylons.pylons.QueryListExecutionsByRecipeRequest': QueryListExecutionsByRecipeRequest$json,
  '.Pylonstech.pylons.pylons.QueryListExecutionsByRecipeResponse': QueryListExecutionsByRecipeResponse$json,
  '.Pylonstech.pylons.pylons.QueryGetExecutionRequest': QueryGetExecutionRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetExecutionResponse': QueryGetExecutionResponse$json,
  '.Pylonstech.pylons.pylons.QueryListRecipesByCookbookRequest': QueryListRecipesByCookbookRequest$json,
  '.Pylonstech.pylons.pylons.QueryListRecipesByCookbookResponse': QueryListRecipesByCookbookResponse$json,
  '.Pylonstech.pylons.pylons.Recipe': $2.Recipe$json,
  '.Pylonstech.pylons.pylons.EntriesList': $2.EntriesList$json,
  '.Pylonstech.pylons.pylons.CoinOutput': $2.CoinOutput$json,
  '.Pylonstech.pylons.pylons.ItemOutput': $2.ItemOutput$json,
  '.Pylonstech.pylons.pylons.DoubleParam': $2.DoubleParam$json,
  '.Pylonstech.pylons.pylons.DoubleWeightRange': $2.DoubleWeightRange$json,
  '.Pylonstech.pylons.pylons.LongParam': $2.LongParam$json,
  '.Pylonstech.pylons.pylons.IntWeightRange': $2.IntWeightRange$json,
  '.Pylonstech.pylons.pylons.StringParam': $2.StringParam$json,
  '.Pylonstech.pylons.pylons.ItemModifyOutput': $2.ItemModifyOutput$json,
  '.Pylonstech.pylons.pylons.WeightedOutputs': $2.WeightedOutputs$json,
  '.Pylonstech.pylons.pylons.QueryGetItemRequest': QueryGetItemRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetItemResponse': QueryGetItemResponse$json,
  '.Pylonstech.pylons.pylons.QueryGetRecipeRequest': QueryGetRecipeRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetRecipeResponse': QueryGetRecipeResponse$json,
  '.Pylonstech.pylons.pylons.QueryListCookbooksByCreatorRequest': QueryListCookbooksByCreatorRequest$json,
  '.Pylonstech.pylons.pylons.QueryListCookbooksByCreatorResponse': QueryListCookbooksByCreatorResponse$json,
  '.Pylonstech.pylons.pylons.Cookbook': $3.Cookbook$json,
  '.Pylonstech.pylons.pylons.QueryGetCookbookRequest': QueryGetCookbookRequest$json,
  '.Pylonstech.pylons.pylons.QueryGetCookbookResponse': QueryGetCookbookResponse$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode('CgVRdWVyeRKuAQoTTGlzdFRyYWRlc0J5Q3JlYXRvchI5LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUxpc3RUcmFkZXNCeUNyZWF0b3JSZXF1ZXN0GjouUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5TGlzdFRyYWRlc0J5Q3JlYXRvclJlc3BvbnNlIiCC0+STAhoSGC9weWxvbnMvdHJhZGVzL3tjcmVhdG9yfRK3AQoRVXNlcm5hbWVCeUFkZHJlc3MSOi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRVc2VybmFtZUJ5QWRkcmVzc1JlcXVlc3QaOy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRVc2VybmFtZUJ5QWRkcmVzc1Jlc3BvbnNlIimC0+STAiMSIS9weWxvbnMvYWNjb3VudC9hZGRyZXNzL3thZGRyZXNzfRK5AQoRQWRkcmVzc0J5VXNlcm5hbWUSOi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRBZGRyZXNzQnlVc2VybmFtZVJlcXVlc3QaOy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRBZGRyZXNzQnlVc2VybmFtZVJlc3BvbnNlIiuC0+STAiUSIy9weWxvbnMvYWNjb3VudC91c2VybmFtZS97dXNlcm5hbWV9EoQBCgVUcmFkZRIuLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUdldFRyYWRlUmVxdWVzdBovLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUdldFRyYWRlUmVzcG9uc2UiGoLT5JMCFBISL3B5bG9ucy90cmFkZS97SUR9Ep8BCg9MaXN0SXRlbUJ5T3duZXISNS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlMaXN0SXRlbUJ5T3duZXJSZXF1ZXN0GjYuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5TGlzdEl0ZW1CeU93bmVyUmVzcG9uc2UiHYLT5JMCFxIVL3B5bG9ucy9pdGVtcy97b3duZXJ9EsYBChhHb29nbGVJbkFwcFB1cmNoYXNlT3JkZXISQS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRHb29nbGVJbkFwcFB1cmNoYXNlT3JkZXJSZXF1ZXN0GkIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0R29vZ2xlSW5BcHBQdXJjaGFzZU9yZGVyUmVzcG9uc2UiI4LT5JMCHRIbL3B5bG9ucy9pYXAve1B1cmNoYXNlVG9rZW59EsYBChRMaXN0RXhlY3V0aW9uc0J5SXRlbRI6LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUxpc3RFeGVjdXRpb25zQnlJdGVtUmVxdWVzdBo7LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUxpc3RFeGVjdXRpb25zQnlJdGVtUmVzcG9uc2UiNYLT5JMCLxItL3B5bG9ucy9leGVjdXRpb25zL2l0ZW0ve0Nvb2tib29rSUR9L3tJdGVtSUR9EtABChZMaXN0RXhlY3V0aW9uc0J5UmVjaXBlEjwuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5TGlzdEV4ZWN1dGlvbnNCeVJlY2lwZVJlcXVlc3QaPS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlMaXN0RXhlY3V0aW9uc0J5UmVjaXBlUmVzcG9uc2UiOYLT5JMCMxIxL3B5bG9ucy9leGVjdXRpb25zL3JlY2lwZS97Q29va2Jvb2tJRH0ve1JlY2lwZUlEfRKUAQoJRXhlY3V0aW9uEjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0RXhlY3V0aW9uUmVxdWVzdBozLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUdldEV4ZWN1dGlvblJlc3BvbnNlIh6C0+STAhgSFi9weWxvbnMvZXhlY3V0aW9uL3tJRH0SuAEKFUxpc3RSZWNpcGVzQnlDb29rYm9vaxI7LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUxpc3RSZWNpcGVzQnlDb29rYm9va1JlcXVlc3QaPC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlMaXN0UmVjaXBlc0J5Q29va2Jvb2tSZXNwb25zZSIkgtPkkwIeEhwvcHlsb25zL3JlY2lwZXMve0Nvb2tib29rSUR9Eo0BCgRJdGVtEi0uUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0SXRlbVJlcXVlc3QaLi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRJdGVtUmVzcG9uc2UiJoLT5JMCIBIeL3B5bG9ucy9pdGVtL3tDb29rYm9va0lEfS97SUR9EpUBCgZSZWNpcGUSLy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlHZXRSZWNpcGVSZXF1ZXN0GjAuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0UmVjaXBlUmVzcG9uc2UiKILT5JMCIhIgL3B5bG9ucy9yZWNpcGUve0Nvb2tib29rSUR9L3tJRH0SugEKFkxpc3RDb29rYm9va3NCeUNyZWF0b3ISPC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUXVlcnlMaXN0Q29va2Jvb2tzQnlDcmVhdG9yUmVxdWVzdBo9LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5RdWVyeUxpc3RDb29rYm9va3NCeUNyZWF0b3JSZXNwb25zZSIjgtPkkwIdEhsvcHlsb25zL2Nvb2tib29rcy97Y3JlYXRvcn0SkAEKCENvb2tib29rEjEuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0Q29va2Jvb2tSZXF1ZXN0GjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlF1ZXJ5R2V0Q29va2Jvb2tSZXNwb25zZSIdgtPkkwIXEhUvcHlsb25zL2Nvb2tib29rL3tJRH0=');
