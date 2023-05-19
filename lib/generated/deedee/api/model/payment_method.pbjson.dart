///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/payment_method.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod$json = const {
  '1': 'PaymentMethod',
  '2': const [
    const {'1': 'paymentMethodId', '3': 1, '4': 1, '5': 4, '10': 'paymentMethodId'},
    const {'1': 'addedBy', '3': 2, '4': 1, '5': 4, '10': 'addedBy'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.deedee.api.payment.model.PaymentMethod.Type', '10': 'type'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.deedee.api.payment.model.PaymentMethod.Status', '10': 'status'},
    const {'1': 'title', '3': 8, '4': 1, '5': 9, '10': 'title'},
  ],
  '4': const [PaymentMethod_Type$json, PaymentMethod_Status$json],
};

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'CARD', '2': 0},
    const {'1': 'BANK_TRANSFER', '2': 1},
  ],
};

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ADDED', '2': 0},
    const {'1': 'CHANGED', '2': 1},
    const {'1': 'DELETED', '2': 2},
  ],
};

/// Descriptor for `PaymentMethod`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentMethodDescriptor = $convert.base64Decode('Cg1QYXltZW50TWV0aG9kEigKD3BheW1lbnRNZXRob2RJZBgBIAEoBFIPcGF5bWVudE1ldGhvZElkEhgKB2FkZGVkQnkYAiABKARSB2FkZGVkQnkSOAoJY3JlYXRlZEF0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EksKC2dlb2xvY2F0aW9uGAUgASgLMikuZGVlZGVlLmFwaS5nZW9sb2NhdGlvbi5tb2RlbC5HZW9sb2NhdGlvblILZ2VvbG9jYXRpb24SQAoEdHlwZRgGIAEoDjIsLmRlZWRlZS5hcGkucGF5bWVudC5tb2RlbC5QYXltZW50TWV0aG9kLlR5cGVSBHR5cGUSRgoGc3RhdHVzGAcgASgOMi4uZGVlZGVlLmFwaS5wYXltZW50Lm1vZGVsLlBheW1lbnRNZXRob2QuU3RhdHVzUgZzdGF0dXMSFAoFdGl0bGUYCCABKAlSBXRpdGxlIiMKBFR5cGUSCAoEQ0FSRBAAEhEKDUJBTktfVFJBTlNGRVIQASItCgZTdGF0dXMSCQoFQURERUQQABILCgdDSEFOR0VEEAESCwoHREVMRVRFRBAC');
