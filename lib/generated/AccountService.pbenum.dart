///
//  Generated code. Do not modify.
//  source: AccountService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ACCOUNT_TYPE extends $pb.ProtobufEnum {
  static const ACCOUNT_TYPE BUY = ACCOUNT_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUY');
  static const ACCOUNT_TYPE SELL = ACCOUNT_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SELL');

  static const $core.List<ACCOUNT_TYPE> values = <ACCOUNT_TYPE> [
    BUY,
    SELL,
  ];

  static final $core.Map<$core.int, ACCOUNT_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ACCOUNT_TYPE? valueOf($core.int value) => _byValue[value];

  const ACCOUNT_TYPE._($core.int v, $core.String n) : super(v, n);
}

class AccountStatusResponse_VERIFICATION_TYPE extends $pb.ProtobufEnum {
  static const AccountStatusResponse_VERIFICATION_TYPE UNVERIFIED = AccountStatusResponse_VERIFICATION_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNVERIFIED');
  static const AccountStatusResponse_VERIFICATION_TYPE VERIFIED = AccountStatusResponse_VERIFICATION_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED');
  static const AccountStatusResponse_VERIFICATION_TYPE BLOCKED = AccountStatusResponse_VERIFICATION_TYPE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLOCKED');

  static const $core.List<AccountStatusResponse_VERIFICATION_TYPE> values = <AccountStatusResponse_VERIFICATION_TYPE> [
    UNVERIFIED,
    VERIFIED,
    BLOCKED,
  ];

  static final $core.Map<$core.int, AccountStatusResponse_VERIFICATION_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountStatusResponse_VERIFICATION_TYPE? valueOf($core.int value) => _byValue[value];

  const AccountStatusResponse_VERIFICATION_TYPE._($core.int v, $core.String n) : super(v, n);
}

