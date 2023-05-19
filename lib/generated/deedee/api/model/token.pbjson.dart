///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pushNotificationTokenDescriptor instead')
const PushNotificationToken$json = const {
  '1': 'PushNotificationToken',
  '2': const [
    const {'1': 'tokenId', '3': 1, '4': 1, '5': 4, '10': 'tokenId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.deedee.api.token.model.PushNotificationToken.Type', '10': 'type'},
  ],
  '4': const [PushNotificationToken_Type$json],
};

@$core.Deprecated('Use pushNotificationTokenDescriptor instead')
const PushNotificationToken_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'VALID', '2': 0},
    const {'1': 'EXPIRED', '2': 1},
  ],
};

/// Descriptor for `PushNotificationToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushNotificationTokenDescriptor = $convert.base64Decode('ChVQdXNoTm90aWZpY2F0aW9uVG9rZW4SGAoHdG9rZW5JZBgBIAEoBFIHdG9rZW5JZBIWCgZ1c2VySWQYAyABKAlSBnVzZXJJZBIUCgV2YWx1ZRgCIAEoCVIFdmFsdWUSRgoEdHlwZRgEIAEoDjIyLmRlZWRlZS5hcGkudG9rZW4ubW9kZWwuUHVzaE5vdGlmaWNhdGlvblRva2VuLlR5cGVSBHR5cGUiHgoEVHlwZRIJCgVWQUxJRBAAEgsKB0VYUElSRUQQAQ==');
