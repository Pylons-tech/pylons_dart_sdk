///
//  Generated code. Do not modify.
//  source: pylons/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'redeem_info.pbjson.dart' as $3;
import 'trade.pbjson.dart' as $6;
import 'payment_info.pbjson.dart' as $5;
import 'recipe.pbjson.dart' as $2;
import '../cosmos/base/v1beta1/coin.pbjson.dart' as $0;
import 'item.pbjson.dart' as $1;

@$core.Deprecated('Use msgBurnDebtTokenDescriptor instead')
const MsgBurnDebtToken$json = const {
  '1': 'MsgBurnDebtToken',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'redeemInfo', '3': 2, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.RedeemInfo', '8': const {}, '10': 'redeemInfo'},
  ],
};

/// Descriptor for `MsgBurnDebtToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnDebtTokenDescriptor = $convert.base64Decode('ChBNc2dCdXJuRGVidFRva2VuEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISSgoKcmVkZWVtSW5mbxgCIAEoCzIkLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5SZWRlZW1JbmZvQgTI3h8AUgpyZWRlZW1JbmZv');
@$core.Deprecated('Use msgBurnDebtTokenResponseDescriptor instead')
const MsgBurnDebtTokenResponse$json = const {
  '1': 'MsgBurnDebtTokenResponse',
};

/// Descriptor for `MsgBurnDebtTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnDebtTokenResponseDescriptor = $convert.base64Decode('ChhNc2dCdXJuRGVidFRva2VuUmVzcG9uc2U=');
@$core.Deprecated('Use msgUpdateAccountDescriptor instead')
const MsgUpdateAccount$json = const {
  '1': 'MsgUpdateAccount',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `MsgUpdateAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateAccountDescriptor = $convert.base64Decode('ChBNc2dVcGRhdGVBY2NvdW50EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1l');
@$core.Deprecated('Use msgUpdateAccountResponseDescriptor instead')
const MsgUpdateAccountResponse$json = const {
  '1': 'MsgUpdateAccountResponse',
};

/// Descriptor for `MsgUpdateAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateAccountResponseDescriptor = $convert.base64Decode('ChhNc2dVcGRhdGVBY2NvdW50UmVzcG9uc2U=');
@$core.Deprecated('Use msgCreateAccountDescriptor instead')
const MsgCreateAccount$json = const {
  '1': 'MsgCreateAccount',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `MsgCreateAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateAccountDescriptor = $convert.base64Decode('ChBNc2dDcmVhdGVBY2NvdW50EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1l');
@$core.Deprecated('Use msgCreateAccountResponseDescriptor instead')
const MsgCreateAccountResponse$json = const {
  '1': 'MsgCreateAccountResponse',
};

/// Descriptor for `MsgCreateAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateAccountResponseDescriptor = $convert.base64Decode('ChhNc2dDcmVhdGVBY2NvdW50UmVzcG9uc2U=');
@$core.Deprecated('Use msgFulfillTradeDescriptor instead')
const MsgFulfillTrade$json = const {
  '1': 'MsgFulfillTrade',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 4, '10': 'ID'},
    const {'1': 'coinInputsIndex', '3': 3, '4': 1, '5': 4, '10': 'coinInputsIndex'},
    const {'1': 'items', '3': 4, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemRef', '8': const {}, '10': 'items'},
    const {'1': 'paymentInfos', '3': 5, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.PaymentInfo', '8': const {}, '10': 'paymentInfos'},
  ],
};

/// Descriptor for `MsgFulfillTrade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgFulfillTradeDescriptor = $convert.base64Decode('Cg9Nc2dGdWxmaWxsVHJhZGUSGAoHY3JlYXRvchgBIAEoCVIHY3JlYXRvchIOCgJJRBgCIAEoBFICSUQSKAoPY29pbklucHV0c0luZGV4GAMgASgEUg9jb2luSW5wdXRzSW5kZXgSPQoFaXRlbXMYBCADKAsyIS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuSXRlbVJlZkIEyN4fAFIFaXRlbXMSTwoMcGF5bWVudEluZm9zGAUgAygLMiUuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLlBheW1lbnRJbmZvQgTI3h8AUgxwYXltZW50SW5mb3M=');
@$core.Deprecated('Use msgFulfillTradeResponseDescriptor instead')
const MsgFulfillTradeResponse$json = const {
  '1': 'MsgFulfillTradeResponse',
};

/// Descriptor for `MsgFulfillTradeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgFulfillTradeResponseDescriptor = $convert.base64Decode('ChdNc2dGdWxmaWxsVHJhZGVSZXNwb25zZQ==');
@$core.Deprecated('Use msgCreateTradeDescriptor instead')
const MsgCreateTrade$json = const {
  '1': 'MsgCreateTrade',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'coinInputs', '3': 2, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.CoinInput', '8': const {}, '10': 'coinInputs'},
    const {'1': 'itemInputs', '3': 3, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemInput', '8': const {}, '10': 'itemInputs'},
    const {'1': 'coinOutputs', '3': 4, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'coinOutputs'},
    const {'1': 'itemOutputs', '3': 5, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemRef', '8': const {}, '10': 'itemOutputs'},
    const {'1': 'extraInfo', '3': 6, '4': 1, '5': 9, '10': 'extraInfo'},
  ],
};

/// Descriptor for `MsgCreateTrade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateTradeDescriptor = $convert.base64Decode('Cg5Nc2dDcmVhdGVUcmFkZRIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEkkKCmNvaW5JbnB1dHMYAiADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuQ29pbklucHV0QgTI3h8AUgpjb2luSW5wdXRzEkkKCml0ZW1JbnB1dHMYAyADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuSXRlbUlucHV0QgTI3h8AUgppdGVtSW5wdXRzEm0KC2NvaW5PdXRwdXRzGAQgAygLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQjDI3h8Aqt8fKGdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuQ29pbnNSC2NvaW5PdXRwdXRzEkkKC2l0ZW1PdXRwdXRzGAUgAygLMiEuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLkl0ZW1SZWZCBMjeHwBSC2l0ZW1PdXRwdXRzEhwKCWV4dHJhSW5mbxgGIAEoCVIJZXh0cmFJbmZv');
@$core.Deprecated('Use msgCreateTradeResponseDescriptor instead')
const MsgCreateTradeResponse$json = const {
  '1': 'MsgCreateTradeResponse',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 4, '10': 'ID'},
  ],
};

/// Descriptor for `MsgCreateTradeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateTradeResponseDescriptor = $convert.base64Decode('ChZNc2dDcmVhdGVUcmFkZVJlc3BvbnNlEg4KAklEGAEgASgEUgJJRA==');
@$core.Deprecated('Use msgCancelTradeDescriptor instead')
const MsgCancelTrade$json = const {
  '1': 'MsgCancelTrade',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 4, '10': 'ID'},
  ],
};

