///
//  Generated code. Do not modify.
//  source: deedee/api/model/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Account_Status extends $pb.ProtobufEnum {
  static const Account_Status ACTIVE = Account_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const Account_Status SUSPENDED = Account_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUSPENDED');
  static const Account_Status BLOCKED = Account_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLOCKED');
  static const Account_Status DELETED = Account_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<Account_Status> values = <Account_Status> [
    ACTIVE,
    SUSPENDED,
    BLOCKED,
    DELETED,
  ];

  static final $core.Map<$core.int, Account_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Account_Status? valueOf($core.int value) => _byValue[value];

  const Account_Status._($core.int v, $core.String n) : super(v, n);
}

class Account_Type extends $pb.ProtobufEnum {
  static const Account_Type GUEST = Account_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUEST');
  static const Account_Type REGISTERED = Account_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGISTERED');

  static const $core.List<Account_Type> values = <Account_Type> [
    GUEST,
    REGISTERED,
  ];

  static final $core.Map<$core.int, Account_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Account_Type? valueOf($core.int value) => _byValue[value];

  const Account_Type._($core.int v, $core.String n) : super(v, n);
}

