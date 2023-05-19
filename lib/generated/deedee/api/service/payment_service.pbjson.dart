///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/service/payment_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paymentMethodRequestDescriptor instead')
const PaymentMethodRequest$json = const {
  '1': 'PaymentMethodRequest',
  '2': const [
    const {'1': 'paymentMethod', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.payment.model.PaymentMethod', '10': 'paymentMethod'},
  ],
};

/// Descriptor for `PaymentMethodRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentMethodRequestDescriptor = $convert.base64Decode('ChRQYXltZW50TWV0aG9kUmVxdWVzdBJNCg1wYXltZW50TWV0aG9kGAEgASgLMicuZGVlZGVlLmFwaS5wYXltZW50Lm1vZGVsLlBheW1lbnRNZXRob2RSDXBheW1lbnRNZXRob2Q=');
@$core.Deprecated('Use paymentMethodResponseDescriptor instead')
const PaymentMethodResponse$json = const {
  '1': 'PaymentMethodResponse',
  '2': const [
    const {'1': 'paymentMethods', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.payment.model.PaymentMethod', '10': 'paymentMethods'},
  ],
};

/// Descriptor for `PaymentMethodResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentMethodResponseDescriptor = $convert.base64Decode('ChVQYXltZW50TWV0aG9kUmVzcG9uc2USTwoOcGF5bWVudE1ldGhvZHMYASADKAsyJy5kZWVkZWUuYXBpLnBheW1lbnQubW9kZWwuUGF5bWVudE1ldGhvZFIOcGF5bWVudE1ldGhvZHM=');
