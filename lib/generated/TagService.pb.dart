///
//  Generated code. Do not modify.
//  source: TagService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'LocationService.pb.dart' as $0;
import 'timestamp.pb.dart' as $2;

import 'TagService.pbenum.dart';

export 'TagService.pbenum.dart';

class GetBookmarkTagsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBookmarkTagsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookmarkId', protoName: 'bookmarkId')
    ..hasRequiredFields = false
  ;

  GetBookmarkTagsRequest._() : super();
  factory GetBookmarkTagsRequest({
    $core.String? bookmarkId,
  }) {
    final _result = create();
    if (bookmarkId != null) {
      _result.bookmarkId = bookmarkId;
    }
    return _result;
  }
  factory GetBookmarkTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBookmarkTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBookmarkTagsRequest clone() => GetBookmarkTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBookmarkTagsRequest copyWith(void Function(GetBookmarkTagsRequest) updates) => super.copyWith((message) => updates(message as GetBookmarkTagsRequest)) as GetBookmarkTagsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBookmarkTagsRequest create() => GetBookmarkTagsRequest._();
  GetBookmarkTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBookmarkTagsRequest> createRepeated() => $pb.PbList<GetBookmarkTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBookmarkTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBookmarkTagsRequest>(create);
  static GetBookmarkTagsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bookmarkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bookmarkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBookmarkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBookmarkId() => clearField(1);
}

class GetBookmarkTagsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBookmarkTagsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..pc<Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  GetBookmarkTagsResponse._() : super();
  factory GetBookmarkTagsResponse({
    $core.Iterable<Tag>? tags,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory GetBookmarkTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBookmarkTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBookmarkTagsResponse clone() => GetBookmarkTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBookmarkTagsResponse copyWith(void Function(GetBookmarkTagsResponse) updates) => super.copyWith((message) => updates(message as GetBookmarkTagsResponse)) as GetBookmarkTagsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBookmarkTagsResponse create() => GetBookmarkTagsResponse._();
  GetBookmarkTagsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBookmarkTagsResponse> createRepeated() => $pb.PbList<GetBookmarkTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBookmarkTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBookmarkTagsResponse>(create);
  static GetBookmarkTagsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Tag> get tags => $_getList(0);
}

class TopUpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopUpRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  TopUpRequest._() : super();
  factory TopUpRequest({
    $core.double? amount,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory TopUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopUpRequest clone() => TopUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopUpRequest copyWith(void Function(TopUpRequest) updates) => super.copyWith((message) => updates(message as TopUpRequest)) as TopUpRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopUpRequest create() => TopUpRequest._();
  TopUpRequest createEmptyInstance() => create();
  static $pb.PbList<TopUpRequest> createRepeated() => $pb.PbList<TopUpRequest>();
  @$core.pragma('dart2js:noInline')
  static TopUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopUpRequest>(create);
  static TopUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class TopUpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopUpResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  TopUpResponse._() : super();
  factory TopUpResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory TopUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopUpResponse clone() => TopUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopUpResponse copyWith(void Function(TopUpResponse) updates) => super.copyWith((message) => updates(message as TopUpResponse)) as TopUpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopUpResponse create() => TopUpResponse._();
  TopUpResponse createEmptyInstance() => create();
  static $pb.PbList<TopUpResponse> createRepeated() => $pb.PbList<TopUpResponse>();
  @$core.pragma('dart2js:noInline')
  static TopUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopUpResponse>(create);
  static TopUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class GetTopicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', protoName: 'topicId')
    ..e<Tag_TYPE>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagType', $pb.PbFieldType.OE, protoName: 'tagType', defaultOrMaker: Tag_TYPE.BUY, valueOf: Tag_TYPE.valueOf, enumValues: Tag_TYPE.values)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters')
    ..hasRequiredFields = false
  ;

  GetTopicRequest._() : super();
  factory GetTopicRequest({
    $core.String? topicId,
    Tag_TYPE? tagType,
    $core.Iterable<$core.String>? filters,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
    }
    if (tagType != null) {
      _result.tagType = tagType;
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    return _result;
  }
  factory GetTopicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopicRequest clone() => GetTopicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopicRequest copyWith(void Function(GetTopicRequest) updates) => super.copyWith((message) => updates(message as GetTopicRequest)) as GetTopicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTopicRequest create() => GetTopicRequest._();
  GetTopicRequest createEmptyInstance() => create();
  static $pb.PbList<GetTopicRequest> createRepeated() => $pb.PbList<GetTopicRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTopicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopicRequest>(create);
  static GetTopicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set topicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);

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

class GetTopicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOM<Topic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic', subBuilder: Topic.create)
    ..hasRequiredFields = false
  ;

  GetTopicResponse._() : super();
  factory GetTopicResponse({
    Topic? topic,
  }) {
    final _result = create();
    if (topic != null) {
      _result.topic = topic;
    }
    return _result;
  }
  factory GetTopicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopicResponse clone() => GetTopicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopicResponse copyWith(void Function(GetTopicResponse) updates) => super.copyWith((message) => updates(message as GetTopicResponse)) as GetTopicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTopicResponse create() => GetTopicResponse._();
  GetTopicResponse createEmptyInstance() => create();
  static $pb.PbList<GetTopicResponse> createRepeated() => $pb.PbList<GetTopicResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTopicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopicResponse>(create);
  static GetTopicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Topic get topic => $_getN(0);
  @$pb.TagNumber(1)
  set topic(Topic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);
  @$pb.TagNumber(1)
  Topic ensureTopic() => $_ensure(0);
}

class PlaceTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaceTagRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaceTagResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', protoName: 'topicId')
    ..hasRequiredFields = false
  ;

  GetFilterKeysRequest._() : super();
  factory GetFilterKeysRequest({
    $core.String? topicId,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
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
  $core.String get topicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set topicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);
}

class GetFilterKeysResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..pc<FilterKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeys', $pb.PbFieldType.PM, protoName: 'filterKeys', subBuilder: FilterKey.create)
    ..hasRequiredFields = false
  ;

  GetFilterKeysResponse._() : super();
  factory GetFilterKeysResponse({
    $core.Iterable<FilterKey>? filterKeys,
  }) {
    final _result = create();
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
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
  $core.List<FilterKey> get filterKeys => $_getList(0);
}

class Topic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Topic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..pc<Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: Tag.create)
    ..hasRequiredFields = false
  ;

  Topic._() : super();
  factory Topic({
    $core.Iterable<Tag>? tags,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory Topic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Topic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Topic clone() => Topic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Topic copyWith(void Function(Topic) updates) => super.copyWith((message) => updates(message as Topic)) as Topic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Topic create() => Topic._();
  Topic createEmptyInstance() => create();
  static $pb.PbList<Topic> createRepeated() => $pb.PbList<Topic>();
  @$core.pragma('dart2js:noInline')
  static Topic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Topic>(create);
  static Topic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Tag> get tags => $_getList(0);
}

class Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tag', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagId', protoName: 'tagId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', protoName: 'topicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..aOM<$0.GeoLocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: $0.GeoLocation.create)
    ..e<Tag_TYPE>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagType', $pb.PbFieldType.OE, protoName: 'tagType', defaultOrMaker: Tag_TYPE.BUY, valueOf: Tag_TYPE.valueOf, enumValues: Tag_TYPE.values)
    ..aOM<$2.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', protoName: 'dueDate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Tag._() : super();
  factory Tag({
    $core.String? tagId,
    $core.String? topicId,
    $core.String? messengerId,
    $0.GeoLocation? geoLocation,
    Tag_TYPE? tagType,
    $2.Timestamp? dueDate,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (topicId != null) {
      _result.topicId = topicId;
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
  $core.String get tagId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tagId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get topicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set topicId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTopicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTopicId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get messengerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set messengerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessengerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessengerId() => clearField(3);

  @$pb.TagNumber(4)
  $0.GeoLocation get geoLocation => $_getN(3);
  @$pb.TagNumber(4)
  set geoLocation($0.GeoLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeoLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeoLocation() => clearField(4);
  @$pb.TagNumber(4)
  $0.GeoLocation ensureGeoLocation() => $_ensure(3);

  @$pb.TagNumber(5)
  Tag_TYPE get tagType => $_getN(4);
  @$pb.TagNumber(5)
  set tagType(Tag_TYPE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTagType() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagType() => clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get dueDate => $_getN(5);
  @$pb.TagNumber(6)
  set dueDate($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDueDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDueDate() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureDueDate() => $_ensure(5);
}

class FilterKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', protoName: 'topicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  FilterKey._() : super();
  factory FilterKey({
    $core.String? topicId,
    $core.String? title,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
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
  $core.String get topicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set topicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}

class VerifyAuthCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyAuthCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyAuthCodeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
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

class GetTopicTitlesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
    ..aOM<$0.GeoLocation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: $0.GeoLocation.create)
    ..hasRequiredFields = false
  ;

  GetTopicTitlesRequest._() : super();
  factory GetTopicTitlesRequest({
    $0.GeoLocation? geoLocation,
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
  $0.GeoLocation get geoLocation => $_getN(0);
  @$pb.TagNumber(1)
  set geoLocation($0.GeoLocation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeoLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeoLocation() => clearField(1);
  @$pb.TagNumber(1)
  $0.GeoLocation ensureGeoLocation() => $_ensure(0);
}

class GetTopicTitlesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'topic'), createEmptyInstance: create)
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

