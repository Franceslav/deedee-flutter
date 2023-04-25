///
//  Generated code. Do not modify.
//  source: deedee/api/service/token_service.proto
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
    const {'1': 'token', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.token.model.PushNotificationToken', '10': 'token'},
  ],
};

/// Descriptor for `TokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenResponseDescriptor = $convert.base64Decode('Cg1Ub2tlblJlc3BvbnNlEkMKBXRva2VuGAEgASgLMi0uZGVlZGVlLmFwaS50b2tlbi5tb2RlbC5QdXNoTm90aWZpY2F0aW9uVG9rZW5SBXRva2Vu');
