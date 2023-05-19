///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/service/observation_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use observationRequestDescriptor instead')
const ObservationRequest$json = const {
  '1': 'ObservationRequest',
  '2': const [
    const {'1': 'observation', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.statistic.model.Observation', '10': 'observation'},
  ],
};

/// Descriptor for `ObservationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List observationRequestDescriptor = $convert.base64Decode('ChJPYnNlcnZhdGlvblJlcXVlc3QSSQoLb2JzZXJ2YXRpb24YASABKAsyJy5kZWVkZWUuYXBpLnN0YXRpc3RpYy5tb2RlbC5PYnNlcnZhdGlvblILb2JzZXJ2YXRpb24=');
@$core.Deprecated('Use observationResponseDescriptor instead')
const ObservationResponse$json = const {
  '1': 'ObservationResponse',
  '2': const [
    const {'1': 'observations', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.statistic.model.Observation', '10': 'observations'},
  ],
};

/// Descriptor for `ObservationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List observationResponseDescriptor = $convert.base64Decode('ChNPYnNlcnZhdGlvblJlc3BvbnNlEksKDG9ic2VydmF0aW9ucxgBIAMoCzInLmRlZWRlZS5hcGkuc3RhdGlzdGljLm1vZGVsLk9ic2VydmF0aW9uUgxvYnNlcnZhdGlvbnM=');
