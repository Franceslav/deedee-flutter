///
//  Generated code. Do not modify.
//  source: deedee/api/model/service_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use serviceRequestDescriptor instead')
const ServiceRequest$json = const {
  '1': 'ServiceRequest',
  '2': const [
    const {'1': 'serviceRequestId', '3': 1, '4': 1, '5': 4, '10': 'serviceRequestId'},
    const {'1': 'createdFor', '3': 2, '4': 1, '5': 9, '10': 'createdFor'},
    const {'1': 'createdBy', '3': 3, '4': 1, '5': 9, '10': 'createdBy'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'createdAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'geolocation', '3': 6, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
    const {'1': 'price', '3': 7, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'status', '3': 8, '4': 1, '5': 14, '6': '.deedee.api.servicerequest.model.ServiceRequest.Status', '10': 'status'},
    const {'1': 'tagId', '3': 9, '4': 1, '5': 4, '10': 'tagId'},
  ],
  '4': const [ServiceRequest_Status$json],
};

@$core.Deprecated('Use serviceRequestDescriptor instead')
const ServiceRequest_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'ACCEPTED', '2': 1},
    const {'1': 'MODIFIED', '2': 2},
    const {'1': 'DELETED', '2': 3},
    const {'1': 'IN_PROGRESS', '2': 4},
    const {'1': 'DONE', '2': 5},
    const {'1': 'CHANGED', '2': 6},
    const {'1': 'DECLINED', '2': 7},
  ],
};

/// Descriptor for `ServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceRequestDescriptor = $convert.base64Decode('Cg5TZXJ2aWNlUmVxdWVzdBIqChBzZXJ2aWNlUmVxdWVzdElkGAEgASgEUhBzZXJ2aWNlUmVxdWVzdElkEh4KCmNyZWF0ZWRGb3IYAiABKAlSCmNyZWF0ZWRGb3ISHAoJY3JlYXRlZEJ5GAMgASgJUgljcmVhdGVkQnkSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEjgKCWNyZWF0ZWRBdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBJLCgtnZW9sb2NhdGlvbhgGIAEoCzIpLmRlZWRlZS5hcGkuZ2VvbG9jYXRpb24ubW9kZWwuR2VvbG9jYXRpb25SC2dlb2xvY2F0aW9uEhQKBXByaWNlGAcgASgBUgVwcmljZRJOCgZzdGF0dXMYCCABKA4yNi5kZWVkZWUuYXBpLnNlcnZpY2VyZXF1ZXN0Lm1vZGVsLlNlcnZpY2VSZXF1ZXN0LlN0YXR1c1IGc3RhdHVzEhQKBXRhZ0lkGAkgASgEUgV0YWdJZCJ0CgZTdGF0dXMSCwoHUEVORElORxAAEgwKCEFDQ0VQVEVEEAESDAoITU9ESUZJRUQQAhILCgdERUxFVEVEEAMSDwoLSU5fUFJPR1JFU1MQBBIICgRET05FEAUSCwoHQ0hBTkdFRBAGEgwKCERFQ0xJTkVEEAc=');
