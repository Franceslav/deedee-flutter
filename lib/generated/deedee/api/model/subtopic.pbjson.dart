///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/subtopic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use subtopicDescriptor instead')
const Subtopic$json = const {
  '1': 'Subtopic',
  '2': const [
    const {'1': 'subtopicId', '3': 1, '4': 1, '5': 13, '10': 'subtopicId'},
    const {'1': 'topicId', '3': 2, '4': 1, '5': 13, '10': 'topicId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
  ],
};

/// Descriptor for `Subtopic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicDescriptor = $convert.base64Decode('CghTdWJ0b3BpYxIeCgpzdWJ0b3BpY0lkGAEgASgNUgpzdWJ0b3BpY0lkEhgKB3RvcGljSWQYAiABKA1SB3RvcGljSWQSFgoGdXNlcklkGAMgASgJUgZ1c2VySWQSFAoFdGl0bGUYBCABKAlSBXRpdGxlEksKC2dlb2xvY2F0aW9uGAUgASgLMikuZGVlZGVlLmFwaS5nZW9sb2NhdGlvbi5tb2RlbC5HZW9sb2NhdGlvblILZ2VvbG9jYXRpb24=');
