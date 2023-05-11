///
//  Generated code. Do not modify.
//  source: deedee/api/service/location_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use locationRequestDescriptor instead')
const LocationRequest$json = const {
  '1': 'LocationRequest',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.location.model.Location', '10': 'location'},
  ],
};

/// Descriptor for `LocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationRequestDescriptor = $convert.base64Decode('Cg9Mb2NhdGlvblJlcXVlc3QSPwoIbG9jYXRpb24YASABKAsyIy5kZWVkZWUuYXBpLmxvY2F0aW9uLm1vZGVsLkxvY2F0aW9uUghsb2NhdGlvbg==');
@$core.Deprecated('Use locationResponseDescriptor instead')
const LocationResponse$json = const {
  '1': 'LocationResponse',
  '2': const [
    const {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.location.model.Location', '10': 'locations'},
  ],
};

/// Descriptor for `LocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationResponseDescriptor = $convert.base64Decode('ChBMb2NhdGlvblJlc3BvbnNlEkEKCWxvY2F0aW9ucxgBIAMoCzIjLmRlZWRlZS5hcGkubG9jYXRpb24ubW9kZWwuTG9jYXRpb25SCWxvY2F0aW9ucw==');
