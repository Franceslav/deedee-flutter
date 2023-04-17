///
//  Generated code. Do not modify.
//  source: tag_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Tag_Type extends $pb.ProtobufEnum {
  static const Tag_Type CLIENT = Tag_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLIENT');
  static const Tag_Type SUPPLIER = Tag_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPPLIER');

  static const $core.List<Tag_Type> values = <Tag_Type> [
    CLIENT,
    SUPPLIER,
  ];

  static final $core.Map<$core.int, Tag_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Tag_Type? valueOf($core.int value) => _byValue[value];

  const Tag_Type._($core.int v, $core.String n) : super(v, n);
}

class Tag_Status extends $pb.ProtobufEnum {
  static const Tag_Status BOOKMARKED = Tag_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOOKMARKED');
  static const Tag_Status SUBSCRIBED = Tag_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUBSCRIBED');
  static const Tag_Status PLACED = Tag_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLACED');
  static const Tag_Status CHANGED = Tag_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGED');
  static const Tag_Status DELETED = Tag_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<Tag_Status> values = <Tag_Status> [
    BOOKMARKED,
    SUBSCRIBED,
    PLACED,
    CHANGED,
    DELETED,
  ];

  static final $core.Map<$core.int, Tag_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Tag_Status? valueOf($core.int value) => _byValue[value];

  const Tag_Status._($core.int v, $core.String n) : super(v, n);
}

