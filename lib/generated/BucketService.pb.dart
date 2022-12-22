///
//  Generated code. Do not modify.
//  source: BucketService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'timestamp.pb.dart' as $1;

import 'BucketService.pbenum.dart';

export 'BucketService.pbenum.dart';

class GetTopicTitlesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<GeoLocation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: GeoLocation.create)
    ..hasRequiredFields = false
  ;

  GetTopicTitlesRequest._() : super();
  factory GetTopicTitlesRequest({
    GeoLocation? geoLocation,
  }) {
    final _result = create();
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    return _result;
  }
  factory GetTopicTitlesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopicTitlesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopicTitlesRequest clone() => GetTopicTitlesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopicTitlesRequest copyWith(void Function(GetTopicTitlesRequest) updates) => super.copyWith((message) => updates(message as GetTopicTitlesRequest)) as GetTopicTitlesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesRequest create() => GetTopicTitlesRequest._();
  GetTopicTitlesRequest createEmptyInstance() => create();
  static $pb.PbList<GetTopicTitlesRequest> createRepeated() => $pb.PbList<GetTopicTitlesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopicTitlesRequest>(create);
  static GetTopicTitlesRequest? _defaultInstance;

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
}

class GetTopicTitlesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicTitles', protoName: 'topicTitles')
    ..hasRequiredFields = false
  ;

  GetTopicTitlesResponse._() : super();
  factory GetTopicTitlesResponse({
    $core.Iterable<$core.String>? topicTitles,
  }) {
    final _result = create();
    if (topicTitles != null) {
      _result.topicTitles.addAll(topicTitles);
    }
    return _result;
  }
  factory GetTopicTitlesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopicTitlesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopicTitlesResponse clone() => GetTopicTitlesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopicTitlesResponse copyWith(void Function(GetTopicTitlesResponse) updates) => super.copyWith((message) => updates(message as GetTopicTitlesResponse)) as GetTopicTitlesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesResponse create() => GetTopicTitlesResponse._();
  GetTopicTitlesResponse createEmptyInstance() => create();
  static $pb.PbList<GetTopicTitlesResponse> createRepeated() => $pb.PbList<GetTopicTitlesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopicTitlesResponse>(create);
  static GetTopicTitlesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get topicTitles => $_getList(0);
}

class GetBucketRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBucketRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bucketId', protoName: 'bucketId')
    ..e<Tag_TYPE>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagType', $pb.PbFieldType.OE, protoName: 'tagType', defaultOrMaker: Tag_TYPE.BUY, valueOf: Tag_TYPE.valueOf, enumValues: Tag_TYPE.values)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters')
    ..hasRequiredFields = false
  ;

  GetBucketRequest._() : super();
  factory GetBucketRequest({
    $core.String? bucketId,
    Tag_TYPE? tagType,
    $core.Iterable<$core.String>? filters,
  }) {
    final _result = create();
    if (bucketId != null) {
      _result.bucketId = bucketId;
    }
    if (tagType != null) {
      _result.tagType = tagType;
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    return _result;
  }
  factory GetBucketRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBucketRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBucketRequest clone() => GetBucketRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBucketRequest copyWith(void Function(GetBucketRequest) updates) => super.copyWith((message) => updates(message as GetBucketRequest)) as GetBucketRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBucketRequest create() => GetBucketRequest._();
  GetBucketRequest createEmptyInstance() => create();
  static $pb.PbList<GetBucketRequest> createRepeated() => $pb.PbList<GetBucketRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBucketRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBucketRequest>(create);
  static GetBucketRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bucketId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bucketId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBucketId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBucketId() => clearField(1);

  @$pb.TagNumber(2)
  Tag_TYPE get tagType => $_getN(1);
  @$pb.TagNumber(2)
  set tagType(Tag_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTagType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get filters => $_getList(2);
}

class GetBucketResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBucketResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<Bucket>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bucket', subBuilder: Bucket.create)
    ..hasRequiredFields = false
  ;

  GetBucketResponse._() : super();
  factory GetBucketResponse({
    Bucket? bucket,
  }) {
    final _result = create();
    if (bucket != null) {
      _result.bucket = bucket;
    }
    return _result;
  }
  factory GetBucketResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBucketResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBucketResponse clone() => GetBucketResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBucketResponse copyWith(void Function(GetBucketResponse) updates) => super.copyWith((message) => updates(message as GetBucketResponse)) as GetBucketResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBucketResponse create() => GetBucketResponse._();
  GetBucketResponse createEmptyInstance() => create();
  static $pb.PbList<GetBucketResponse> createRepeated() => $pb.PbList<GetBucketResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBucketResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBucketResponse>(create);
  static GetBucketResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Bucket get bucket => $_getN(0);
  @$pb.TagNumber(1)
  set bucket(Bucket v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBucket() => $_has(0);
  @$pb.TagNumber(1)
  void clearBucket() => clearField(1);
  @$pb.TagNumber(1)
  Bucket ensureBucket() => $_ensure(0);
}

class PlaceTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaceTagRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: Tag.create)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters')
    ..hasRequiredFields = false
  ;

  PlaceTagRequest._() : super();
  factory PlaceTagRequest({
    Tag? tag,
    $core.Iterable<$core.String>? filters,
  }) {
    final _result = create();
    if (tag != null) {
      _result.tag = tag;
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    return _result;
  }
  factory PlaceTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaceTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaceTagRequest clone() => PlaceTagRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaceTagRequest copyWith(void Function(PlaceTagRequest) updates) => super.copyWith((message) => updates(message as PlaceTagRequest)) as PlaceTagRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaceTagRequest create() => PlaceTagRequest._();
  PlaceTagRequest createEmptyInstance() => create();
  static $pb.PbList<PlaceTagRequest> createRepeated() => $pb.PbList<PlaceTagRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaceTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaceTagRequest>(create);
  static PlaceTagRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Tag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag(Tag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  Tag ensureTag() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get filters => $_getList(1);
}

class PlaceTagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaceTagResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  PlaceTagResponse._() : super();
  factory PlaceTagResponse({
    Tag? tag,
  }) {
    final _result = create();
    if (tag != null) {
      _result.tag = tag;
    }
    return _result;
  }
  factory PlaceTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaceTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaceTagResponse clone() => PlaceTagResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaceTagResponse copyWith(void Function(PlaceTagResponse) updates) => super.copyWith((message) => updates(message as PlaceTagResponse)) as PlaceTagResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaceTagResponse create() => PlaceTagResponse._();
  PlaceTagResponse createEmptyInstance() => create();
  static $pb.PbList<PlaceTagResponse> createRepeated() => $pb.PbList<PlaceTagResponse>();
  @$core.pragma('dart2js:noInline')
  static PlaceTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaceTagResponse>(create);
  static PlaceTagResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Tag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag(Tag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  Tag ensureTag() => $_ensure(0);
}

class GetFilterKeysRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic')
    ..hasRequiredFields = false
  ;

  GetFilterKeysRequest._() : super();
  factory GetFilterKeysRequest({
    $core.String? topic,
  }) {
    final _result = create();
    if (topic != null) {
      _result.topic = topic;
    }
    return _result;
  }
  factory GetFilterKeysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFilterKeysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFilterKeysRequest clone() => GetFilterKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFilterKeysRequest copyWith(void Function(GetFilterKeysRequest) updates) => super.copyWith((message) => updates(message as GetFilterKeysRequest)) as GetFilterKeysRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysRequest create() => GetFilterKeysRequest._();
  GetFilterKeysRequest createEmptyInstance() => create();
  static $pb.PbList<GetFilterKeysRequest> createRepeated() => $pb.PbList<GetFilterKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFilterKeysRequest>(create);
  static GetFilterKeysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(1)
  set topic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);
}

class GetFilterKeysResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pc<FilterKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: FilterKey.create)
    ..hasRequiredFields = false
  ;

  GetFilterKeysResponse._() : super();
  factory GetFilterKeysResponse({
    $core.Iterable<FilterKey>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory GetFilterKeysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFilterKeysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFilterKeysResponse clone() => GetFilterKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFilterKeysResponse copyWith(void Function(GetFilterKeysResponse) updates) => super.copyWith((message) => updates(message as GetFilterKeysResponse)) as GetFilterKeysResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysResponse create() => GetFilterKeysResponse._();
  GetFilterKeysResponse createEmptyInstance() => create();
  static $pb.PbList<GetFilterKeysResponse> createRepeated() => $pb.PbList<GetFilterKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFilterKeysResponse>(create);
  static GetFilterKeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FilterKey> get items => $_getList(0);
}

class Bucket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Bucket', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pc<Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  Bucket._() : super();
  factory Bucket({
    $core.Iterable<Tag>? tags,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory Bucket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bucket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bucket clone() => Bucket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bucket copyWith(void Function(Bucket) updates) => super.copyWith((message) => updates(message as Bucket)) as Bucket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Bucket create() => Bucket._();
  Bucket createEmptyInstance() => create();
  static $pb.PbList<Bucket> createRepeated() => $pb.PbList<Bucket>();
  @$core.pragma('dart2js:noInline')
  static Bucket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bucket>(create);
  static Bucket? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Tag> get tags => $_getList(0);
}

class Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tag', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bucketId', protoName: 'bucketId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..aOM<GeoLocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: GeoLocation.create)
    ..e<Tag_TYPE>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagType', $pb.PbFieldType.OE, protoName: 'tagType', defaultOrMaker: Tag_TYPE.BUY, valueOf: Tag_TYPE.valueOf, enumValues: Tag_TYPE.values)
    ..aOM<$1.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', protoName: 'dueDate', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Tag._() : super();
  factory Tag({
    $core.String? bucketId,
    $core.String? messengerId,
    GeoLocation? geoLocation,
    Tag_TYPE? tagType,
    $1.Timestamp? dueDate,
  }) {
    final _result = create();
    if (bucketId != null) {
      _result.bucketId = bucketId;
    }
    if (messengerId != null) {
      _result.messengerId = messengerId;
    }
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    if (tagType != null) {
      _result.tagType = tagType;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    return _result;
  }
  factory Tag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tag clone() => Tag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tag copyWith(void Function(Tag) updates) => super.copyWith((message) => updates(message as Tag)) as Tag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tag create() => Tag._();
  Tag createEmptyInstance() => create();
  static $pb.PbList<Tag> createRepeated() => $pb.PbList<Tag>();
  @$core.pragma('dart2js:noInline')
  static Tag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tag>(create);
  static Tag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bucketId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bucketId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBucketId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBucketId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get messengerId => $_getSZ(1);
  @$pb.TagNumber(3)
  set messengerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessengerId() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessengerId() => clearField(3);

  @$pb.TagNumber(4)
  GeoLocation get geoLocation => $_getN(2);
  @$pb.TagNumber(4)
  set geoLocation(GeoLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeoLocation() => $_has(2);
  @$pb.TagNumber(4)
  void clearGeoLocation() => clearField(4);
  @$pb.TagNumber(4)
  GeoLocation ensureGeoLocation() => $_ensure(2);

  @$pb.TagNumber(5)
  Tag_TYPE get tagType => $_getN(3);
  @$pb.TagNumber(5)
  set tagType(Tag_TYPE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTagType() => $_has(3);
  @$pb.TagNumber(5)
  void clearTagType() => clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get dueDate => $_getN(4);
  @$pb.TagNumber(6)
  set dueDate($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDueDate() => $_has(4);
  @$pb.TagNumber(6)
  void clearDueDate() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureDueDate() => $_ensure(4);
}

class FilterKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bucketId', protoName: 'bucketId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  FilterKey._() : super();
  factory FilterKey({
    $core.String? bucketId,
    $core.String? title,
  }) {
    final _result = create();
    if (bucketId != null) {
      _result.bucketId = bucketId;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory FilterKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterKey clone() => FilterKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterKey copyWith(void Function(FilterKey) updates) => super.copyWith((message) => updates(message as FilterKey)) as FilterKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterKey create() => FilterKey._();
  FilterKey createEmptyInstance() => create();
  static $pb.PbList<FilterKey> createRepeated() => $pb.PbList<FilterKey>();
  @$core.pragma('dart2js:noInline')
  static FilterKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterKey>(create);
  static FilterKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bucketId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bucketId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBucketId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBucketId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
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

class VerifyAuthCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyAuthCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  VerifyAuthCodeRequest._() : super();
  factory VerifyAuthCodeRequest({
    $core.String? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory VerifyAuthCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyAuthCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyAuthCodeRequest clone() => VerifyAuthCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyAuthCodeRequest copyWith(void Function(VerifyAuthCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyAuthCodeRequest)) as VerifyAuthCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyAuthCodeRequest create() => VerifyAuthCodeRequest._();
  VerifyAuthCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyAuthCodeRequest> createRepeated() => $pb.PbList<VerifyAuthCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyAuthCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyAuthCodeRequest>(create);
  static VerifyAuthCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class VerifyAuthCodeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyAuthCodeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenticated')
    ..hasRequiredFields = false
  ;

  VerifyAuthCodeResponse._() : super();
  factory VerifyAuthCodeResponse({
    $core.bool? authenticated,
  }) {
    final _result = create();
    if (authenticated != null) {
      _result.authenticated = authenticated;
    }
    return _result;
  }
  factory VerifyAuthCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyAuthCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyAuthCodeResponse clone() => VerifyAuthCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyAuthCodeResponse copyWith(void Function(VerifyAuthCodeResponse) updates) => super.copyWith((message) => updates(message as VerifyAuthCodeResponse)) as VerifyAuthCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyAuthCodeResponse create() => VerifyAuthCodeResponse._();
  VerifyAuthCodeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyAuthCodeResponse> createRepeated() => $pb.PbList<VerifyAuthCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyAuthCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyAuthCodeResponse>(create);
  static VerifyAuthCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get authenticated => $_getBF(0);
  @$pb.TagNumber(1)
  set authenticated($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenticated() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenticated() => clearField(1);
}

