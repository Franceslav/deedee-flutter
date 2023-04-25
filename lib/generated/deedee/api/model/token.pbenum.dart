///
//  Generated code. Do not modify.
//  source: deedee/api/model/token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PushNotificationToken_Type extends $pb.ProtobufEnum {
  static const PushNotificationToken_Type VALID = PushNotificationToken_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VALID');
  static const PushNotificationToken_Type EXPIRED = PushNotificationToken_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPIRED');

  static const $core.List<PushNotificationToken_Type> values = <PushNotificationToken_Type> [
    VALID,
    EXPIRED,
  ];

  static final $core.Map<$core.int, PushNotificationToken_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PushNotificationToken_Type? valueOf($core.int value) => _byValue[value];

  const PushNotificationToken_Type._($core.int v, $core.String n) : super(v, n);
}

