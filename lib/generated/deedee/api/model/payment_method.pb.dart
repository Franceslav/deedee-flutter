///
//  Generated code. Do not modify.
//  source: deedee/api/model/payment_method.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $0;
import 'geolocation.pb.dart' as $1;
import 'payment_method.pbenum.dart';

export 'payment_method.pbenum.dart';

class PaymentMethod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PaymentMethod', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.payment.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentMethodId', $pb.PbFieldType.OU6, protoName: 'paymentMethodId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addedBy', $pb.PbFieldType.OU6, protoName: 'addedBy', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$1.Geolocation>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $1.Geolocation.create)
    ..e<PaymentMethod_Type>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PaymentMethod_Type.CARD, valueOf: PaymentMethod_Type.valueOf, enumValues: PaymentMethod_Type.values)
    ..e<PaymentMethod_Status>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: PaymentMethod_Status.ADDED, valueOf: PaymentMethod_Status.valueOf, enumValues: PaymentMethod_Status.values)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  PaymentMethod._() : super();
  factory PaymentMethod({
    $fixnum.Int64? paymentMethodId,
    $fixnum.Int64? addedBy,
    $0.Timestamp? createdAt,
    $1.Geolocation? geolocation,
    PaymentMethod_Type? type,
    PaymentMethod_Status? status,
    $core.String? title,
  }) {
    final _result = create();
    if (paymentMethodId != null) {
      _result.paymentMethodId = paymentMethodId;
    }
    if (addedBy != null) {
      _result.addedBy = addedBy;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (geolocation != null) {
      _result.geolocation = geolocation;
    }
    if (type != null) {
      _result.type = type;
    }
    if (status != null) {
      _result.status = status;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory PaymentMethod.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaymentMethod.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaymentMethod clone() => PaymentMethod()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaymentMethod copyWith(void Function(PaymentMethod) updates) => super.copyWith((message) => updates(message as PaymentMethod)) as PaymentMethod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentMethod create() => PaymentMethod._();
  PaymentMethod createEmptyInstance() => create();
  static $pb.PbList<PaymentMethod> createRepeated() => $pb.PbList<PaymentMethod>();
  @$core.pragma('dart2js:noInline')
  static PaymentMethod getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentMethod>(create);
  static PaymentMethod? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get paymentMethodId => $_getI64(0);
  @$pb.TagNumber(1)
  set paymentMethodId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentMethodId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentMethodId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get addedBy => $_getI64(1);
  @$pb.TagNumber(2)
  set addedBy($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddedBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedBy() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(5)
  $1.Geolocation get geolocation => $_getN(3);
  @$pb.TagNumber(5)
  set geolocation($1.Geolocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGeolocation() => $_has(3);
  @$pb.TagNumber(5)
  void clearGeolocation() => clearField(5);
  @$pb.TagNumber(5)
  $1.Geolocation ensureGeolocation() => $_ensure(3);

  @$pb.TagNumber(6)
  PaymentMethod_Type get type => $_getN(4);
  @$pb.TagNumber(6)
  set type(PaymentMethod_Type v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  PaymentMethod_Status get status => $_getN(5);
  @$pb.TagNumber(7)
  set status(PaymentMethod_Status v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(8)
  set title($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(8)
  void clearTitle() => clearField(8);
}