/// Descriptor for `MsgCancelTrade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCancelTradeDescriptor = $convert.base64Decode('Cg5Nc2dDYW5jZWxUcmFkZRIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEg4KAklEGAIgASgEUgJJRA==');
@$core.Deprecated('Use msgCancelTradeResponseDescriptor instead')
const MsgCancelTradeResponse$json = const {
  '1': 'MsgCancelTradeResponse',
};

/// Descriptor for `MsgCancelTradeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCancelTradeResponseDescriptor = $convert.base64Decode('ChZNc2dDYW5jZWxUcmFkZVJlc3BvbnNl');
@$core.Deprecated('Use msgCompleteExecutionEarlyDescriptor instead')
const MsgCompleteExecutionEarly$json = const {
  '1': 'MsgCompleteExecutionEarly',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `MsgCompleteExecutionEarly`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCompleteExecutionEarlyDescriptor = $convert.base64Decode('ChlNc2dDb21wbGV0ZUV4ZWN1dGlvbkVhcmx5EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISDgoCSUQYAiABKAlSAklE');
@$core.Deprecated('Use msgCompleteExecutionEarlyResponseDescriptor instead')
const MsgCompleteExecutionEarlyResponse$json = const {
  '1': 'MsgCompleteExecutionEarlyResponse',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `MsgCompleteExecutionEarlyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCompleteExecutionEarlyResponseDescriptor = $convert.base64Decode('CiFNc2dDb21wbGV0ZUV4ZWN1dGlvbkVhcmx5UmVzcG9uc2USDgoCSUQYASABKAlSAklE');
@$core.Deprecated('Use msgTransferCookbookDescriptor instead')
const MsgTransferCookbook$json = const {
  '1': 'MsgTransferCookbook',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'recipient', '3': 3, '4': 1, '5': 9, '10': 'recipient'},
  ],
};

/// Descriptor for `MsgTransferCookbook`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferCookbookDescriptor = $convert.base64Decode('ChNNc2dUcmFuc2ZlckNvb2tib29rEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISDgoCSUQYAiABKAlSAklEEhwKCXJlY2lwaWVudBgDIAEoCVIJcmVjaXBpZW50');
@$core.Deprecated('Use msgTransferCookbookResponseDescriptor instead')
const MsgTransferCookbookResponse$json = const {
  '1': 'MsgTransferCookbookResponse',
};

/// Descriptor for `MsgTransferCookbookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferCookbookResponseDescriptor = $convert.base64Decode('ChtNc2dUcmFuc2ZlckNvb2tib29rUmVzcG9uc2U=');
@$core.Deprecated('Use msgGoogleInAppPurchaseGetCoinsDescriptor instead')
const MsgGoogleInAppPurchaseGetCoins$json = const {
  '1': 'MsgGoogleInAppPurchaseGetCoins',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'productID', '3': 2, '4': 1, '5': 9, '10': 'productID'},
    const {'1': 'purchaseToken', '3': 3, '4': 1, '5': 9, '10': 'purchaseToken'},
    const {'1': 'receiptDataBase64', '3': 4, '4': 1, '5': 9, '10': 'receiptDataBase64'},
    const {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `MsgGoogleInAppPurchaseGetCoins`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGoogleInAppPurchaseGetCoinsDescriptor = $convert.base64Decode('Ch5Nc2dHb29nbGVJbkFwcFB1cmNoYXNlR2V0Q29pbnMSGAoHY3JlYXRvchgBIAEoCVIHY3JlYXRvchIcCglwcm9kdWN0SUQYAiABKAlSCXByb2R1Y3RJRBIkCg1wdXJjaGFzZVRva2VuGAMgASgJUg1wdXJjaGFzZVRva2VuEiwKEXJlY2VpcHREYXRhQmFzZTY0GAQgASgJUhFyZWNlaXB0RGF0YUJhc2U2NBIcCglzaWduYXR1cmUYBSABKAlSCXNpZ25hdHVyZQ==');
@$core.Deprecated('Use msgGoogleInAppPurchaseGetCoinsResponseDescriptor instead')
const MsgGoogleInAppPurchaseGetCoinsResponse$json = const {
  '1': 'MsgGoogleInAppPurchaseGetCoinsResponse',
};

/// Descriptor for `MsgGoogleInAppPurchaseGetCoinsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGoogleInAppPurchaseGetCoinsResponseDescriptor = $convert.base64Decode('CiZNc2dHb29nbGVJbkFwcFB1cmNoYXNlR2V0Q29pbnNSZXNwb25zZQ==');
@$core.Deprecated('Use msgSendItemsDescriptor instead')
const MsgSendItems$json = const {
  '1': 'MsgSendItems',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'items', '3': 3, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemRef', '8': const {}, '10': 'items'},
  ],
};

/// Descriptor for `MsgSendItems`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendItemsDescriptor = $convert.base64Decode('CgxNc2dTZW5kSXRlbXMSGAoHY3JlYXRvchgBIAEoCVIHY3JlYXRvchIaCghyZWNlaXZlchgCIAEoCVIIcmVjZWl2ZXISPQoFaXRlbXMYAyADKAsyIS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuSXRlbVJlZkIEyN4fAFIFaXRlbXM=');
@$core.Deprecated('Use msgSendItemsResponseDescriptor instead')
const MsgSendItemsResponse$json = const {
  '1': 'MsgSendItemsResponse',
};

/// Descriptor for `MsgSendItemsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendItemsResponseDescriptor = $convert.base64Decode('ChRNc2dTZW5kSXRlbXNSZXNwb25zZQ==');
@$core.Deprecated('Use msgExecuteRecipeDescriptor instead')
const MsgExecuteRecipe$json = const {
  '1': 'MsgExecuteRecipe',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'cookbookID', '3': 2, '4': 1, '5': 9, '10': 'cookbookID'},
    const {'1': 'recipeID', '3': 3, '4': 1, '5': 9, '10': 'recipeID'},
    const {'1': 'coinInputsIndex', '3': 4, '4': 1, '5': 4, '10': 'coinInputsIndex'},
    const {'1': 'itemIDs', '3': 5, '4': 3, '5': 9, '8': const {}, '10': 'itemIDs'},
    const {'1': 'paymentInfos', '3': 6, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.PaymentInfo', '8': const {}, '10': 'paymentInfos'},
  ],
};

/// Descriptor for `MsgExecuteRecipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecuteRecipeDescriptor = $convert.base64Decode('ChBNc2dFeGVjdXRlUmVjaXBlEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISHgoKY29va2Jvb2tJRBgCIAEoCVIKY29va2Jvb2tJRBIaCghyZWNpcGVJRBgDIAEoCVIIcmVjaXBlSUQSKAoPY29pbklucHV0c0luZGV4GAQgASgEUg9jb2luSW5wdXRzSW5kZXgSHgoHaXRlbUlEcxgFIAMoCUIEyN4fAFIHaXRlbUlEcxJPCgxwYXltZW50SW5mb3MYBiADKAsyJS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuUGF5bWVudEluZm9CBMjeHwBSDHBheW1lbnRJbmZvcw==');
@$core.Deprecated('Use msgExecuteRecipeResponseDescriptor instead')
const MsgExecuteRecipeResponse$json = const {
  '1': 'MsgExecuteRecipeResponse',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `MsgExecuteRecipeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecuteRecipeResponseDescriptor = $convert.base64Decode('ChhNc2dFeGVjdXRlUmVjaXBlUmVzcG9uc2USDgoCSUQYASABKAlSAklE');
@$core.Deprecated('Use msgSetItemStringDescriptor instead')
const MsgSetItemString$json = const {
  '1': 'MsgSetItemString',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'cookbookID', '3': 2, '4': 1, '5': 9, '10': 'cookbookID'},
    const {'1': 'ID', '3': 4, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'field', '3': 5, '4': 1, '5': 9, '10': 'field'},
    const {'1': 'value', '3': 6, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `MsgSetItemString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetItemStringDescriptor = $convert.base64Decode('ChBNc2dTZXRJdGVtU3RyaW5nEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISHgoKY29va2Jvb2tJRBgCIAEoCVIKY29va2Jvb2tJRBIOCgJJRBgEIAEoCVICSUQSFAoFZmllbGQYBSABKAlSBWZpZWxkEhQKBXZhbHVlGAYgASgJUgV2YWx1ZQ==');
@$core.Deprecated('Use msgSetItemStringResponseDescriptor instead')
const MsgSetItemStringResponse$json = const {
  '1': 'MsgSetItemStringResponse',
};

/// Descriptor for `MsgSetItemStringResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetItemStringResponseDescriptor = $convert.base64Decode('ChhNc2dTZXRJdGVtU3RyaW5nUmVzcG9uc2U=');
@$core.Deprecated('Use msgCreateRecipeDescriptor instead')
const MsgCreateRecipe$json = const {
  '1': 'MsgCreateRecipe',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'cookbookID', '3': 2, '4': 1, '5': 9, '10': 'cookbookID'},
    const {'1': 'ID', '3': 3, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'coinInputs', '3': 7, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.CoinInput', '8': const {}, '10': 'coinInputs'},
    const {'1': 'itemInputs', '3': 8, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemInput', '8': const {}, '10': 'itemInputs'},
    const {'1': 'entries', '3': 9, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.EntriesList', '8': const {}, '10': 'entries'},
    const {'1': 'outputs', '3': 10, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.WeightedOutputs', '8': const {}, '10': 'outputs'},
    const {'1': 'blockInterval', '3': 11, '4': 1, '5': 3, '10': 'blockInterval'},
    const {'1': 'enabled', '3': 12, '4': 1, '5': 8, '10': 'enabled'},
    const {'1': 'extraInfo', '3': 13, '4': 1, '5': 9, '10': 'extraInfo'},
  ],
};

/// Descriptor for `MsgCreateRecipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateRecipeDescriptor = $convert.base64Decode('Cg9Nc2dDcmVhdGVSZWNpcGUSGAoHY3JlYXRvchgBIAEoCVIHY3JlYXRvchIeCgpjb29rYm9va0lEGAIgASgJUgpjb29rYm9va0lEEg4KAklEGAMgASgJUgJJRBISCgRuYW1lGAQgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAUgASgJUgtkZXNjcmlwdGlvbhIYCgd2ZXJzaW9uGAYgASgJUgd2ZXJzaW9uEkkKCmNvaW5JbnB1dHMYByADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuQ29pbklucHV0QgTI3h8AUgpjb2luSW5wdXRzEkkKCml0ZW1JbnB1dHMYCCADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuSXRlbUlucHV0QgTI3h8AUgppdGVtSW5wdXRzEkUKB2VudHJpZXMYCSABKAsyJS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuRW50cmllc0xpc3RCBMjeHwBSB2VudHJpZXMSSQoHb3V0cHV0cxgKIAMoCzIpLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5XZWlnaHRlZE91dHB1dHNCBMjeHwBSB291dHB1dHMSJAoNYmxvY2tJbnRlcnZhbBgLIAEoA1INYmxvY2tJbnRlcnZhbBIYCgdlbmFibGVkGAwgASgIUgdlbmFibGVkEhwKCWV4dHJhSW5mbxgNIAEoCVIJZXh0cmFJbmZv');
@$core.Deprecated('Use msgCreateRecipeResponseDescriptor instead')
const MsgCreateRecipeResponse$json = const {
  '1': 'MsgCreateRecipeResponse',
};

/// Descriptor for `MsgCreateRecipeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateRecipeResponseDescriptor = $convert.base64Decode('ChdNc2dDcmVhdGVSZWNpcGVSZXNwb25zZQ==');
@$core.Deprecated('Use msgUpdateRecipeDescriptor instead')
const MsgUpdateRecipe$json = const {
  '1': 'MsgUpdateRecipe',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'cookbookID', '3': 2, '4': 1, '5': 9, '10': 'cookbookID'},
    const {'1': 'ID', '3': 3, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'coinInputs', '3': 7, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.CoinInput', '8': const {}, '10': 'coinInputs'},
    const {'1': 'itemInputs', '3': 8, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.ItemInput', '8': const {}, '10': 'itemInputs'},
    const {'1': 'entries', '3': 9, '4': 1, '5': 11, '6': '.Pylonstech.pylons.pylons.EntriesList', '8': const {}, '10': 'entries'},
    const {'1': 'outputs', '3': 10, '4': 3, '5': 11, '6': '.Pylonstech.pylons.pylons.WeightedOutputs', '8': const {}, '10': 'outputs'},
    const {'1': 'blockInterval', '3': 11, '4': 1, '5': 3, '10': 'blockInterval'},
    const {'1': 'enabled', '3': 12, '4': 1, '5': 8, '10': 'enabled'},
    const {'1': 'extraInfo', '3': 13, '4': 1, '5': 9, '10': 'extraInfo'},
  ],
};

/// Descriptor for `MsgUpdateRecipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateRecipeDescriptor = $convert.base64Decode('Cg9Nc2dVcGRhdGVSZWNpcGUSGAoHY3JlYXRvchgBIAEoCVIHY3JlYXRvchIeCgpjb29rYm9va0lEGAIgASgJUgpjb29rYm9va0lEEg4KAklEGAMgASgJUgJJRBISCgRuYW1lGAQgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAUgASgJUgtkZXNjcmlwdGlvbhIYCgd2ZXJzaW9uGAYgASgJUgd2ZXJzaW9uEkkKCmNvaW5JbnB1dHMYByADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuQ29pbklucHV0QgTI3h8AUgpjb2luSW5wdXRzEkkKCml0ZW1JbnB1dHMYCCADKAsyIy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuSXRlbUlucHV0QgTI3h8AUgppdGVtSW5wdXRzEkUKB2VudHJpZXMYCSABKAsyJS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuRW50cmllc0xpc3RCBMjeHwBSB2VudHJpZXMSSQoHb3V0cHV0cxgKIAMoCzIpLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5XZWlnaHRlZE91dHB1dHNCBMjeHwBSB291dHB1dHMSJAoNYmxvY2tJbnRlcnZhbBgLIAEoA1INYmxvY2tJbnRlcnZhbBIYCgdlbmFibGVkGAwgASgIUgdlbmFibGVkEhwKCWV4dHJhSW5mbxgNIAEoCVIJZXh0cmFJbmZv');
@$core.Deprecated('Use msgUpdateRecipeResponseDescriptor instead')
const MsgUpdateRecipeResponse$json = const {
  '1': 'MsgUpdateRecipeResponse',
};

/// Descriptor for `MsgUpdateRecipeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateRecipeResponseDescriptor = $convert.base64Decode('ChdNc2dVcGRhdGVSZWNpcGVSZXNwb25zZQ==');
@$core.Deprecated('Use msgCreateCookbookDescriptor instead')
const MsgCreateCookbook$json = const {
  '1': 'MsgCreateCookbook',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'developer', '3': 5, '4': 1, '5': 9, '10': 'developer'},
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'supportEmail', '3': 7, '4': 1, '5': 9, '10': 'supportEmail'},
    const {'1': 'costPerBlock', '3': 8, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'costPerBlock'},
    const {'1': 'enabled', '3': 9, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `MsgCreateCookbook`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateCookbookDescriptor = $convert.base64Decode('ChFNc2dDcmVhdGVDb29rYm9vaxIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEg4KAklEGAIgASgJUgJJRBISCgRuYW1lGAMgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAQgASgJUgtkZXNjcmlwdGlvbhIcCglkZXZlbG9wZXIYBSABKAlSCWRldmVsb3BlchIYCgd2ZXJzaW9uGAYgASgJUgd2ZXJzaW9uEiIKDHN1cHBvcnRFbWFpbBgHIAEoCVIMc3VwcG9ydEVtYWlsEkMKDGNvc3RQZXJCbG9jaxgIIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIMY29zdFBlckJsb2NrEhgKB2VuYWJsZWQYCSABKAhSB2VuYWJsZWQ=');
@$core.Deprecated('Use msgCreateCookbookResponseDescriptor instead')
const MsgCreateCookbookResponse$json = const {
  '1': 'MsgCreateCookbookResponse',
};

/// Descriptor for `MsgCreateCookbookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateCookbookResponseDescriptor = $convert.base64Decode('ChlNc2dDcmVhdGVDb29rYm9va1Jlc3BvbnNl');
@$core.Deprecated('Use msgUpdateCookbookDescriptor instead')
const MsgUpdateCookbook$json = const {
  '1': 'MsgUpdateCookbook',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'developer', '3': 5, '4': 1, '5': 9, '10': 'developer'},
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'supportEmail', '3': 7, '4': 1, '5': 9, '10': 'supportEmail'},
    const {'1': 'costPerBlock', '3': 8, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'costPerBlock'},
    const {'1': 'enabled', '3': 9, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `MsgUpdateCookbook`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateCookbookDescriptor = $convert.base64Decode('ChFNc2dVcGRhdGVDb29rYm9vaxIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEg4KAklEGAIgASgJUgJJRBISCgRuYW1lGAMgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAQgASgJUgtkZXNjcmlwdGlvbhIcCglkZXZlbG9wZXIYBSABKAlSCWRldmVsb3BlchIYCgd2ZXJzaW9uGAYgASgJUgd2ZXJzaW9uEiIKDHN1cHBvcnRFbWFpbBgHIAEoCVIMc3VwcG9ydEVtYWlsEkMKDGNvc3RQZXJCbG9jaxgIIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIMY29zdFBlckJsb2NrEhgKB2VuYWJsZWQYCSABKAhSB2VuYWJsZWQ=');
@$core.Deprecated('Use msgUpdateCookbookResponseDescriptor instead')
const MsgUpdateCookbookResponse$json = const {
  '1': 'MsgUpdateCookbookResponse',
};

/// Descriptor for `MsgUpdateCookbookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateCookbookResponseDescriptor = $convert.base64Decode('ChlNc2dVcGRhdGVDb29rYm9va1Jlc3BvbnNl');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {'1': 'BurnDebtToken', '2': '.Pylonstech.pylons.pylons.MsgBurnDebtToken', '3': '.Pylonstech.pylons.pylons.MsgBurnDebtTokenResponse'},
    const {'1': 'UpdateAccount', '2': '.Pylonstech.pylons.pylons.MsgUpdateAccount', '3': '.Pylonstech.pylons.pylons.MsgUpdateAccountResponse'},
    const {'1': 'FulfillTrade', '2': '.Pylonstech.pylons.pylons.MsgFulfillTrade', '3': '.Pylonstech.pylons.pylons.MsgFulfillTradeResponse'},
    const {'1': 'CreateTrade', '2': '.Pylonstech.pylons.pylons.MsgCreateTrade', '3': '.Pylonstech.pylons.pylons.MsgCreateTradeResponse'},
    const {'1': 'CancelTrade', '2': '.Pylonstech.pylons.pylons.MsgCancelTrade', '3': '.Pylonstech.pylons.pylons.MsgCancelTradeResponse'},
    const {'1': 'CompleteExecutionEarly', '2': '.Pylonstech.pylons.pylons.MsgCompleteExecutionEarly', '3': '.Pylonstech.pylons.pylons.MsgCompleteExecutionEarlyResponse'},
    const {'1': 'TransferCookbook', '2': '.Pylonstech.pylons.pylons.MsgTransferCookbook', '3': '.Pylonstech.pylons.pylons.MsgTransferCookbookResponse'},
    const {'1': 'GoogleInAppPurchaseGetCoins', '2': '.Pylonstech.pylons.pylons.MsgGoogleInAppPurchaseGetCoins', '3': '.Pylonstech.pylons.pylons.MsgGoogleInAppPurchaseGetCoinsResponse'},
    const {'1': 'CreateAccount', '2': '.Pylonstech.pylons.pylons.MsgCreateAccount', '3': '.Pylonstech.pylons.pylons.MsgCreateAccountResponse'},
    const {'1': 'SendItems', '2': '.Pylonstech.pylons.pylons.MsgSendItems', '3': '.Pylonstech.pylons.pylons.MsgSendItemsResponse'},
    const {'1': 'ExecuteRecipe', '2': '.Pylonstech.pylons.pylons.MsgExecuteRecipe', '3': '.Pylonstech.pylons.pylons.MsgExecuteRecipeResponse'},
    const {'1': 'SetItemString', '2': '.Pylonstech.pylons.pylons.MsgSetItemString', '3': '.Pylonstech.pylons.pylons.MsgSetItemStringResponse'},
    const {'1': 'CreateRecipe', '2': '.Pylonstech.pylons.pylons.MsgCreateRecipe', '3': '.Pylonstech.pylons.pylons.MsgCreateRecipeResponse'},
    const {'1': 'UpdateRecipe', '2': '.Pylonstech.pylons.pylons.MsgUpdateRecipe', '3': '.Pylonstech.pylons.pylons.MsgUpdateRecipeResponse'},
    const {'1': 'CreateCookbook', '2': '.Pylonstech.pylons.pylons.MsgCreateCookbook', '3': '.Pylonstech.pylons.pylons.MsgCreateCookbookResponse'},
    const {'1': 'UpdateCookbook', '2': '.Pylonstech.pylons.pylons.MsgUpdateCookbook', '3': '.Pylonstech.pylons.pylons.MsgUpdateCookbookResponse'},
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> MsgServiceBase$messageJson = const {
  '.Pylonstech.pylons.pylons.MsgBurnDebtToken': MsgBurnDebtToken$json,
  '.Pylonstech.pylons.pylons.RedeemInfo': $3.RedeemInfo$json,
  '.Pylonstech.pylons.pylons.MsgBurnDebtTokenResponse': MsgBurnDebtTokenResponse$json,
  '.Pylonstech.pylons.pylons.MsgUpdateAccount': MsgUpdateAccount$json,
  '.Pylonstech.pylons.pylons.MsgUpdateAccountResponse': MsgUpdateAccountResponse$json,
  '.Pylonstech.pylons.pylons.MsgFulfillTrade': MsgFulfillTrade$json,
  '.Pylonstech.pylons.pylons.ItemRef': $6.ItemRef$json,
  '.Pylonstech.pylons.pylons.PaymentInfo': $5.PaymentInfo$json,
  '.Pylonstech.pylons.pylons.MsgFulfillTradeResponse': MsgFulfillTradeResponse$json,
  '.Pylonstech.pylons.pylons.MsgCreateTrade': MsgCreateTrade$json,
  '.Pylonstech.pylons.pylons.CoinInput': $2.CoinInput$json,
  '.cosmos.base.v1beta1.Coin': $0.Coin$json,
  '.Pylonstech.pylons.pylons.ItemInput': $2.ItemInput$json,
  '.Pylonstech.pylons.pylons.DoubleInputParam': $2.DoubleInputParam$json,
  '.Pylonstech.pylons.pylons.LongInputParam': $2.LongInputParam$json,
  '.Pylonstech.pylons.pylons.StringInputParam': $2.StringInputParam$json,
  '.Pylonstech.pylons.pylons.ConditionList': $2.ConditionList$json,
  '.Pylonstech.pylons.pylons.MsgCreateTradeResponse': MsgCreateTradeResponse$json,
  '.Pylonstech.pylons.pylons.MsgCancelTrade': MsgCancelTrade$json,
  '.Pylonstech.pylons.pylons.MsgCancelTradeResponse': MsgCancelTradeResponse$json,
  '.Pylonstech.pylons.pylons.MsgCompleteExecutionEarly': MsgCompleteExecutionEarly$json,
  '.Pylonstech.pylons.pylons.MsgCompleteExecutionEarlyResponse': MsgCompleteExecutionEarlyResponse$json,
  '.Pylonstech.pylons.pylons.MsgTransferCookbook': MsgTransferCookbook$json,
  '.Pylonstech.pylons.pylons.MsgTransferCookbookResponse': MsgTransferCookbookResponse$json,
  '.Pylonstech.pylons.pylons.MsgGoogleInAppPurchaseGetCoins': MsgGoogleInAppPurchaseGetCoins$json,
  '.Pylonstech.pylons.pylons.MsgGoogleInAppPurchaseGetCoinsResponse': MsgGoogleInAppPurchaseGetCoinsResponse$json,
  '.Pylonstech.pylons.pylons.MsgCreateAccount': MsgCreateAccount$json,
  '.Pylonstech.pylons.pylons.MsgCreateAccountResponse': MsgCreateAccountResponse$json,
  '.Pylonstech.pylons.pylons.MsgSendItems': MsgSendItems$json,
  '.Pylonstech.pylons.pylons.MsgSendItemsResponse': MsgSendItemsResponse$json,
  '.Pylonstech.pylons.pylons.MsgExecuteRecipe': MsgExecuteRecipe$json,
  '.Pylonstech.pylons.pylons.MsgExecuteRecipeResponse': MsgExecuteRecipeResponse$json,
  '.Pylonstech.pylons.pylons.MsgSetItemString': MsgSetItemString$json,
  '.Pylonstech.pylons.pylons.MsgSetItemStringResponse': MsgSetItemStringResponse$json,
  '.Pylonstech.pylons.pylons.MsgCreateRecipe': MsgCreateRecipe$json,
  '.Pylonstech.pylons.pylons.EntriesList': $2.EntriesList$json,
  '.Pylonstech.pylons.pylons.CoinOutput': $2.CoinOutput$json,
  '.Pylonstech.pylons.pylons.ItemOutput': $2.ItemOutput$json,
  '.Pylonstech.pylons.pylons.DoubleParam': $2.DoubleParam$json,
  '.Pylonstech.pylons.pylons.DoubleWeightRange': $2.DoubleWeightRange$json,
  '.Pylonstech.pylons.pylons.LongParam': $2.LongParam$json,
  '.Pylonstech.pylons.pylons.IntWeightRange': $2.IntWeightRange$json,
  '.Pylonstech.pylons.pylons.StringParam': $2.StringParam$json,
  '.Pylonstech.pylons.pylons.StringKeyValue': $1.StringKeyValue$json,
  '.Pylonstech.pylons.pylons.ItemModifyOutput': $2.ItemModifyOutput$json,
  '.Pylonstech.pylons.pylons.WeightedOutputs': $2.WeightedOutputs$json,
  '.Pylonstech.pylons.pylons.MsgCreateRecipeResponse': MsgCreateRecipeResponse$json,
  '.Pylonstech.pylons.pylons.MsgUpdateRecipe': MsgUpdateRecipe$json,
  '.Pylonstech.pylons.pylons.MsgUpdateRecipeResponse': MsgUpdateRecipeResponse$json,
  '.Pylonstech.pylons.pylons.MsgCreateCookbook': MsgCreateCookbook$json,
  '.Pylonstech.pylons.pylons.MsgCreateCookbookResponse': MsgCreateCookbookResponse$json,
  '.Pylonstech.pylons.pylons.MsgUpdateCookbook': MsgUpdateCookbook$json,
  '.Pylonstech.pylons.pylons.MsgUpdateCookbookResponse': MsgUpdateCookbookResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode('CgNNc2cSbwoNQnVybkRlYnRUb2tlbhIqLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dCdXJuRGVidFRva2VuGjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ0J1cm5EZWJ0VG9rZW5SZXNwb25zZRJvCg1VcGRhdGVBY2NvdW50EiouUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ1VwZGF0ZUFjY291bnQaMi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnVXBkYXRlQWNjb3VudFJlc3BvbnNlEmwKDEZ1bGZpbGxUcmFkZRIpLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dGdWxmaWxsVHJhZGUaMS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnRnVsZmlsbFRyYWRlUmVzcG9uc2USaQoLQ3JlYXRlVHJhZGUSKC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ3JlYXRlVHJhZGUaMC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ3JlYXRlVHJhZGVSZXNwb25zZRJpCgtDYW5jZWxUcmFkZRIoLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dDYW5jZWxUcmFkZRowLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dDYW5jZWxUcmFkZVJlc3BvbnNlEooBChZDb21wbGV0ZUV4ZWN1dGlvbkVhcmx5EjMuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ0NvbXBsZXRlRXhlY3V0aW9uRWFybHkaOy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ29tcGxldGVFeGVjdXRpb25FYXJseVJlc3BvbnNlEngKEFRyYW5zZmVyQ29va2Jvb2sSLS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnVHJhbnNmZXJDb29rYm9vaxo1LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dUcmFuc2ZlckNvb2tib29rUmVzcG9uc2USmQEKG0dvb2dsZUluQXBwUHVyY2hhc2VHZXRDb2lucxI4LlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dHb29nbGVJbkFwcFB1cmNoYXNlR2V0Q29pbnMaQC5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnR29vZ2xlSW5BcHBQdXJjaGFzZUdldENvaW5zUmVzcG9uc2USbwoNQ3JlYXRlQWNjb3VudBIqLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dDcmVhdGVBY2NvdW50GjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ0NyZWF0ZUFjY291bnRSZXNwb25zZRJjCglTZW5kSXRlbXMSJi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnU2VuZEl0ZW1zGi4uUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ1NlbmRJdGVtc1Jlc3BvbnNlEm8KDUV4ZWN1dGVSZWNpcGUSKi5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnRXhlY3V0ZVJlY2lwZRoyLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dFeGVjdXRlUmVjaXBlUmVzcG9uc2USbwoNU2V0SXRlbVN0cmluZxIqLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dTZXRJdGVtU3RyaW5nGjIuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ1NldEl0ZW1TdHJpbmdSZXNwb25zZRJsCgxDcmVhdGVSZWNpcGUSKS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ3JlYXRlUmVjaXBlGjEuUHlsb25zdGVjaC5weWxvbnMucHlsb25zLk1zZ0NyZWF0ZVJlY2lwZVJlc3BvbnNlEmwKDFVwZGF0ZVJlY2lwZRIpLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dVcGRhdGVSZWNpcGUaMS5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnVXBkYXRlUmVjaXBlUmVzcG9uc2UScgoOQ3JlYXRlQ29va2Jvb2sSKy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ3JlYXRlQ29va2Jvb2saMy5QeWxvbnN0ZWNoLnB5bG9ucy5weWxvbnMuTXNnQ3JlYXRlQ29va2Jvb2tSZXNwb25zZRJyCg5VcGRhdGVDb29rYm9vaxIrLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dVcGRhdGVDb29rYm9vaxozLlB5bG9uc3RlY2gucHlsb25zLnB5bG9ucy5Nc2dVcGRhdGVDb29rYm9va1Jlc3BvbnNl');