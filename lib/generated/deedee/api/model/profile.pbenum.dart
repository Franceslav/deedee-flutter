///
//  Generated code. Do not modify.
//  source: deedee/api/model/profile.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Profile_Status extends $pb.ProtobufEnum {
  static const Profile_Status ACTIVE = Profile_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const Profile_Status SUSPENDED = Profile_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUSPENDED');
  static const Profile_Status BLOCKED = Profile_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLOCKED');
  static const Profile_Status DELETED = Profile_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');
  static const Profile_Status VERIFIED = Profile_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED');

  static const $core.List<Profile_Status> values = <Profile_Status> [
    ACTIVE,
    SUSPENDED,
    BLOCKED,
    DELETED,
    VERIFIED,
  ];

  static final $core.Map<$core.int, Profile_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Profile_Status? valueOf($core.int value) => _byValue[value];

  const Profile_Status._($core.int v, $core.String n) : super(v, n);
}

