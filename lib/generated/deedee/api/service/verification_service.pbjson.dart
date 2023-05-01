///
//  Generated code. Do not modify.
//  source: deedee/api/service/verification_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verificationRequestDescriptor instead')
const VerificationRequest$json = const {
  '1': 'VerificationRequest',
  '2': const [
    const {'1': 'verification', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.verification.model.Verification', '9': 0, '10': 'verification', '17': true},
  ],
  '8': const [
    const {'1': '_verification'},
  ],
};

/// Descriptor for `VerificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationRequestDescriptor = $convert.base64Decode('ChNWZXJpZmljYXRpb25SZXF1ZXN0ElQKDHZlcmlmaWNhdGlvbhgBIAEoCzIrLmRlZWRlZS5hcGkudmVyaWZpY2F0aW9uLm1vZGVsLlZlcmlmaWNhdGlvbkgAUgx2ZXJpZmljYXRpb26IAQFCDwoNX3ZlcmlmaWNhdGlvbg==');
@$core.Deprecated('Use verificationResponseDescriptor instead')
const VerificationResponse$json = const {
  '1': 'VerificationResponse',
  '2': const [
    const {'1': 'verifications', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.verification.model.Verification', '10': 'verifications'},
  ],
};

/// Descriptor for `VerificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationResponseDescriptor = $convert.base64Decode('ChRWZXJpZmljYXRpb25SZXNwb25zZRJRCg12ZXJpZmljYXRpb25zGAEgAygLMisuZGVlZGVlLmFwaS52ZXJpZmljYXRpb24ubW9kZWwuVmVyaWZpY2F0aW9uUg12ZXJpZmljYXRpb25z');
