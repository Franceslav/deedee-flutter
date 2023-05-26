///
//  Generated code. Do not modify.
//  source: deedee/api/model/profile.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = const {
  '1': 'Profile',
  '2': const [
    const {'1': 'profileId', '3': 1, '4': 1, '5': 4, '10': 'profileId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'referredBy', '3': 3, '4': 1, '5': 9, '10': 'referredBy'},
    const {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'contacts', '3': 5, '4': 3, '5': 11, '6': '.deedee.api.contact.model.Contact', '10': 'contacts'},
    const {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.deedee.api.profile.model.Profile.Status', '10': 'status'},
  ],
  '4': const [Profile_Status$json],
};

@$core.Deprecated('Use profileDescriptor instead')
const Profile_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'SUSPENDED', '2': 1},
    const {'1': 'BLOCKED', '2': 2},
    const {'1': 'DELETED', '2': 3},
    const {'1': 'VERIFIED', '2': 4},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode('CgdQcm9maWxlEhwKCXByb2ZpbGVJZBgBIAEoBFIJcHJvZmlsZUlkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEh4KCnJlZmVycmVkQnkYAyABKAlSCnJlZmVycmVkQnkSGgoIdXNlcm5hbWUYBCABKAlSCHVzZXJuYW1lEj0KCGNvbnRhY3RzGAUgAygLMiEuZGVlZGVlLmFwaS5jb250YWN0Lm1vZGVsLkNvbnRhY3RSCGNvbnRhY3RzEkAKBnN0YXR1cxgGIAEoDjIoLmRlZWRlZS5hcGkucHJvZmlsZS5tb2RlbC5Qcm9maWxlLlN0YXR1c1IGc3RhdHVzIksKBlN0YXR1cxIKCgZBQ1RJVkUQABINCglTVVNQRU5ERUQQARILCgdCTE9DS0VEEAISCwoHREVMRVRFRBADEgwKCFZFUklGSUVEEAQ=');
