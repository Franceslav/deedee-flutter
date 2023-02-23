///
//  Generated code. Do not modify.
//  source: TagService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getUserTagsRequestDescriptor instead')
const GetUserTagsRequest$json = const {
  '1': 'GetUserTagsRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagsRequestDescriptor = $convert.base64Decode('ChJHZXRVc2VyVGFnc1JlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use getUserTagsResponseDescriptor instead')
const GetUserTagsResponse$json = const {
  '1': 'GetUserTagsResponse',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.topic.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `GetUserTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagsResponseDescriptor = $convert.base64Decode('ChNHZXRVc2VyVGFnc1Jlc3BvbnNlEh4KBHRhZ3MYASADKAsyCi50b3BpYy5UYWdSBHRhZ3M=');
@$core.Deprecated('Use userTagRequestDescriptor instead')
const UserTagRequest$json = const {
  '1': 'UserTagRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'tagId', '3': 2, '4': 1, '5': 9, '10': 'tagId'},
  ],
};

/// Descriptor for `UserTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTagRequestDescriptor = $convert.base64Decode('Cg5Vc2VyVGFnUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIUCgV0YWdJZBgCIAEoCVIFdGFnSWQ=');
@$core.Deprecated('Use userTagResponseDescriptor instead')
const UserTagResponse$json = const {
  '1': 'UserTagResponse',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.topic.Tag', '10': 'tag'},
  ],
};

/// Descriptor for `UserTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTagResponseDescriptor = $convert.base64Decode('Cg9Vc2VyVGFnUmVzcG9uc2USHAoDdGFnGAEgASgLMgoudG9waWMuVGFnUgN0YWc=');
@$core.Deprecated('Use getUserTagDetailsRequestDescriptor instead')
const GetUserTagDetailsRequest$json = const {
  '1': 'GetUserTagDetailsRequest',
  '2': const [
    const {'1': 'tagId', '3': 1, '4': 1, '5': 9, '10': 'tagId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserTagDetailsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagDetailsRequestDescriptor = $convert.base64Decode('ChhHZXRVc2VyVGFnRGV0YWlsc1JlcXVlc3QSFAoFdGFnSWQYASABKAlSBXRhZ0lkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklk');
@$core.Deprecated('Use getUserTagDetailsResponseDescriptor instead')
const GetUserTagDetailsResponse$json = const {
  '1': 'GetUserTagDetailsResponse',
  '2': const [
    const {'1': 'tagId', '3': 1, '4': 1, '5': 9, '10': 'tagId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserTagDetailsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagDetailsResponseDescriptor = $convert.base64Decode('ChlHZXRVc2VyVGFnRGV0YWlsc1Jlc3BvbnNlEhQKBXRhZ0lkGAEgASgJUgV0YWdJZBIWCgZ1c2VySWQYAiABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use tagToBookmarkRequestDescriptor instead')
const TagToBookmarkRequest$json = const {
  '1': 'TagToBookmarkRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'tagId', '3': 2, '4': 1, '5': 9, '10': 'tagId'},
  ],
};

/// Descriptor for `TagToBookmarkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagToBookmarkRequestDescriptor = $convert.base64Decode('ChRUYWdUb0Jvb2ttYXJrUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIUCgV0YWdJZBgCIAEoCVIFdGFnSWQ=');
@$core.Deprecated('Use tagToBookmarkResponseDescriptor instead')
const TagToBookmarkResponse$json = const {
  '1': 'TagToBookmarkResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `TagToBookmarkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagToBookmarkResponseDescriptor = $convert.base64Decode('ChVUYWdUb0Jvb2ttYXJrUmVzcG9uc2USGAoHc3VjY2VlZBgBIAEoCFIHc3VjY2VlZA==');
@$core.Deprecated('Use getBookmarkTagsRequestDescriptor instead')
const GetBookmarkTagsRequest$json = const {
  '1': 'GetBookmarkTagsRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetBookmarkTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBookmarkTagsRequestDescriptor = $convert.base64Decode('ChZHZXRCb29rbWFya1RhZ3NSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklk');
@$core.Deprecated('Use getBookmarkTagsResponseDescriptor instead')
const GetBookmarkTagsResponse$json = const {
  '1': 'GetBookmarkTagsResponse',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.topic.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `GetBookmarkTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBookmarkTagsResponseDescriptor = $convert.base64Decode('ChdHZXRCb29rbWFya1RhZ3NSZXNwb25zZRIeCgR0YWdzGAEgAygLMgoudG9waWMuVGFnUgR0YWdz');
@$core.Deprecated('Use getTopicRequestDescriptor instead')
const GetTopicRequest$json = const {
  '1': 'GetTopicRequest',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 9, '10': 'topicId'},
    const {'1': 'tagType', '3': 2, '4': 1, '5': 14, '6': '.topic.Tag.TYPE', '10': 'tagType'},
    const {'1': 'filters', '3': 3, '4': 3, '5': 9, '10': 'filters'},
  ],
};

/// Descriptor for `GetTopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicRequestDescriptor = $convert.base64Decode('Cg9HZXRUb3BpY1JlcXVlc3QSGAoHdG9waWNJZBgBIAEoCVIHdG9waWNJZBIpCgd0YWdUeXBlGAIgASgOMg8udG9waWMuVGFnLlRZUEVSB3RhZ1R5cGUSGAoHZmlsdGVycxgDIAMoCVIHZmlsdGVycw==');
@$core.Deprecated('Use getTopicResponseDescriptor instead')
const GetTopicResponse$json = const {
  '1': 'GetTopicResponse',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 11, '6': '.topic.Topic', '10': 'topic'},
  ],
};

/// Descriptor for `GetTopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicResponseDescriptor = $convert.base64Decode('ChBHZXRUb3BpY1Jlc3BvbnNlEiIKBXRvcGljGAEgASgLMgwudG9waWMuVG9waWNSBXRvcGlj');
@$core.Deprecated('Use placeTagRequestDescriptor instead')
const PlaceTagRequest$json = const {
  '1': 'PlaceTagRequest',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.topic.Tag', '10': 'tag'},
    const {'1': 'filters', '3': 2, '4': 3, '5': 9, '10': 'filters'},
  ],
};

/// Descriptor for `PlaceTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeTagRequestDescriptor = $convert.base64Decode('Cg9QbGFjZVRhZ1JlcXVlc3QSHAoDdGFnGAEgASgLMgoudG9waWMuVGFnUgN0YWcSGAoHZmlsdGVycxgCIAMoCVIHZmlsdGVycw==');
@$core.Deprecated('Use placeTagResponseDescriptor instead')
const PlaceTagResponse$json = const {
  '1': 'PlaceTagResponse',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.topic.Tag', '10': 'tag'},
  ],
};

/// Descriptor for `PlaceTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeTagResponseDescriptor = $convert.base64Decode('ChBQbGFjZVRhZ1Jlc3BvbnNlEhwKA3RhZxgBIAEoCzIKLnRvcGljLlRhZ1IDdGFn');
@$core.Deprecated('Use getFilterKeysRequestDescriptor instead')
const GetFilterKeysRequest$json = const {
  '1': 'GetFilterKeysRequest',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 9, '10': 'topicId'},
  ],
};

/// Descriptor for `GetFilterKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysRequestDescriptor = $convert.base64Decode('ChRHZXRGaWx0ZXJLZXlzUmVxdWVzdBIYCgd0b3BpY0lkGAEgASgJUgd0b3BpY0lk');
@$core.Deprecated('Use getFilterKeysResponseDescriptor instead')
const GetFilterKeysResponse$json = const {
  '1': 'GetFilterKeysResponse',
  '2': const [
    const {'1': 'filterKeys', '3': 1, '4': 3, '5': 11, '6': '.topic.FilterKey', '10': 'filterKeys'},
  ],
};

/// Descriptor for `GetFilterKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysResponseDescriptor = $convert.base64Decode('ChVHZXRGaWx0ZXJLZXlzUmVzcG9uc2USMAoKZmlsdGVyS2V5cxgBIAMoCzIQLnRvcGljLkZpbHRlcktleVIKZmlsdGVyS2V5cw==');
@$core.Deprecated('Use topicDescriptor instead')
const Topic$json = const {
  '1': 'Topic',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.topic.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `Topic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topicDescriptor = $convert.base64Decode('CgVUb3BpYxIeCgR0YWdzGAEgAygLMgoudG9waWMuVGFnUgR0YWdz');
@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'tagId', '3': 1, '4': 1, '5': 9, '10': 'tagId'},
    const {'1': 'topicId', '3': 2, '4': 1, '5': 9, '10': 'topicId'},
    const {'1': 'messengerId', '3': 3, '4': 1, '5': 9, '10': 'messengerId'},
    const {'1': 'geoLocation', '3': 4, '4': 1, '5': 11, '6': '.topic.GeoLocation', '10': 'geoLocation'},
    const {'1': 'tagType', '3': 5, '4': 1, '5': 14, '6': '.topic.Tag.TYPE', '10': 'tagType'},
    const {'1': 'dueDate', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
    const {'1': 'isDeleted', '3': 7, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
  '4': const [Tag_TYPE$json],
};

@$core.Deprecated('Use tagDescriptor instead')
const Tag_TYPE$json = const {
  '1': 'TYPE',
  '2': const [
    const {'1': 'BUY', '2': 0},
    const {'1': 'SELL', '2': 1},
  ],
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode('CgNUYWcSFAoFdGFnSWQYASABKAlSBXRhZ0lkEhgKB3RvcGljSWQYAiABKAlSB3RvcGljSWQSIAoLbWVzc2VuZ2VySWQYAyABKAlSC21lc3NlbmdlcklkEjQKC2dlb0xvY2F0aW9uGAQgASgLMhIudG9waWMuR2VvTG9jYXRpb25SC2dlb0xvY2F0aW9uEikKB3RhZ1R5cGUYBSABKA4yDy50b3BpYy5UYWcuVFlQRVIHdGFnVHlwZRI0CgdkdWVEYXRlGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZRIcCglpc0RlbGV0ZWQYByABKAhSCWlzRGVsZXRlZCIZCgRUWVBFEgcKA0JVWRAAEggKBFNFTEwQAQ==');
@$core.Deprecated('Use tagDetailsDescriptor instead')
const TagDetails$json = const {
  '1': 'TagDetails',
  '2': const [
    const {'1': 'tagId', '3': 1, '4': 1, '5': 9, '10': 'tagId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
    const {'1': 'timetable', '3': 4, '4': 1, '5': 9, '10': 'timetable'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `TagDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDetailsDescriptor = $convert.base64Decode('CgpUYWdEZXRhaWxzEhQKBXRhZ0lkGAEgASgJUgV0YWdJZBIWCgZ1c2VySWQYAiABKAlSBnVzZXJJZBIUCgVwcmljZRgDIAEoCVIFcHJpY2USHAoJdGltZXRhYmxlGAQgASgJUgl0aW1ldGFibGUSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use filterKeyDescriptor instead')
const FilterKey$json = const {
  '1': 'FilterKey',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 9, '10': 'topicId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `FilterKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterKeyDescriptor = $convert.base64Decode('CglGaWx0ZXJLZXkSGAoHdG9waWNJZBgBIAEoCVIHdG9waWNJZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGU=');
@$core.Deprecated('Use verifyAuthCodeRequestDescriptor instead')
const VerifyAuthCodeRequest$json = const {
  '1': 'VerifyAuthCodeRequest',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyAuthCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyAuthCodeRequestDescriptor = $convert.base64Decode('ChVWZXJpZnlBdXRoQ29kZVJlcXVlc3QSEgoEY29kZRgBIAEoCVIEY29kZQ==');
@$core.Deprecated('Use verifyAuthCodeResponseDescriptor instead')
const VerifyAuthCodeResponse$json = const {
  '1': 'VerifyAuthCodeResponse',
  '2': const [
    const {'1': 'authenticated', '3': 1, '4': 1, '5': 8, '10': 'authenticated'},
  ],
};

/// Descriptor for `VerifyAuthCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyAuthCodeResponseDescriptor = $convert.base64Decode('ChZWZXJpZnlBdXRoQ29kZVJlc3BvbnNlEiQKDWF1dGhlbnRpY2F0ZWQYASABKAhSDWF1dGhlbnRpY2F0ZWQ=');
@$core.Deprecated('Use getTopicTitlesRequestDescriptor instead')
const GetTopicTitlesRequest$json = const {
  '1': 'GetTopicTitlesRequest',
  '2': const [
    const {'1': 'geoLocation', '3': 1, '4': 1, '5': 11, '6': '.topic.GeoLocation', '10': 'geoLocation'},
  ],
};

/// Descriptor for `GetTopicTitlesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesRequestDescriptor = $convert.base64Decode('ChVHZXRUb3BpY1RpdGxlc1JlcXVlc3QSNAoLZ2VvTG9jYXRpb24YASABKAsyEi50b3BpYy5HZW9Mb2NhdGlvblILZ2VvTG9jYXRpb24=');
@$core.Deprecated('Use getTopicTitlesResponseDescriptor instead')
const GetTopicTitlesResponse$json = const {
  '1': 'GetTopicTitlesResponse',
  '2': const [
    const {'1': 'topicTitles', '3': 1, '4': 3, '5': 9, '10': 'topicTitles'},
  ],
};

/// Descriptor for `GetTopicTitlesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesResponseDescriptor = $convert.base64Decode('ChZHZXRUb3BpY1RpdGxlc1Jlc3BvbnNlEiAKC3RvcGljVGl0bGVzGAEgAygJUgt0b3BpY1RpdGxlcw==');
