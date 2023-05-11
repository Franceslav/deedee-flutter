///
//  Generated code. Do not modify.
//  source: deedee/api/service/location_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/location.pb.dart' as $1;

class LocationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.location.service'), createEmptyInstance: create)
    ..aOM<$1.Location>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location', subBuilder: $1.Location.create)
    ..hasRequiredFields = false
  ;

  LocationRequest._() : super();
  factory LocationRequest({
    $1.Location? location,
  }) {
    final _result = create();
    if (location != null) {
      _result.location = location;
    }
    return _result;
  }
  factory LocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocationRequest clone() => LocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocationRequest copyWith(void Function(LocationRequest) updates) => super.copyWith((message) => updates(message as LocationRequest)) as LocationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LocationRequest create() => LocationRequest._();
  LocationRequest createEmptyInstance() => create();
  static $pb.PbList<LocationRequest> createRepeated() => $pb.PbList<LocationRequest>();
  @$core.pragma('dart2js:noInline')
  static LocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationRequest>(create);
  static LocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Location get location => $_getN(0);
  @$pb.TagNumber(1)
  set location($1.Location v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
  @$pb.TagNumber(1)
  $1.Location ensureLocation() => $_ensure(0);
}

class LocationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.location.service'), createEmptyInstance: create)
    ..pc<$1.Location>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: $1.Location.create)
    ..hasRequiredFields = false
  ;

  LocationResponse._() : super();
  factory LocationResponse({
    $core.Iterable<$1.Location>? locations,
  }) {
    final _result = create();
    if (locations != null) {
      _result.locations.addAll(locations);
    }
    return _result;
  }
  factory LocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocationResponse clone() => LocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocationResponse copyWith(void Function(LocationResponse) updates) => super.copyWith((message) => updates(message as LocationResponse)) as LocationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LocationResponse create() => LocationResponse._();
  LocationResponse createEmptyInstance() => create();
  static $pb.PbList<LocationResponse> createRepeated() => $pb.PbList<LocationResponse>();
  @$core.pragma('dart2js:noInline')
  static LocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationResponse>(create);
  static LocationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Location> get locations => $_getList(0);
}

