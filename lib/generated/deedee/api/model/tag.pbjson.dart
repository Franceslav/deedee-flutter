///
//  Generated code. Do not modify.
//  source: deedee/api/model/tag.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'tagId', '3': 1, '4': 1, '5': 4, '10': 'tagId'},
    const {'1': 'createdBy', '3': 2, '4': 1, '5': 4, '10': 'createdBy'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'compositeFilter', '3': 4, '4': 1, '5': 11, '6': '.deedee.api.filter.model.CompositeFilter', '10': 'compositeFilter'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.deedee.api.tag.model.Tag.Type', '10': 'type'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.deedee.api.tag.model.Tag.Status', '10': 'status'},
  ],
  '4': const [Tag_Type$json, Tag_Status$json],
};

@$core.Deprecated('Use tagDescriptor instead')
const Tag_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'CLIENT', '2': 0},
    const {'1': 'SUPPLIER', '2': 1},
  ],
};

@$core.Deprecated('Use tagDescriptor instead')
const Tag_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'BOOKMARKED', '2': 0},
    const {'1': 'SUBSCRIBED', '2': 1},
    const {'1': 'PLACED', '2': 2},
    const {'1': 'CHANGED', '2': 3},
    const {'1': 'DELETED', '2': 4},
  ],
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode('CgNUYWcSFAoFdGFnSWQYASABKARSBXRhZ0lkEhwKCWNyZWF0ZWRCeRgCIAEoBFIJY3JlYXRlZEJ5EjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBJSCg9jb21wb3NpdGVGaWx0ZXIYBCABKAsyKC5kZWVkZWUuYXBpLmZpbHRlci5tb2RlbC5Db21wb3NpdGVGaWx0ZXJSD2NvbXBvc2l0ZUZpbHRlchJLCgtnZW9sb2NhdGlvbhgFIAEoCzIpLmRlZWRlZS5hcGkuZ2VvbG9jYXRpb24ubW9kZWwuR2VvbG9jYXRpb25SC2dlb2xvY2F0aW9uEjIKBHR5cGUYBiABKA4yHi5kZWVkZWUuYXBpLnRhZy5tb2RlbC5UYWcuVHlwZVIEdHlwZRI4CgZzdGF0dXMYByABKA4yIC5kZWVkZWUuYXBpLnRhZy5tb2RlbC5UYWcuU3RhdHVzUgZzdGF0dXMiIAoEVHlwZRIKCgZDTElFTlQQABIMCghTVVBQTElFUhABIk4KBlN0YXR1cxIOCgpCT09LTUFSS0VEEAASDgoKU1VCU0NSSUJFRBABEgoKBlBMQUNFRBACEgsKB0NIQU5HRUQQAxILCgdERUxFVEVEEAQ=');
