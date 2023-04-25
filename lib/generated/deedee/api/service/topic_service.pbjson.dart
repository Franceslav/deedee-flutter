///
//  Generated code. Do not modify.
//  source: deedee/api/service/topic_service.proto
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
    const {'1': 'topic', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.topic.model.Topic', '9': 0, '10': 'topic', '17': true},
  ],
  '8': const [
    const {'1': '_topic'},
  ],
};

/// Descriptor for `TopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicRequestDescriptor = $convert.base64Decode('CgxUb3BpY1JlcXVlc3QSOAoFdG9waWMYASABKAsyHS5kZWVkZWUuYXBpLnRvcGljLm1vZGVsLlRvcGljSABSBXRvcGljiAEBQggKBl90b3BpYw==');
@$core.Deprecated('Use topicResponseDescriptor instead')
const TopicResponse$json = const {
  '1': 'TopicResponse',
  '2': const [
    const {'1': 'topics', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.topic.model.Topic', '10': 'topics'},
  ],
};

/// Descriptor for `TopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicResponseDescriptor = $convert.base64Decode('Cg1Ub3BpY1Jlc3BvbnNlEjUKBnRvcGljcxgBIAMoCzIdLmRlZWRlZS5hcGkudG9waWMubW9kZWwuVG9waWNSBnRvcGljcw==');
@$core.Deprecated('Use subtopicRequestDescriptor instead')
const SubtopicRequest$json = const {
  '1': 'SubtopicRequest',
  '2': const [
    const {'1': 'subtopic', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.topic.model.Subtopic', '9': 0, '10': 'subtopic', '17': true},
  ],
  '8': const [
    const {'1': '_subtopic'},
  ],
};

/// Descriptor for `SubtopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicRequestDescriptor = $convert.base64Decode('Cg9TdWJ0b3BpY1JlcXVlc3QSQQoIc3VidG9waWMYASABKAsyIC5kZWVkZWUuYXBpLnRvcGljLm1vZGVsLlN1YnRvcGljSABSCHN1YnRvcGljiAEBQgsKCV9zdWJ0b3BpYw==');
@$core.Deprecated('Use subtopicResponseDescriptor instead')
const SubtopicResponse$json = const {
  '1': 'SubtopicResponse',
  '2': const [
    const {'1': 'subtopics', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.topic.model.Subtopic', '10': 'subtopics'},
  ],
};

/// Descriptor for `SubtopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtopicResponseDescriptor = $convert.base64Decode('ChBTdWJ0b3BpY1Jlc3BvbnNlEj4KCXN1YnRvcGljcxgBIAMoCzIgLmRlZWRlZS5hcGkudG9waWMubW9kZWwuU3VidG9waWNSCXN1YnRvcGljcw==');
