///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/geolocation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use geolocationDescriptor instead')
const Geolocation$json = const {
  '1': 'Geolocation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `Geolocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geolocationDescriptor = $convert.base64Decode('CgtHZW9sb2NhdGlvbhIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIbGF0aXR1ZGUYAiABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgDIAEoAVIJbG9uZ2l0dWRl');
