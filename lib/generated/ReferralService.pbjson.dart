///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getUserReferralsRequestDescriptor instead')
const GetUserReferralsRequest$json = const {
  '1': 'GetUserReferralsRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetUserReferralsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserReferralsRequestDescriptor = $convert.base64Decode('ChdHZXRVc2VyUmVmZXJyYWxzUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');
@$core.Deprecated('Use getUserReferralsResponseDescriptor instead')
const GetUserReferralsResponse$json = const {
  '1': 'GetUserReferralsResponse',
  '2': const [
    const {'1': 'userReferral', '3': 1, '4': 3, '5': 11, '6': '.bucket.UserReferral', '10': 'userReferral'},
  ],
};

/// Descriptor for `GetUserReferralsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserReferralsResponseDescriptor = $convert.base64Decode('ChhHZXRVc2VyUmVmZXJyYWxzUmVzcG9uc2USOAoMdXNlclJlZmVycmFsGAEgAygLMhQuYnVja2V0LlVzZXJSZWZlcnJhbFIMdXNlclJlZmVycmFs');
@$core.Deprecated('Use userReferralDescriptor instead')
const UserReferral$json = const {
  '1': 'UserReferral',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'placedTagsAmount', '3': 2, '4': 1, '5': 5, '10': 'placedTagsAmount'},
  ],
};

/// Descriptor for `UserReferral`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userReferralDescriptor = $convert.base64Decode('CgxVc2VyUmVmZXJyYWwSFAoFZW1haWwYASABKAlSBWVtYWlsEioKEHBsYWNlZFRhZ3NBbW91bnQYAiABKAVSEHBsYWNlZFRhZ3NBbW91bnQ=');
