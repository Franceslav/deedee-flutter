///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/observation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use observationDescriptor instead')
const Observation$json = const {
  '1': 'Observation',
  '2': const [
    const {'1': 'observationId', '3': 1, '4': 1, '5': 4, '10': 'observationId'},
    const {'1': 'tagId', '3': 2, '4': 1, '5': 4, '10': 'tagId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 4, '10': 'userId'},
    const {'1': 'geolocation', '3': 4, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
  ],
};

/// Descriptor for `Observation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List observationDescriptor = $convert.base64Decode('CgtPYnNlcnZhdGlvbhIkCg1vYnNlcnZhdGlvbklkGAEgASgEUg1vYnNlcnZhdGlvbklkEhQKBXRhZ0lkGAIgASgEUgV0YWdJZBIWCgZ1c2VySWQYAyABKARSBnVzZXJJZBJLCgtnZW9sb2NhdGlvbhgEIAEoCzIpLmRlZWRlZS5hcGkuZ2VvbG9jYXRpb24ubW9kZWwuR2VvbG9jYXRpb25SC2dlb2xvY2F0aW9u');
