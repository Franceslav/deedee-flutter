///
//  Generated code. Do not modify.
//  source: deedee/api/model/observation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'geolocation.pb.dart' as $0;

class Observation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Observation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.statistic.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'observationId', $pb.PbFieldType.OU6, protoName: 'observationId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.OU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Geolocation>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $0.Geolocation.create)
    ..hasRequiredFields = false
  ;

  Observation._() : super();
  factory Observation({
    $fixnum.Int64? observationId,
    $fixnum.Int64? userId,
    $0.Geolocation? geolocation,
  }) {
    final _result = create();
    if (observationId != null) {
      _result.observationId = observationId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (geolocation != null) {
      _result.geolocation = geolocation;
    }
    return _result;
  }
  factory Observation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Observation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Observation clone() => Observation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Observation copyWith(void Function(Observation) updates) => super.copyWith((message) => updates(message as Observation)) as Observation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Observation create() => Observation._();
  Observation createEmptyInstance() => create();
  static $pb.PbList<Observation> createRepeated() => $pb.PbList<Observation>();
  @$core.pragma('dart2js:noInline')
  static Observation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Observation>(create);
  static Observation? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get observationId => $_getI64(0);
  @$pb.TagNumber(1)
  set observationId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObservationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearObservationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $0.Geolocation get geolocation => $_getN(2);
  @$pb.TagNumber(3)
  set geolocation($0.Geolocation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGeolocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearGeolocation() => clearField(3);
  @$pb.TagNumber(3)
  $0.Geolocation ensureGeolocation() => $_ensure(2);
}

