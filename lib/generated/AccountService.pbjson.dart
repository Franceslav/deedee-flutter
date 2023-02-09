///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
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
@$core.Deprecated('Use getBalanceRequestDescriptor instead')
const GetBalanceRequest$json = const {
  '1': 'GetBalanceRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetBalanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBalanceRequestDescriptor = $convert.base64Decode('ChFHZXRCYWxhbmNlUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use getBalanceResponseDescriptor instead')
const GetBalanceResponse$json = const {
  '1': 'GetBalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 1, '10': 'balance'},
  ],
};

/// Descriptor for `GetBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBalanceResponseDescriptor = $convert.base64Decode('ChJHZXRCYWxhbmNlUmVzcG9uc2USGAoHYmFsYW5jZRgBIAEoAVIHYmFsYW5jZQ==');
@$core.Deprecated('Use accountStatusRequestDescriptor instead')
const AccountStatusRequest$json = const {
  '1': 'AccountStatusRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `AccountStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountStatusRequestDescriptor = $convert.base64Decode('ChRBY2NvdW50U3RhdHVzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use accountStatusResponseDescriptor instead')
const AccountStatusResponse$json = const {
  '1': 'AccountStatusResponse',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.topic.AccountStatusResponse.VERIFICATION_TYPE', '10': 'type'},
    const {'1': 'isPremium', '3': 2, '4': 1, '5': 8, '10': 'isPremium'},
  ],
  '4': const [AccountStatusResponse_VERIFICATION_TYPE$json],
};

@$core.Deprecated('Use accountStatusResponseDescriptor instead')
const AccountStatusResponse_VERIFICATION_TYPE$json = const {
  '1': 'VERIFICATION_TYPE',
  '2': const [
    const {'1': 'UNVERIFIED', '2': 0},
    const {'1': 'VERIFIED', '2': 1},
    const {'1': 'BLOCKED', '2': 2},
  ],
};

/// Descriptor for `AccountStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountStatusResponseDescriptor = $convert.base64Decode('ChVBY2NvdW50U3RhdHVzUmVzcG9uc2USQgoEdHlwZRgBIAEoDjIuLnRvcGljLkFjY291bnRTdGF0dXNSZXNwb25zZS5WRVJJRklDQVRJT05fVFlQRVIEdHlwZRIcCglpc1ByZW1pdW0YAiABKAhSCWlzUHJlbWl1bSI+ChFWRVJJRklDQVRJT05fVFlQRRIOCgpVTlZFUklGSUVEEAASDAoIVkVSSUZJRUQQARILCgdCTE9DS0VEEAI=');
