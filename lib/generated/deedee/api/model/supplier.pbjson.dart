///
//  Generated code. Do not modify.
//  source: deedee/api/model/supplier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use supplierDescriptor instead')
const Supplier$json = const {
  '1': 'Supplier',
  '2': const [
    const {'1': 'supplierId', '3': 1, '4': 1, '5': 4, '10': 'supplierId'},
    const {'1': 'createdBy', '3': 2, '4': 1, '5': 4, '10': 'createdBy'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'geolocation', '3': 5, '4': 1, '5': 11, '6': '.deedee.api.geolocation.model.Geolocation', '10': 'geolocation'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.deedee.api.supplier.model.Supplier.Status', '10': 'status'},
  ],
  '4': const [Supplier_Status$json],
};

@$core.Deprecated('Use supplierDescriptor instead')
const Supplier_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'SUSPENDED', '2': 1},
    const {'1': 'DELETED', '2': 2},
  ],
};

/// Descriptor for `Supplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierDescriptor = $convert.base64Decode('CghTdXBwbGllchIeCgpzdXBwbGllcklkGAEgASgEUgpzdXBwbGllcklkEhwKCWNyZWF0ZWRCeRgCIAEoBFIJY3JlYXRlZEJ5EjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBJLCgtnZW9sb2NhdGlvbhgFIAEoCzIpLmRlZWRlZS5hcGkuZ2VvbG9jYXRpb24ubW9kZWwuR2VvbG9jYXRpb25SC2dlb2xvY2F0aW9uEkIKBnN0YXR1cxgHIAEoDjIqLmRlZWRlZS5hcGkuc3VwcGxpZXIubW9kZWwuU3VwcGxpZXIuU3RhdHVzUgZzdGF0dXMiMAoGU3RhdHVzEgoKBkFDVElWRRAAEg0KCVNVU1BFTkRFRBABEgsKB0RFTEVURUQQAg==');
