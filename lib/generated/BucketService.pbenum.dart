///
//  Generated code. Do not modify.
//  source: BucketService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Tag_TYPE extends $pb.ProtobufEnum {
  static const Tag_TYPE BUY = Tag_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUY');
  static const Tag_TYPE SELL = Tag_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SELL');

  static const $core.List<Tag_TYPE> values = <Tag_TYPE> [
    BUY,
    SELL,
  ];

  static final $core.Map<$core.int, Tag_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Tag_TYPE? valueOf($core.int value) => _byValue[value];

  const Tag_TYPE._($core.int v, $core.String n) : super(v, n);
}

