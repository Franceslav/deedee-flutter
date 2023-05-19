///
import 'dart:convert' as $convert;
//  Generated code. Do not modify.
//  source: deedee/api/model/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'accountId', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.deedee.api.account.model.Account.Status', '10': 'status'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.deedee.api.account.model.Account.Type', '10': 'type'},
    const {'1': 'balance', '3': 6, '4': 3, '5': 11, '6': '.deedee.api.balance.model.Balance', '10': 'balance'},
  ],
  '4': const [Account_Status$json, Account_Type$json],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'SUSPENDED', '2': 1},
    const {'1': 'BLOCKED', '2': 2},
    const {'1': 'DELETED', '2': 3},
  ],
};

@$core.Deprecated('Use accountDescriptor instead')
const Account_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'GUEST', '2': 0},
    const {'1': 'REGISTERED', '2': 1},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50EhwKCWFjY291bnRJZBgBIAEoBFIJYWNjb3VudElkEhQKBXZhbHVlGAIgASgJUgV2YWx1ZRIWCgZ1c2VySWQYAyABKAlSBnVzZXJJZBJACgZzdGF0dXMYBCABKA4yKC5kZWVkZWUuYXBpLmFjY291bnQubW9kZWwuQWNjb3VudC5TdGF0dXNSBnN0YXR1cxI6CgR0eXBlGAUgASgOMiYuZGVlZGVlLmFwaS5hY2NvdW50Lm1vZGVsLkFjY291bnQuVHlwZVIEdHlwZRI7CgdiYWxhbmNlGAYgAygLMiEuZGVlZGVlLmFwaS5iYWxhbmNlLm1vZGVsLkJhbGFuY2VSB2JhbGFuY2UiPQoGU3RhdHVzEgoKBkFDVElWRRAAEg0KCVNVU1BFTkRFRBABEgsKB0JMT0NLRUQQAhILCgdERUxFVEVEEAMiIQoEVHlwZRIJCgVHVUVTVBAAEg4KClJFR0lTVEVSRUQQAQ==');
