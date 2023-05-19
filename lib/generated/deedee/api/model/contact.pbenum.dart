///
//  Generated code. Do not modify.
//  source: deedee/api/model/contact.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Contact_Type extends $pb.ProtobufEnum {
  static const Contact_Type EMAIL = Contact_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMAIL');
  static const Contact_Type PHONE = Contact_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE');
  static const Contact_Type INSTAGRAM = Contact_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTAGRAM');
  static const Contact_Type WHATSAPP = Contact_Type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WHATSAPP');
  static const Contact_Type TELEGRAM = Contact_Type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TELEGRAM');
  static const Contact_Type FACEBOOK = Contact_Type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FACEBOOK');
  static const Contact_Type VK = Contact_Type._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VK');

  static const $core.List<Contact_Type> values = <Contact_Type> [
    EMAIL,
    PHONE,
    INSTAGRAM,
    WHATSAPP,
    TELEGRAM,
    FACEBOOK,
    VK,
  ];

  static final $core.Map<$core.int, Contact_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Contact_Type? valueOf($core.int value) => _byValue[value];

  const Contact_Type._($core.int v, $core.String n) : super(v, n);
}

class Contact_Status extends $pb.ProtobufEnum {
  static const Contact_Status ADDED = Contact_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADDED');
  static const Contact_Status UPDATED = Contact_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPDATED');
  static const Contact_Status DELETED = Contact_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<Contact_Status> values = <Contact_Status> [
    ADDED,
    UPDATED,
    DELETED,
  ];

  static final $core.Map<$core.int, Contact_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Contact_Status? valueOf($core.int value) => _byValue[value];

  const Contact_Status._($core.int v, $core.String n) : super(v, n);
}

