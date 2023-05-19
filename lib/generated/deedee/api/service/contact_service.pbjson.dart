///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/service/contact_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = const {
  '1': 'ContactRequest',
  '2': const [
    const {'1': 'contact', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.contact.model.Contact', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode('Cg5Db250YWN0UmVxdWVzdBI7Cgdjb250YWN0GAEgASgLMiEuZGVlZGVlLmFwaS5jb250YWN0Lm1vZGVsLkNvbnRhY3RSB2NvbnRhY3Q=');
@$core.Deprecated('Use contactResponseDescriptor instead')
const ContactResponse$json = const {
  '1': 'ContactResponse',
  '2': const [
    const {'1': 'contacts', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.contact.model.Contact', '10': 'contacts'},
  ],
};

/// Descriptor for `ContactResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactResponseDescriptor = $convert.base64Decode('Cg9Db250YWN0UmVzcG9uc2USPQoIY29udGFjdHMYASADKAsyIS5kZWVkZWUuYXBpLmNvbnRhY3QubW9kZWwuQ29udGFjdFIIY29udGFjdHM=');
