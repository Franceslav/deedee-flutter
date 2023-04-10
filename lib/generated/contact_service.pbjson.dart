///
//  Generated code. Do not modify.
//  source: contact_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = const {
  '1': 'ContactRequest',
  '2': const [
    const {'1': 'contact', '3': 1, '4': 1, '5': 11, '6': '.bucket.Contact', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode('Cg5Db250YWN0UmVxdWVzdBIpCgdjb250YWN0GAEgASgLMg8uYnVja2V0LkNvbnRhY3RSB2NvbnRhY3Q=');
@$core.Deprecated('Use contactResponseDescriptor instead')
const ContactResponse$json = const {
  '1': 'ContactResponse',
  '2': const [
    const {'1': 'contact', '3': 1, '4': 1, '5': 11, '6': '.bucket.Contact', '10': 'contact'},
  ],
};

/// Descriptor for `ContactResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactResponseDescriptor = $convert.base64Decode('Cg9Db250YWN0UmVzcG9uc2USKQoHY29udGFjdBgBIAEoCzIPLmJ1Y2tldC5Db250YWN0Ugdjb250YWN0');
@$core.Deprecated('Use getTopicTitlesResponseDescriptor instead')
const GetTopicTitlesResponse$json = const {
  '1': 'GetTopicTitlesResponse',
  '2': const [
    const {'1': 'topicTitles', '3': 1, '4': 3, '5': 9, '10': 'topicTitles'},
  ],
};

/// Descriptor for `GetTopicTitlesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopicTitlesResponseDescriptor = $convert.base64Decode('ChZHZXRUb3BpY1RpdGxlc1Jlc3BvbnNlEiAKC3RvcGljVGl0bGVzGAEgAygJUgt0b3BpY1RpdGxlcw==');
@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = const {
  '1': 'Contact',
  '2': const [
    const {'1': 'contactId', '3': 1, '4': 1, '5': 4, '10': 'contactId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.bucket.Contact.Type', '10': 'type'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.bucket.Contact.Status', '9': 0, '10': 'status', '17': true},
  ],
  '4': const [Contact_Type$json, Contact_Status$json],
  '8': const [
    const {'1': '_status'},
  ],
};

@$core.Deprecated('Use contactDescriptor instead')
const Contact_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'EMAIL', '2': 0},
    const {'1': 'PHONE', '2': 1},
    const {'1': 'INSTAGRAM', '2': 2},
    const {'1': 'WHATSAPP', '2': 3},
    const {'1': 'TELEGRAM', '2': 4},
    const {'1': 'FACEBOOK', '2': 5},
    const {'1': 'VK', '2': 6},
  ],
};

@$core.Deprecated('Use contactDescriptor instead')
const Contact_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ADDED', '2': 0},
    const {'1': 'UPDATED', '2': 1},
    const {'1': 'DELETED', '2': 2},
  ],
};

/// Descriptor for `Contact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode('CgdDb250YWN0EhwKCWNvbnRhY3RJZBgBIAEoBFIJY29udGFjdElkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhQKBXZhbHVlGAMgASgJUgV2YWx1ZRIoCgR0eXBlGAQgASgOMhQuYnVja2V0LkNvbnRhY3QuVHlwZVIEdHlwZRIzCgZzdGF0dXMYBSABKA4yFi5idWNrZXQuQ29udGFjdC5TdGF0dXNIAFIGc3RhdHVziAEBIl0KBFR5cGUSCQoFRU1BSUwQABIJCgVQSE9ORRABEg0KCUlOU1RBR1JBTRACEgwKCFdIQVRTQVBQEAMSDAoIVEVMRUdSQU0QBBIMCghGQUNFQk9PSxAFEgYKAlZLEAYiLQoGU3RhdHVzEgkKBUFEREVEEAASCwoHVVBEQVRFRBABEgsKB0RFTEVURUQQAkIJCgdfc3RhdHVz');
