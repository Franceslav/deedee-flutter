///
//  Generated code. Do not modify.
//  source: topic_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use topicRequestDescriptor instead')
const TopicRequest$json = const {
  '1': 'TopicRequest',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 11, '6': '.deedee.service.Topic', '10': 'topic'},
  ],
};

/// Descriptor for `TopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicRequestDescriptor = $convert.base64Decode('CgxUb3BpY1JlcXVlc3QSKwoFdG9waWMYASABKAsyFS5kZWVkZWUuc2VydmljZS5Ub3BpY1IFdG9waWM=');
@$core.Deprecated('Use topicResponseDescriptor instead')
const TopicResponse$json = const {
  '1': 'TopicResponse',
  '2': const [
    const {'1': 'topics', '3': 1, '4': 3, '5': 11, '6': '.deedee.service.Topic', '10': 'topics'},
  ],
};

/// Descriptor for `TopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicResponseDescriptor = $convert.base64Decode('Cg1Ub3BpY1Jlc3BvbnNlEi0KBnRvcGljcxgBIAMoCzIVLmRlZWRlZS5zZXJ2aWNlLlRvcGljUgZ0b3BpY3M=');
@$core.Deprecated('Use subtopicRequestDescriptor instead')
const SubtopicRequest$json = const {
  '1': 'SubtopicRequest',
  '2': const [
    const {'1': 'subtopic', '3': 1, '4': 1, '5': 11, '6': '.deedee.service.Subtopic', '10': 'subtopic'},
  ],
};

/// Descriptor for `SubtopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicRequestDescriptor = $convert.base64Decode('Cg9TdWJ0b3BpY1JlcXVlc3QSNAoIc3VidG9waWMYASABKAsyGC5kZWVkZWUuc2VydmljZS5TdWJ0b3BpY1IIc3VidG9waWM=');
@$core.Deprecated('Use subtopicResponseDescriptor instead')
const SubtopicResponse$json = const {
  '1': 'SubtopicResponse',
  '2': const [
    const {'1': 'subtopic', '3': 1, '4': 3, '5': 11, '6': '.deedee.service.Subtopic', '10': 'subtopic'},
  ],
};

/// Descriptor for `SubtopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicResponseDescriptor = $convert.base64Decode('ChBTdWJ0b3BpY1Jlc3BvbnNlEjQKCHN1YnRvcGljGAEgAygLMhguZGVlZGVlLnNlcnZpY2UuU3VidG9waWNSCHN1YnRvcGlj');
@$core.Deprecated('Use topicDescriptor instead')
const Topic$json = const {
  '1': 'Topic',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 13, '10': 'topicId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'geolocation', '3': 4, '4': 1, '5': 11, '6': '.deedee.geolocation.Geolocation', '10': 'geolocation'},
  ],
};

/// Descriptor for `Topic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicDescriptor = $convert.base64Decode('CgVUb3BpYxIYCgd0b3BpY0lkGAEgASgNUgd0b3BpY0lkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRJBCgtnZW9sb2NhdGlvbhgEIAEoCzIfLmRlZWRlZS5nZW9sb2NhdGlvbi5HZW9sb2NhdGlvblILZ2VvbG9jYXRpb24=');
@$core.Deprecated('Use subtopicDescriptor instead')
const Subtopic$json = const {
  '1': 'Subtopic',
  '2': const [
    const {'1': 'subtopicId', '3': 1, '4': 1, '5': 13, '10': 'subtopicId'},
    const {'1': 'topicId', '3': 2, '4': 1, '5': 13, '10': 'topicId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.geolocation.Geolocation', '10': 'geolocation'},
  ],
};

/// Descriptor for `Subtopic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicDescriptor = $convert.base64Decode('CghTdWJ0b3BpYxIeCgpzdWJ0b3BpY0lkGAEgASgNUgpzdWJ0b3BpY0lkEhgKB3RvcGljSWQYAiABKA1SB3RvcGljSWQSFgoGdXNlcklkGAMgASgJUgZ1c2VySWQSFAoFdGl0bGUYBCABKAlSBXRpdGxlEkEKC2dlb2xvY2F0aW9uGAUgASgLMh8uZGVlZGVlLmdlb2xvY2F0aW9uLkdlb2xvY2F0aW9uUgtnZW9sb2NhdGlvbg==');
