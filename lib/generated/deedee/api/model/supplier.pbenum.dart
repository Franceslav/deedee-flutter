///
//  Generated code. Do not modify.
//  source: deedee/api/model/supplier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Supplier_Status extends $pb.ProtobufEnum {
  static const Supplier_Status ACTIVE = Supplier_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const Supplier_Status SUSPENDED = Supplier_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUSPENDED');
  static const Supplier_Status DELETED = Supplier_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<Supplier_Status> values = <Supplier_Status> [
    ACTIVE,
    SUSPENDED,
    DELETED,
  ];

  static final $core.Map<$core.int, Supplier_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Supplier_Status? valueOf($core.int value) => _byValue[value];

  const Supplier_Status._($core.int v, $core.String n) : super(v, n);
}

