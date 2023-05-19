///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/service/tag_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tagRequestDescriptor instead')
const TagRequest$json = const {
  '1': 'TagRequest',
  '2': const [
    const {'1': 'tag', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.tag.model.Tag', '10': 'tag'},
  ],
};

/// Descriptor for `TagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagRequestDescriptor = $convert.base64Decode('CgpUYWdSZXF1ZXN0EisKA3RhZxgBIAEoCzIZLmRlZWRlZS5hcGkudGFnLm1vZGVsLlRhZ1IDdGFn');
@$core.Deprecated('Use tagResponseDescriptor instead')
const TagResponse$json = const {
  '1': 'TagResponse',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.tag.model.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `TagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagResponseDescriptor = $convert.base64Decode('CgtUYWdSZXNwb25zZRItCgR0YWdzGAEgAygLMhkuZGVlZGVlLmFwaS50YWcubW9kZWwuVGFnUgR0YWdz');
