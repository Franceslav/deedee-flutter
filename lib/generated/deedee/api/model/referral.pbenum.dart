///
//  Generated code. Do not modify.
//  source: deedee/api/model/referral.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Referral_Status extends $pb.ProtobufEnum {
  static const Referral_Status VERIFIED = Referral_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED');
  static const Referral_Status DELETED = Referral_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<Referral_Status> values = <Referral_Status> [
    VERIFIED,
    DELETED,
  ];

  static final $core.Map<$core.int, Referral_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Referral_Status? valueOf($core.int value) => _byValue[value];

  const Referral_Status._($core.int v, $core.String n) : super(v, n);
}

