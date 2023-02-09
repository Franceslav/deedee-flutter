///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verifyEmailRequestDescriptor instead')
const VerifyEmailRequest$json = const {
  '1': 'VerifyEmailRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'ipAddress', '3': 2, '4': 1, '5': 9, '10': 'ipAddress'},
  ],
};

/// Descriptor for `VerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailRequestDescriptor = $convert.base64Decode('ChJWZXJpZnlFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhwKCWlwQWRkcmVzcxgCIAEoCVIJaXBBZGRyZXNz');
@$core.Deprecated('Use verifyEmailResponseDescriptor instead')
const VerifyEmailResponse$json = const {
  '1': 'VerifyEmailResponse',
  '2': const [
    const {'1': 'processed', '3': 1, '4': 1, '5': 8, '10': 'processed'},
  ],
};

/// Descriptor for `VerifyEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailResponseDescriptor = $convert.base64Decode('ChNWZXJpZnlFbWFpbFJlc3BvbnNlEhwKCXByb2Nlc3NlZBgBIAEoCFIJcHJvY2Vzc2Vk');
@$core.Deprecated('Use verifyDocumentsRequestDescriptor instead')
const VerifyDocumentsRequest$json = const {
  '1': 'VerifyDocumentsRequest',
  '2': const [
    const {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.bucket.FileChunk', '10': 'files'},
  ],
};

/// Descriptor for `VerifyDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyDocumentsRequestDescriptor = $convert.base64Decode('ChZWZXJpZnlEb2N1bWVudHNSZXF1ZXN0EicKBWZpbGVzGAEgAygLMhEuYnVja2V0LkZpbGVDaHVua1IFZmlsZXM=');
@$core.Deprecated('Use verifyDocumentsResponseDescriptor instead')
const VerifyDocumentsResponse$json = const {
  '1': 'VerifyDocumentsResponse',
  '2': const [
    const {'1': 'processed', '3': 1, '4': 1, '5': 8, '10': 'processed'},
  ],
};

/// Descriptor for `VerifyDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyDocumentsResponseDescriptor = $convert.base64Decode('ChdWZXJpZnlEb2N1bWVudHNSZXNwb25zZRIcCglwcm9jZXNzZWQYASABKAhSCXByb2Nlc3NlZA==');
@$core.Deprecated('Use fileChunkDescriptor instead')
const FileChunk$json = const {
  '1': 'FileChunk',
  '2': const [
    const {'1': 'offset', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'offset', '17': true},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'data', '17': true},
  ],
  '8': const [
    const {'1': '_offset'},
    const {'1': '_data'},
  ],
};

/// Descriptor for `FileChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileChunkDescriptor = $convert.base64Decode('CglGaWxlQ2h1bmsSGwoGb2Zmc2V0GAEgASgDSABSBm9mZnNldIgBARIXCgRkYXRhGAIgASgMSAFSBGRhdGGIAQFCCQoHX29mZnNldEIHCgVfZGF0YQ==');
