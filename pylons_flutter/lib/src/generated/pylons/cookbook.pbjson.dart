///
//  Generated code. Do not modify.
//  source: pylons/cookbook.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use cookbookDescriptor instead')
const Cookbook$json = const {
  '1': 'Cookbook',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'ID', '3': 2, '4': 1, '5': 9, '10': 'ID'},
    const {'1': 'nodeVersion', '3': 3, '4': 1, '5': 9, '10': 'nodeVersion'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'developer', '3': 6, '4': 1, '5': 9, '10': 'developer'},
    const {'1': 'version', '3': 7, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'supportEmail', '3': 8, '4': 1, '5': 9, '10': 'supportEmail'},
    const {'1': 'costPerBlock', '3': 9, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'costPerBlock'},
    const {'1': 'enabled', '3': 10, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `Cookbook`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cookbookDescriptor = $convert.base64Decode('CghDb29rYm9vaxIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEg4KAklEGAIgASgJUgJJRBIgCgtub2RlVmVyc2lvbhgDIAEoCVILbm9kZVZlcnNpb24SEgoEbmFtZRgEIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SHAoJZGV2ZWxvcGVyGAYgASgJUglkZXZlbG9wZXISGAoHdmVyc2lvbhgHIAEoCVIHdmVyc2lvbhIiCgxzdXBwb3J0RW1haWwYCCABKAlSDHN1cHBvcnRFbWFpbBJDCgxjb3N0UGVyQmxvY2sYCSABKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CBMjeHwBSDGNvc3RQZXJCbG9jaxIYCgdlbmFibGVkGAogASgIUgdlbmFibGVk');
