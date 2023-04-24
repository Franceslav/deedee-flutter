///
//  Generated code. Do not modify.
//  source: token_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Token_TYPE extends $pb.ProtobufEnum {
  static const Token_TYPE VALID = Token_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VALID');
  static const Token_TYPE EXPIRED = Token_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPIRED');

  static const $core.List<Token_TYPE> values = <Token_TYPE> [
    VALID,
    EXPIRED,
  ];

  static final $core.Map<$core.int, Token_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Token_TYPE? valueOf($core.int value) => _byValue[value];

  const Token_TYPE._($core.int v, $core.String n) : super(v, n);
}

