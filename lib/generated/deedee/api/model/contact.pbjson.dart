///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/contact.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = const {
  '1': 'Contact',
  '2': const [
    const {'1': 'contactId', '3': 1, '4': 1, '5': 4, '10': 'contactId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.deedee.api.contact.model.Contact.Type', '10': 'type'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.deedee.api.contact.model.Contact.Status', '10': 'status'},
  ],
  '4': const [Contact_Type$json, Contact_Status$json],
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
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode('CgdDb250YWN0EhwKCWNvbnRhY3RJZBgBIAEoBFIJY29udGFjdElkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhQKBXZhbHVlGAMgASgJUgV2YWx1ZRI6CgR0eXBlGAQgASgOMiYuZGVlZGVlLmFwaS5jb250YWN0Lm1vZGVsLkNvbnRhY3QuVHlwZVIEdHlwZRJACgZzdGF0dXMYBSABKA4yKC5kZWVkZWUuYXBpLmNvbnRhY3QubW9kZWwuQ29udGFjdC5TdGF0dXNSBnN0YXR1cyJdCgRUeXBlEgkKBUVNQUlMEAASCQoFUEhPTkUQARINCglJTlNUQUdSQU0QAhIMCghXSEFUU0FQUBADEgwKCFRFTEVHUkFNEAQSDAoIRkFDRUJPT0sQBRIGCgJWSxAGIi0KBlN0YXR1cxIJCgVBRERFRBAAEgsKB1VQREFURUQQARILCgdERUxFVEVEEAI=');
