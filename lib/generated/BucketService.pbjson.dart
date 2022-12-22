///
//  Generated code. Do not modify.
//  source: BucketService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getTopicTitlesRequestDescriptor instead')
const GetTopicTitlesRequest$json = const {
  '1': 'GetTopicTitlesRequest',
  '2': const [
    const {'1': 'geoLocation', '3': 1, '4': 1, '5': 11, '6': '.bucket.GeoLocation', '10': 'geoLocation'},
  ],
};

/// Descriptor for `GetTopicTitlesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesRequestDescriptor = $convert.base64Decode('ChVHZXRUb3BpY1RpdGxlc1JlcXVlc3QSNQoLZ2VvTG9jYXRpb24YASABKAsyEy5idWNrZXQuR2VvTG9jYXRpb25SC2dlb0xvY2F0aW9u');
@$core.Deprecated('Use getTopicTitlesResponseDescriptor instead')
const GetTopicTitlesResponse$json = const {
  '1': 'GetTopicTitlesResponse',
  '2': const [
    const {'1': 'topicTitles', '3': 1, '4': 3, '5': 9, '10': 'topicTitles'},
  ],
};

/// Descriptor for `GetTopicTitlesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesResponseDescriptor = $convert.base64Decode('ChZHZXRUb3BpY1RpdGxlc1Jlc3BvbnNlEiAKC3RvcGljVGl0bGVzGAEgAygJUgt0b3BpY1RpdGxlcw==');
@$core.Deprecated('Use getBucketRequestDescriptor instead')
const GetBucketRequest$json = const {
  '1': 'GetBucketRequest',
  '2': const [
    const {'1': 'bucketId', '3': 1, '4': 1, '5': 9, '10': 'bucketId'},
    const {'1': 'tagType', '3': 2, '4': 1, '5': 14, '6': '.bucket.Tag.TYPE', '10': 'tagType'},
    const {'1': 'filters', '3': 3, '4': 3, '5': 9, '10': 'filters'},
  ],
};

/// Descriptor for `GetBucketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBucketRequestDescriptor = $convert.base64Decode('ChBHZXRCdWNrZXRSZXF1ZXN0EhoKCGJ1Y2tldElkGAEgASgJUghidWNrZXRJZBIqCgd0YWdUeXBlGAIgASgOMhAuYnVja2V0LlRhZy5UWVBFUgd0YWdUeXBlEhgKB2ZpbHRlcnMYAyADKAlSB2ZpbHRlcnM=');
@$core.Deprecated('Use getBucketResponseDescriptor instead')
const GetBucketResponse$json = const {
  '1': 'GetBucketResponse',
  '2': const [
    const {'1': 'bucket', '3': 1, '4': 1, '5': 11, '6': '.bucket.Bucket', '10': 'bucket'},
  ],
};

/// Descriptor for `GetBucketResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBucketResponseDescriptor = $convert.base64Decode('ChFHZXRCdWNrZXRSZXNwb25zZRImCgZidWNrZXQYASABKAsyDi5idWNrZXQuQnVja2V0UgZidWNrZXQ=');
@$core.Deprecated('Use placeTagRequestDescriptor instead')
const PlaceTagRequest$json = const {
  '1': 'PlaceTagRequest',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.bucket.Tag', '10': 'tag'},
    const {'1': 'filters', '3': 2, '4': 3, '5': 9, '10': 'filters'},
  ],
};

/// Descriptor for `PlaceTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeTagRequestDescriptor = $convert.base64Decode('Cg9QbGFjZVRhZ1JlcXVlc3QSHQoDdGFnGAEgASgLMgsuYnVja2V0LlRhZ1IDdGFnEhgKB2ZpbHRlcnMYAiADKAlSB2ZpbHRlcnM=');
@$core.Deprecated('Use placeTagResponseDescriptor instead')
const PlaceTagResponse$json = const {
  '1': 'PlaceTagResponse',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.bucket.Tag', '10': 'tag'},
  ],
};

/// Descriptor for `PlaceTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeTagResponseDescriptor = $convert.base64Decode('ChBQbGFjZVRhZ1Jlc3BvbnNlEh0KA3RhZxgBIAEoCzILLmJ1Y2tldC5UYWdSA3RhZw==');
@$core.Deprecated('Use getFilterKeysRequestDescriptor instead')
const GetFilterKeysRequest$json = const {
  '1': 'GetFilterKeysRequest',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
  ],
};

/// Descriptor for `GetFilterKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysRequestDescriptor = $convert.base64Decode('ChRHZXRGaWx0ZXJLZXlzUmVxdWVzdBIUCgV0b3BpYxgBIAEoCVIFdG9waWM=');
@$core.Deprecated('Use getFilterKeysResponseDescriptor instead')
const GetFilterKeysResponse$json = const {
  '1': 'GetFilterKeysResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.bucket.FilterKey', '10': 'items'},
  ],
};

/// Descriptor for `GetFilterKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysResponseDescriptor = $convert.base64Decode('ChVHZXRGaWx0ZXJLZXlzUmVzcG9uc2USJwoFaXRlbXMYASADKAsyES5idWNrZXQuRmlsdGVyS2V5UgVpdGVtcw==');
@$core.Deprecated('Use bucketDescriptor instead')
const Bucket$json = const {
  '1': 'Bucket',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.bucket.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `Bucket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bucketDescriptor = $convert.base64Decode('CgZCdWNrZXQSHwoEdGFncxgBIAMoCzILLmJ1Y2tldC5UYWdSBHRhZ3M=');
@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'bucketId', '3': 1, '4': 1, '5': 9, '10': 'bucketId'},
    const {'1': 'messengerId', '3': 3, '4': 1, '5': 9, '10': 'messengerId'},
    const {'1': 'geoLocation', '3': 4, '4': 1, '5': 11, '6': '.bucket.GeoLocation', '10': 'geoLocation'},
    const {'1': 'tagType', '3': 5, '4': 1, '5': 14, '6': '.bucket.Tag.TYPE', '10': 'tagType'},
    const {'1': 'dueDate', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
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
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode('CgNUYWcSGgoIYnVja2V0SWQYASABKAlSCGJ1Y2tldElkEiAKC21lc3NlbmdlcklkGAMgASgJUgttZXNzZW5nZXJJZBI1CgtnZW9Mb2NhdGlvbhgEIAEoCzITLmJ1Y2tldC5HZW9Mb2NhdGlvblILZ2VvTG9jYXRpb24SKgoHdGFnVHlwZRgFIAEoDjIQLmJ1Y2tldC5UYWcuVFlQRVIHdGFnVHlwZRI0CgdkdWVEYXRlGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZSIZCgRUWVBFEgcKA0JVWRAAEggKBFNFTEwQAQ==');
@$core.Deprecated('Use filterKeyDescriptor instead')
const FilterKey$json = const {
  '1': 'FilterKey',
  '2': const [
    const {'1': 'bucketId', '3': 1, '4': 1, '5': 9, '10': 'bucketId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `FilterKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterKeyDescriptor = $convert.base64Decode('CglGaWx0ZXJLZXkSGgoIYnVja2V0SWQYASABKAlSCGJ1Y2tldElkEhQKBXRpdGxlGAMgASgJUgV0aXRsZQ==');
@$core.Deprecated('Use geoLocationDescriptor instead')
const GeoLocation$json = const {
  '1': 'GeoLocation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `GeoLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geoLocationDescriptor = $convert.base64Decode('CgtHZW9Mb2NhdGlvbhIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIbGF0aXR1ZGUYAiABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgDIAEoAVIJbG9uZ2l0dWRl');
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
