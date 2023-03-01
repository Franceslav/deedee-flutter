///
//  Generated code. Do not modify.
//  source: FilterService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use filterRequestDescriptor instead')
const FilterRequest$json = const {
  '1': 'FilterRequest',
  '2': const [
    const {
      '1': 'filter',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.topic.Filter',
      '10': 'filter'
    },
    const {
      '1': 'accountType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.topic.ACCOUNT_TYPE',
      '10': 'accountType'
    },
  ],
};

/// Descriptor for `FilterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterRequestDescriptor = $convert.base64Decode(
    'Cg1GaWx0ZXJSZXF1ZXN0EiUKBmZpbHRlchgBIAEoCzINLnRvcGljLkZpbHRlclIGZmlsdGVyEjUKC2FjY291bnRUeXBlGAIgASgOMhMudG9waWMuQUNDT1VOVF9UWVBFUgthY2NvdW50VHlwZQ==');
@$core.Deprecated('Use filterResponseDescriptor instead')
const FilterResponse$json = const {
  '1': 'FilterResponse',
  '2': const [
    const {
      '1': 'filter',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.topic.Filter',
      '10': 'filter'
    },
  ],
};

/// Descriptor for `FilterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterResponseDescriptor = $convert.base64Decode(
    'Cg5GaWx0ZXJSZXNwb25zZRIlCgZmaWx0ZXIYASABKAsyDS50b3BpYy5GaWx0ZXJSBmZpbHRlcg==');
@$core.Deprecated('Use getFilterKeysRequestDescriptor instead')
const GetFilterKeysRequest$json = const {
  '1': 'GetFilterKeysRequest',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 9, '10': 'topicId'},
  ],
};

/// Descriptor for `GetFilterKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysRequestDescriptor =
    $convert.base64Decode(
        'ChRHZXRGaWx0ZXJLZXlzUmVxdWVzdBIYCgd0b3BpY0lkGAEgASgJUgd0b3BpY0lk');
@$core.Deprecated('Use getFilterKeysResponseDescriptor instead')
const GetFilterKeysResponse$json = const {
  '1': 'GetFilterKeysResponse',
  '2': const [
    const {
      '1': 'filterKeys',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.topic.FilterKey',
      '10': 'filterKeys'
    },
  ],
};

/// Descriptor for `GetFilterKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFilterKeysResponseDescriptor = $convert.base64Decode(
    'ChVHZXRGaWx0ZXJLZXlzUmVzcG9uc2USMAoKZmlsdGVyS2V5cxgBIAMoCzIQLnRvcGljLkZpbHRlcktleVIKZmlsdGVyS2V5cw==');
@$core.Deprecated('Use getAllFiltersRequestDescriptor instead')
const GetAllFiltersRequest$json = const {
  '1': 'GetAllFiltersRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetAllFiltersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllFiltersRequestDescriptor =
    $convert.base64Decode(
        'ChRHZXRBbGxGaWx0ZXJzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use filterDescriptor instead')
const Filter$json = const {
  '1': 'Filter',
  '2': const [
    const {
      '1': 'filterId',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'filterId',
      '17': true
    },
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'topic', '3': 3, '4': 1, '5': 9, '10': 'topic'},
    const {
      '1': 'filterKeys',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.topic.FilterKey',
      '10': 'filterKeys'
    },
    const {'1': 'bookmarked', '3': 5, '4': 1, '5': 8, '10': 'bookmarked'},
    const {'1': 'subscribed', '3': 6, '4': 1, '5': 8, '10': 'subscribed'},
  ],
  '8': const [
    const {'1': '_filterId'},
  ],
};

/// Descriptor for `Filter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterDescriptor = $convert.base64Decode(
    'CgZGaWx0ZXISHwoIZmlsdGVySWQYASABKAlIAFIIZmlsdGVySWSIAQESFgoGdXNlcklkGAIgASgJUgZ1c2VySWQSFAoFdG9waWMYAyABKAlSBXRvcGljEjAKCmZpbHRlcktleXMYBCADKAsyEC50b3BpYy5GaWx0ZXJLZXlSCmZpbHRlcktleXMSHgoKYm9va21hcmtlZBgFIAEoCFIKYm9va21hcmtlZBIeCgpzdWJzY3JpYmVkGAYgASgIUgpzdWJzY3JpYmVkQgsKCV9maWx0ZXJJZA==');
@$core.Deprecated('Use filterKeyDescriptor instead')
const FilterKey$json = const {
  '1': 'FilterKey',
  '2': const [
    const {'1': 'topicId', '3': 1, '4': 1, '5': 9, '10': 'topicId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `FilterKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterKeyDescriptor = $convert.base64Decode(
    'CglGaWx0ZXJLZXkSGAoHdG9waWNJZBgBIAEoCVIHdG9waWNJZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGU=');
