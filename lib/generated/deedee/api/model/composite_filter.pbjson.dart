///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/composite_filter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use compositeFilterDescriptor instead')
const CompositeFilter$json = const {
  '1': 'CompositeFilter',
  '2': const [
    const {'1': 'compositeFilterId', '3': 1, '4': 1, '5': 4, '10': 'compositeFilterId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'topic', '3': 3, '4': 1, '5': 11, '6': '.deedee.api.topic.model.Topic', '10': 'topic'},
    const {'1': 'filterMap', '3': 4, '4': 3, '5': 11, '6': '.deedee.api.compositefilter.model.CompositeFilter.FilterMapEntry', '10': 'filterMap'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.deedee.api.compositefilter.model.CompositeFilter.Status', '10': 'status'},
    const {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
  ],
  '3': const [CompositeFilter_FilterMapEntry$json],
  '4': const [CompositeFilter_Status$json],
};

@$core.Deprecated('Use compositeFilterDescriptor instead')
const CompositeFilter_FilterMapEntry$json = const {
  '1': 'FilterMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.deedee.api.compositefilter.model.FilterKeyList', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use compositeFilterDescriptor instead')
const CompositeFilter_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'FAVORITE', '2': 0},
    const {'1': 'CHANGED', '2': 2},
    const {'1': 'DELETED', '2': 3},
  ],
};

/// Descriptor for `CompositeFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compositeFilterDescriptor = $convert.base64Decode('Cg9Db21wb3NpdGVGaWx0ZXISLAoRY29tcG9zaXRlRmlsdGVySWQYASABKARSEWNvbXBvc2l0ZUZpbHRlcklkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEjMKBXRvcGljGAMgASgLMh0uZGVlZGVlLmFwaS50b3BpYy5tb2RlbC5Ub3BpY1IFdG9waWMSXgoJZmlsdGVyTWFwGAQgAygLMkAuZGVlZGVlLmFwaS5jb21wb3NpdGVmaWx0ZXIubW9kZWwuQ29tcG9zaXRlRmlsdGVyLkZpbHRlck1hcEVudHJ5UglmaWx0ZXJNYXASUAoGc3RhdHVzGAUgASgOMjguZGVlZGVlLmFwaS5jb21wb3NpdGVmaWx0ZXIubW9kZWwuQ29tcG9zaXRlRmlsdGVyLlN0YXR1c1IGc3RhdHVzEhQKBXRpdGxlGAYgASgJUgV0aXRsZRptCg5GaWx0ZXJNYXBFbnRyeRIQCgNrZXkYASABKAlSA2tleRJFCgV2YWx1ZRgCIAEoCzIvLmRlZWRlZS5hcGkuY29tcG9zaXRlZmlsdGVyLm1vZGVsLkZpbHRlcktleUxpc3RSBXZhbHVlOgI4ASIwCgZTdGF0dXMSDAoIRkFWT1JJVEUQABILCgdDSEFOR0VEEAISCwoHREVMRVRFRBAD');
@$core.Deprecated('Use filterKeyListDescriptor instead')
const FilterKeyList$json = const {
  '1': 'FilterKeyList',
  '2': const [
    const {'1': 'filterKeys', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.compositefilter.model.FilterKey', '10': 'filterKeys'},
  ],
};

/// Descriptor for `FilterKeyList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterKeyListDescriptor = $convert.base64Decode('Cg1GaWx0ZXJLZXlMaXN0EksKCmZpbHRlcktleXMYASADKAsyKy5kZWVkZWUuYXBpLmNvbXBvc2l0ZWZpbHRlci5tb2RlbC5GaWx0ZXJLZXlSCmZpbHRlcktleXM=');
@$core.Deprecated('Use filterKeyDescriptor instead')
const FilterKey$json = const {
  '1': 'FilterKey',
  '2': const [
    const {'1': 'filterKeyId', '3': 1, '4': 1, '5': 9, '10': 'filterKeyId'},
    const {'1': 'subtopicId', '3': 2, '4': 1, '5': 9, '10': 'subtopicId'},
    const {'1': 'topicId', '3': 3, '4': 1, '5': 9, '10': 'topicId'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'selected', '3': 5, '4': 1, '5': 8, '10': 'selected'},
  ],
};

/// Descriptor for `FilterKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterKeyDescriptor = $convert.base64Decode('CglGaWx0ZXJLZXkSIAoLZmlsdGVyS2V5SWQYASABKAlSC2ZpbHRlcktleUlkEh4KCnN1YnRvcGljSWQYAiABKAlSCnN1YnRvcGljSWQSGAoHdG9waWNJZBgDIAEoCVIHdG9waWNJZBIUCgV0aXRsZRgEIAEoCVIFdGl0bGUSGgoIc2VsZWN0ZWQYBSABKAhSCHNlbGVjdGVk');
