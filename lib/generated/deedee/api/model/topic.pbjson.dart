///
//  Generated code. Do not modify.
//  source: deedee/api/model/topic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use topicDescriptor instead')
const Topic$json = const {
  '1': 'Topic',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 13, '10': 'topicId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'geolocation', '3': 4, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
  ],
};

/// Descriptor for `Topic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicDescriptor = $convert.base64Decode('CgVUb3BpYxIYCgd0b3BpY0lkGAEgASgNUgd0b3BpY0lkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRJLCgtnZW9sb2NhdGlvbhgEIAEoCzIpLmRlZWRlZS5hcGkuZ2VvbG9jYXRpb24ubW9kZWwuR2VvbG9jYXRpb25SC2dlb2xvY2F0aW9u');
