///
//  Generated code. Do not modify.
//  source: deedee/api/service/account_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use accountRequestDescriptor instead')
const AccountRequest$json = const {
  '1': 'AccountRequest',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.account.model.Account', '9': 0, '10': 'account', '17': true},
  ],
  '8': const [
    const {'1': '_account'},
  ],
};

/// Descriptor for `AccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountRequestDescriptor = $convert.base64Decode('Cg5BY2NvdW50UmVxdWVzdBJACgdhY2NvdW50GAEgASgLMiEuZGVlZGVlLmFwaS5hY2NvdW50Lm1vZGVsLkFjY291bnRIAFIHYWNjb3VudIgBAUIKCghfYWNjb3VudA==');
@$core.Deprecated('Use accountResponseDescriptor instead')
const AccountResponse$json = const {
  '1': 'AccountResponse',
  '2': const [
    const {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.account.model.Account', '10': 'accounts'},
  ],
};

/// Descriptor for `AccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountResponseDescriptor = $convert.base64Decode('Cg9BY2NvdW50UmVzcG9uc2USPQoIYWNjb3VudHMYASADKAsyIS5kZWVkZWUuYXBpLmFjY291bnQubW9kZWwuQWNjb3VudFIIYWNjb3VudHM=');
