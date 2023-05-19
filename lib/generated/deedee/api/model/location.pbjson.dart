///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/location.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use locationDescriptor instead')
const Location$json = const {
  '1': 'Location',
  '2': const [
    const {'1': 'locationId', '3': 1, '4': 1, '5': 4, '10': 'locationId'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode('CghMb2NhdGlvbhIeCgpsb2NhdGlvbklkGAEgASgEUgpsb2NhdGlvbklkEksKC2dlb2xvY2F0aW9uGAUgASgLMikuZGVlZGVlLmFwaS5nZW9sb2NhdGlvbi5tb2RlbC5HZW9sb2NhdGlvblILZ2VvbG9jYXRpb24SFAoFdGl0bGUYAyABKAlSBXRpdGxl');
