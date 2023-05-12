///
//  Generated code. Do not modify.
//  source: deedee/api/service/observation_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/observation.pb.dart' as $1;

class ObservationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ObservationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.statistic.service'), createEmptyInstance: create)
    ..aOM<$1.Observation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'observation', subBuilder: $1.Observation.create)
    ..hasRequiredFields = false
  ;

  ObservationRequest._() : super();
  factory ObservationRequest({
    $1.Observation? observation,
  }) {
    final _result = create();
    if (observation != null) {
      _result.observation = observation;
    }
    return _result;
  }
  factory ObservationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ObservationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ObservationRequest clone() => ObservationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ObservationRequest copyWith(void Function(ObservationRequest) updates) => super.copyWith((message) => updates(message as ObservationRequest)) as ObservationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ObservationRequest create() => ObservationRequest._();
  ObservationRequest createEmptyInstance() => create();
  static $pb.PbList<ObservationRequest> createRepeated() => $pb.PbList<ObservationRequest>();
  @$core.pragma('dart2js:noInline')
  static ObservationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObservationRequest>(create);
  static ObservationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Observation get observation => $_getN(0);
  @$pb.TagNumber(1)
  set observation($1.Observation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasObservation() => $_has(0);
  @$pb.TagNumber(1)
  void clearObservation() => clearField(1);
  @$pb.TagNumber(1)
  $1.Observation ensureObservation() => $_ensure(0);
}

class ObservationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ObservationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.statistic.service'), createEmptyInstance: create)
    ..pc<$1.Observation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'observations', $pb.PbFieldType.PM, subBuilder: $1.Observation.create)
    ..hasRequiredFields = false
  ;

  ObservationResponse._() : super();
  factory ObservationResponse({
    $core.Iterable<$1.Observation>? observations,
  }) {
    final _result = create();
    if (observations != null) {
      _result.observations.addAll(observations);
    }
    return _result;
  }
  factory ObservationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ObservationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ObservationResponse clone() => ObservationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ObservationResponse copyWith(void Function(ObservationResponse) updates) => super.copyWith((message) => updates(message as ObservationResponse)) as ObservationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ObservationResponse create() => ObservationResponse._();
  ObservationResponse createEmptyInstance() => create();
  static $pb.PbList<ObservationResponse> createRepeated() => $pb.PbList<ObservationResponse>();
  @$core.pragma('dart2js:noInline')
  static ObservationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObservationResponse>(create);
  static ObservationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Observation> get observations => $_getList(0);
}

