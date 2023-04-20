///
//  Generated code. Do not modify.
//  source: token_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tokenRequestDescriptor instead')
const TokenRequest$json = const {
  '1': 'TokenRequest',
  '2': const [
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `TokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenRequestDescriptor = $convert.base64Decode('CgxUb2tlblJlcXVlc3QSFgoGdXNlcklkGAMgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use tokenResponseDescriptor instead')
const TokenResponse$json = const {
  '1': 'TokenResponse',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 11, '6': '.bucket.Token', '10': 'token'},
  ],
};

/// Descriptor for `TokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenResponseDescriptor = $convert.base64Decode('Cg1Ub2tlblJlc3BvbnNlEiMKBXRva2VuGAEgASgLMg0uYnVja2V0LlRva2VuUgV0b2tlbg==');
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'tokenId', '3': 1, '4': 1, '5': 4, '10': 'tokenId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.bucket.Token.TYPE', '10': 'type'},
  ],
  '4': const [Token_TYPE$json],
};

@$core.Deprecated('Use tokenDescriptor instead')
const Token_TYPE$json = const {
  '1': 'TYPE',
  '2': const [
    const {'1': 'VALID', '2': 0},
    const {'1': 'EXPIRED', '2': 1},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode('CgVUb2tlbhIYCgd0b2tlbklkGAEgASgEUgd0b2tlbklkEhYKBnVzZXJJZBgDIAEoCVIGdXNlcklkEhQKBXZhbHVlGAIgASgJUgV2YWx1ZRImCgR0eXBlGAQgASgOMhIuYnVja2V0LlRva2VuLlRZUEVSBHR5cGUiHgoEVFlQRRIJCgVWQUxJRBAAEgsKB0VYUElSRUQQAQ==');
