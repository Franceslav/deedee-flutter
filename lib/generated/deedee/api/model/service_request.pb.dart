///
//  Generated code. Do not modify.
//  source: deedee/api/model/service_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $0;
import 'geolocation.pb.dart' as $1;

import 'service_request.pbenum.dart';

export 'service_request.pbenum.dart';

class ServiceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.servicerequest.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequestId', $pb.PbFieldType.OU6, protoName: 'serviceRequestId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdFor', protoName: 'createdFor')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdBy', protoName: 'createdBy')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$1.Geolocation>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $1.Geolocation.create)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..e<ServiceRequest_Status>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ServiceRequest_Status.PENDING, valueOf: ServiceRequest_Status.valueOf, enumValues: ServiceRequest_Status.values)
    ..hasRequiredFields = false
  ;

  ServiceRequest._() : super();
  factory ServiceRequest({
    $fixnum.Int64? serviceRequestId,
    $core.String? createdFor,
    $core.String? createdBy,
    $core.String? description,
    $0.Timestamp? createdAt,
    $1.Geolocation? geolocation,
    $core.double? price,
    ServiceRequest_Status? status,
  }) {
    final _result = create();
    if (serviceRequestId != null) {
      _result.serviceRequestId = serviceRequestId;
    }
    if (createdFor != null) {
      _result.createdFor = createdFor;
    }
    if (createdBy != null) {
      _result.createdBy = createdBy;
    }
    if (description != null) {
      _result.description = description;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (geolocation != null) {
      _result.geolocation = geolocation;
    }
    if (price != null) {
      _result.price = price;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ServiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceRequest clone() => ServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceRequest copyWith(void Function(ServiceRequest) updates) => super.copyWith((message) => updates(message as ServiceRequest)) as ServiceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceRequest create() => ServiceRequest._();
  ServiceRequest createEmptyInstance() => create();
  static $pb.PbList<ServiceRequest> createRepeated() => $pb.PbList<ServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static ServiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceRequest>(create);
  static ServiceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get serviceRequestId => $_getI64(0);
  @$pb.TagNumber(1)
  set serviceRequestId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdFor => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdFor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedFor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedFor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get createdBy => $_getSZ(2);
  @$pb.TagNumber(3)
  set createdBy($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedBy() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Geolocation get geolocation => $_getN(5);
  @$pb.TagNumber(6)
  set geolocation($1.Geolocation v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGeolocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearGeolocation() => clearField(6);
  @$pb.TagNumber(6)
  $1.Geolocation ensureGeolocation() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.double get price => $_getN(6);
  @$pb.TagNumber(7)
  set price($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrice() => clearField(7);

  @$pb.TagNumber(8)
  ServiceRequest_Status get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(ServiceRequest_Status v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);
}

