///
//  Generated code. Do not modify.
//  source: LocationService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetPlacesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlacesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<GeoLocation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: GeoLocation.create)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GetPlacesRequest._() : super();
  factory GetPlacesRequest({
    GeoLocation? geoLocation,
    $core.double? radius,
  }) {
    final _result = create();
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    if (radius != null) {
      _result.radius = radius;
    }
    return _result;
  }
  factory GetPlacesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlacesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlacesRequest clone() => GetPlacesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlacesRequest copyWith(void Function(GetPlacesRequest) updates) => super.copyWith((message) => updates(message as GetPlacesRequest)) as GetPlacesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlacesRequest create() => GetPlacesRequest._();
  GetPlacesRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlacesRequest> createRepeated() => $pb.PbList<GetPlacesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlacesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlacesRequest>(create);
  static GetPlacesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  GeoLocation get geoLocation => $_getN(0);
  @$pb.TagNumber(1)
  set geoLocation(GeoLocation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeoLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeoLocation() => clearField(1);
  @$pb.TagNumber(1)
  GeoLocation ensureGeoLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get radius => $_getN(1);
  @$pb.TagNumber(2)
  set radius($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRadius() => $_has(1);
  @$pb.TagNumber(2)
  void clearRadius() => clearField(2);
}

class GetPlacesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlacesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pc<Place>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'places', $pb.PbFieldType.PM, subBuilder: Place.create)
    ..hasRequiredFields = false
  ;

  GetPlacesResponse._() : super();
  factory GetPlacesResponse({
    $core.Iterable<Place>? places,
  }) {
    final _result = create();
    if (places != null) {
      _result.places.addAll(places);
    }
    return _result;
  }
  factory GetPlacesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlacesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlacesResponse clone() => GetPlacesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlacesResponse copyWith(void Function(GetPlacesResponse) updates) => super.copyWith((message) => updates(message as GetPlacesResponse)) as GetPlacesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlacesResponse create() => GetPlacesResponse._();
  GetPlacesResponse createEmptyInstance() => create();
  static $pb.PbList<GetPlacesResponse> createRepeated() => $pb.PbList<GetPlacesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPlacesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlacesResponse>(create);
  static GetPlacesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Place> get places => $_getList(0);
}

class Place extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Place', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'GeoLocation', protoName: 'GeoLocation')
    ..hasRequiredFields = false
  ;

  Place._() : super();
  factory Place({
    $core.String? title,
    $core.String? geoLocation,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    return _result;
  }
  factory Place.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Place.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Place clone() => Place()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Place copyWith(void Function(Place) updates) => super.copyWith((message) => updates(message as Place)) as Place; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Place create() => Place._();
  Place createEmptyInstance() => create();
  static $pb.PbList<Place> createRepeated() => $pb.PbList<Place>();
  @$core.pragma('dart2js:noInline')
  static Place getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Place>(create);
  static Place? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get geoLocation => $_getSZ(1);
  @$pb.TagNumber(2)
  set geoLocation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGeoLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearGeoLocation() => clearField(2);
}

class GeoLocation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GeoLocation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GeoLocation._() : super();
  factory GeoLocation({
    $core.String? title,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    return _result;
  }
  factory GeoLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeoLocation clone() => GeoLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeoLocation copyWith(void Function(GeoLocation) updates) => super.copyWith((message) => updates(message as GeoLocation)) as GeoLocation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoLocation create() => GeoLocation._();
  GeoLocation createEmptyInstance() => create();
  static $pb.PbList<GeoLocation> createRepeated() => $pb.PbList<GeoLocation>();
  @$core.pragma('dart2js:noInline')
  static GeoLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoLocation>(create);
  static GeoLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);
}

