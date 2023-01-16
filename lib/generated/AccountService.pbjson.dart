///
//  Generated code. Do not modify.
//  source: AccountService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use topUpRequestDescriptor instead')
const TopUpRequest$json = const {
  '1': 'TopUpRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `TopUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topUpRequestDescriptor = $convert.base64Decode('CgxUb3BVcFJlcXVlc3QSFgoGYW1vdW50GAEgASgBUgZhbW91bnQ=');
@$core.Deprecated('Use topUpResponseDescriptor instead')
const TopUpResponse$json = const {
  '1': 'TopUpResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `TopUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topUpResponseDescriptor = $convert.base64Decode('Cg1Ub3BVcFJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQ=');
