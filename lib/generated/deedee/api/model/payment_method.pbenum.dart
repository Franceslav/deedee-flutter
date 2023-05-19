///
//  Generated code. Do not modify.
//  source: deedee/api/model/payment_method.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PaymentMethod_Type extends $pb.ProtobufEnum {
  static const PaymentMethod_Type CARD = PaymentMethod_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CARD');
  static const PaymentMethod_Type BANK_TRANSFER = PaymentMethod_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BANK_TRANSFER');

  static const $core.List<PaymentMethod_Type> values = <PaymentMethod_Type> [
    CARD,
    BANK_TRANSFER,
  ];

  static final $core.Map<$core.int, PaymentMethod_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentMethod_Type? valueOf($core.int value) => _byValue[value];

  const PaymentMethod_Type._($core.int v, $core.String n) : super(v, n);
}

class PaymentMethod_Status extends $pb.ProtobufEnum {
  static const PaymentMethod_Status ADDED = PaymentMethod_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADDED');
  static const PaymentMethod_Status CHANGED = PaymentMethod_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGED');
  static const PaymentMethod_Status DELETED = PaymentMethod_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<PaymentMethod_Status> values = <PaymentMethod_Status> [
    ADDED,
    CHANGED,
    DELETED,
  ];

  static final $core.Map<$core.int, PaymentMethod_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentMethod_Status? valueOf($core.int value) => _byValue[value];

  const PaymentMethod_Status._($core.int v, $core.String n) : super(v, n);
}

