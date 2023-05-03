///
//  Generated code. Do not modify.
//  source: deedee/api/model/verification.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verificationDescriptor instead')
const Verification$json = const {
  '1': 'Verification',
  '2': const [
    const {'1': 'verificationId', '3': 1, '4': 1, '5': 4, '10': 'verificationId'},
    const {'1': 'accountId', '3': 3, '4': 1, '5': 4, '10': 'accountId'},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.deedee.api.verification.model.Verification.Status', '10': 'status'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.deedee.api.verification.model.Verification.Type', '10': 'type'},
  ],
  '4': const [Verification_Status$json, Verification_Type$json],
};

@$core.Deprecated('Use verificationDescriptor instead')
const Verification_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'VERIFIED', '2': 0},
    const {'1': 'EXPIRED', '2': 1},
    const {'1': 'SENT', '2': 2},
  ],
};

@$core.Deprecated('Use verificationDescriptor instead')
const Verification_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'EMAIL', '2': 0},
    const {'1': 'PASSPORT', '2': 1},
  ],
};

/// Descriptor for `Verification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationDescriptor = $convert.base64Decode('CgxWZXJpZmljYXRpb24SJgoOdmVyaWZpY2F0aW9uSWQYASABKARSDnZlcmlmaWNhdGlvbklkEhwKCWFjY291bnRJZBgDIAEoBFIJYWNjb3VudElkEkoKBnN0YXR1cxgEIAEoDjIyLmRlZWRlZS5hcGkudmVyaWZpY2F0aW9uLm1vZGVsLlZlcmlmaWNhdGlvbi5TdGF0dXNSBnN0YXR1cxJECgR0eXBlGAUgASgOMjAuZGVlZGVlLmFwaS52ZXJpZmljYXRpb24ubW9kZWwuVmVyaWZpY2F0aW9uLlR5cGVSBHR5cGUiLQoGU3RhdHVzEgwKCFZFUklGSUVEEAASCwoHRVhQSVJFRBABEggKBFNFTlQQAiIfCgRUeXBlEgkKBUVNQUlMEAASDAoIUEFTU1BPUlQQAQ==');
