///
//  Generated code. Do not modify.
//  source: request_service_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use serviceRequestRequestDescriptor instead')
const ServiceRequestRequest$json = const {
  '1': 'ServiceRequestRequest',
  '2': const [
    const {'1': 'serviceRequest', '3': 1, '4': 1, '5': 11, '6': '.bucket.ServiceRequest', '10': 'serviceRequest'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'userId', '17': true},
  ],
  '8': const [
    const {'1': '_userId'},
  ],
};

/// Descriptor for `ServiceRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceRequestRequestDescriptor = $convert.base64Decode('ChVTZXJ2aWNlUmVxdWVzdFJlcXVlc3QSPgoOc2VydmljZVJlcXVlc3QYASABKAsyFi5idWNrZXQuU2VydmljZVJlcXVlc3RSDnNlcnZpY2VSZXF1ZXN0EhsKBnVzZXJJZBgCIAEoCUgAUgZ1c2VySWSIAQFCCQoHX3VzZXJJZA==');
@$core.Deprecated('Use serviceRequestResponseDescriptor instead')
const ServiceRequestResponse$json = const {
  '1': 'ServiceRequestResponse',
  '2': const [
    const {'1': 'serviceRequest', '3': 1, '4': 1, '5': 11, '6': '.bucket.ServiceRequest', '10': 'serviceRequest'},
  ],
};

/// Descriptor for `ServiceRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceRequestResponseDescriptor = $convert.base64Decode('ChZTZXJ2aWNlUmVxdWVzdFJlc3BvbnNlEj4KDnNlcnZpY2VSZXF1ZXN0GAEgASgLMhYuYnVja2V0LlNlcnZpY2VSZXF1ZXN0Ug5zZXJ2aWNlUmVxdWVzdA==');
@$core.Deprecated('Use serviceRequestsResponseDescriptor instead')
const ServiceRequestsResponse$json = const {
  '1': 'ServiceRequestsResponse',
  '2': const [
    const {'1': 'serviceRequests', '3': 1, '4': 3, '5': 11, '6': '.bucket.ServiceRequest', '10': 'serviceRequests'},
  ],
};

/// Descriptor for `ServiceRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceRequestsResponseDescriptor = $convert.base64Decode('ChdTZXJ2aWNlUmVxdWVzdHNSZXNwb25zZRJACg9zZXJ2aWNlUmVxdWVzdHMYASADKAsyFi5idWNrZXQuU2VydmljZVJlcXVlc3RSD3NlcnZpY2VSZXF1ZXN0cw==');
@$core.Deprecated('Use getTopicTitlesResponseDescriptor instead')
const GetTopicTitlesResponse$json = const {
  '1': 'GetTopicTitlesResponse',
  '2': const [
    const {'1': 'topicTitles', '3': 1, '4': 3, '5': 9, '10': 'topicTitles'},
  ],
};

/// Descriptor for `GetTopicTitlesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesResponseDescriptor = $convert.base64Decode('ChZHZXRUb3BpY1RpdGxlc1Jlc3BvbnNlEiAKC3RvcGljVGl0bGVzGAEgAygJUgt0b3BpY1RpdGxlcw==');
@$core.Deprecated('Use serviceRequestDescriptor instead')
const ServiceRequest$json = const {
  '1': 'ServiceRequest',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    const {'1': 'clientId', '3': 2, '4': 1, '5': 9, '10': 'clientId'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'dateOfRequest', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateOfRequest'},
    const {'1': 'price', '3': 6, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.bucket.ServiceRequest.Status', '10': 'status'},
  ],
  '4': const [ServiceRequest_Status$json],
};

@$core.Deprecated('Use serviceRequestDescriptor instead')
const ServiceRequest_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'ACCEPTED', '2': 1},
    const {'1': 'CHANGED', '2': 2},
    const {'1': 'DELETED', '2': 3},
    const {'1': 'IN_PROGRESS', '2': 4},
    const {'1': 'DONE', '2': 5},
  ],
};

/// Descriptor for `ServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceRequestDescriptor = $convert.base64Decode('Cg5TZXJ2aWNlUmVxdWVzdBIcCglyZXF1ZXN0SWQYASABKAlSCXJlcXVlc3RJZBIaCghjbGllbnRJZBgCIAEoCVIIY2xpZW50SWQSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEkAKDWRhdGVPZlJlcXVlc3QYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg1kYXRlT2ZSZXF1ZXN0EhQKBXByaWNlGAYgASgBUgVwcmljZRI1CgZzdGF0dXMYByABKA4yHS5idWNrZXQuU2VydmljZVJlcXVlc3QuU3RhdHVzUgZzdGF0dXMiWAoGU3RhdHVzEgsKB1BFTkRJTkcQABIMCghBQ0NFUFRFRBABEgsKB0NIQU5HRUQQAhILCgdERUxFVEVEEAMSDwoLSU5fUFJPR1JFU1MQBBIICgRET05FEAU=');
