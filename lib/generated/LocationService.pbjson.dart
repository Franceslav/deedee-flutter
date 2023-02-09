///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getPlacesRequestDescriptor instead')
const GetPlacesRequest$json = const {
  '1': 'GetPlacesRequest',
  '2': const [
    const {'1': 'geoLocation', '3': 1, '4': 1, '5': 11, '6': '.bucket.GeoLocation', '10': 'geoLocation'},
    const {'1': 'radius', '3': 2, '4': 1, '5': 1, '10': 'radius'},
  ],
};

/// Descriptor for `GetPlacesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlacesRequestDescriptor = $convert.base64Decode('ChBHZXRQbGFjZXNSZXF1ZXN0EjUKC2dlb0xvY2F0aW9uGAEgASgLMhMuYnVja2V0Lkdlb0xvY2F0aW9uUgtnZW9Mb2NhdGlvbhIWCgZyYWRpdXMYAiABKAFSBnJhZGl1cw==');
@$core.Deprecated('Use getPlacesResponseDescriptor instead')
const GetPlacesResponse$json = const {
  '1': 'GetPlacesResponse',
  '2': const [
    const {'1': 'places', '3': 1, '4': 3, '5': 11, '6': '.bucket.Place', '10': 'places'},
  ],
};

/// Descriptor for `GetPlacesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlacesResponseDescriptor = $convert.base64Decode('ChFHZXRQbGFjZXNSZXNwb25zZRIlCgZwbGFjZXMYASADKAsyDS5idWNrZXQuUGxhY2VSBnBsYWNlcw==');
@$core.Deprecated('Use placeDescriptor instead')
const Place$json = const {
  '1': 'Place',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'GeoLocation', '3': 2, '4': 1, '5': 9, '10': 'GeoLocation'},
  ],
};

/// Descriptor for `Place`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDescriptor = $convert.base64Decode('CgVQbGFjZRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLR2VvTG9jYXRpb24YAiABKAlSC0dlb0xvY2F0aW9u');
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
