///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/service/referral_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use referralRequestDescriptor instead')
const ReferralRequest$json = const {
  '1': 'ReferralRequest',
  '2': const [
    const {'1': 'referral', '3': 1, '4': 1, '5': 11, '6': '.deedee.api.referral.model.Referral', '10': 'referral'},
  ],
};

/// Descriptor for `ReferralRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List referralRequestDescriptor = $convert.base64Decode('Cg9SZWZlcnJhbFJlcXVlc3QSPwoIcmVmZXJyYWwYASABKAsyIy5kZWVkZWUuYXBpLnJlZmVycmFsLm1vZGVsLlJlZmVycmFsUghyZWZlcnJhbA==');
@$core.Deprecated('Use referralResponseDescriptor instead')
const ReferralResponse$json = const {
  '1': 'ReferralResponse',
  '2': const [
    const {'1': 'referrals', '3': 1, '4': 3, '5': 11, '6': '.deedee.api.referral.model.Referral', '10': 'referrals'},
  ],
};

/// Descriptor for `ReferralResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List referralResponseDescriptor = $convert.base64Decode('ChBSZWZlcnJhbFJlc3BvbnNlEkEKCXJlZmVycmFscxgBIAMoCzIjLmRlZWRlZS5hcGkucmVmZXJyYWwubW9kZWwuUmVmZXJyYWxSCXJlZmVycmFscw==');
