///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/referral.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use referralDescriptor instead')
const Referral$json = const {
  '1': 'Referral',
  '2': const [
    const {'1': 'referralId', '3': 1, '4': 1, '5': 4, '10': 'referralId'},
    const {'1': 'referredBy', '3': 2, '4': 1, '5': 9, '10': 'referredBy'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
  '4': const [Referral_Status$json],
};

@$core.Deprecated('Use referralDescriptor instead')
const Referral_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'VERIFIED', '2': 0},
    const {'1': 'DELETED', '2': 1},
  ],
};

/// Descriptor for `Referral`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List referralDescriptor = $convert.base64Decode('CghSZWZlcnJhbBIeCgpyZWZlcnJhbElkGAEgASgEUgpyZWZlcnJhbElkEh4KCnJlZmVycmVkQnkYAiABKAlSCnJlZmVycmVkQnkSFAoFZW1haWwYAyABKAlSBWVtYWlsIiMKBlN0YXR1cxIMCghWRVJJRklFRBAAEgsKB0RFTEVURUQQAQ==');
