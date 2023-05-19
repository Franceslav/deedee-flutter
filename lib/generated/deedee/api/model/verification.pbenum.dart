///
//  Generated code. Do not modify.
//  source: deedee/api/model/verification.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Verification_Status extends $pb.ProtobufEnum {
  static const Verification_Status VERIFIED = Verification_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED');
  static const Verification_Status EXPIRED = Verification_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPIRED');
  static const Verification_Status SENT = Verification_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENT');

  static const $core.List<Verification_Status> values = <Verification_Status> [
    VERIFIED,
    EXPIRED,
    SENT,
  ];

  static final $core.Map<$core.int, Verification_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Verification_Status? valueOf($core.int value) => _byValue[value];

  const Verification_Status._($core.int v, $core.String n) : super(v, n);
}

class Verification_Type extends $pb.ProtobufEnum {
  static const Verification_Type EMAIL = Verification_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMAIL');
  static const Verification_Type PASSPORT = Verification_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PASSPORT');

  static const $core.List<Verification_Type> values = <Verification_Type> [
    EMAIL,
    PASSPORT,
  ];

  static final $core.Map<$core.int, Verification_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Verification_Type? valueOf($core.int value) => _byValue[value];

  const Verification_Type._($core.int v, $core.String n) : super(v, n);
}

