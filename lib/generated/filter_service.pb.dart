///
//  Generated code. Do not modify.
//  source: filter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'topic_service.pb.dart' as $0;

import 'filter_service.pbenum.dart';

export 'filter_service.pbenum.dart';

class FilterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOM<Filter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filter', subBuilder: Filter.create)
    ..hasRequiredFields = false
  ;

  FilterRequest._() : super();
  factory FilterRequest({
    Filter? filter,
  }) {
    final _result = create();
    if (filter != null) {
      _result.filter = filter;
    }
    return _result;
  }
  factory FilterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterRequest clone() => FilterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterRequest copyWith(void Function(FilterRequest) updates) => super.copyWith((message) => updates(message as FilterRequest)) as FilterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterRequest create() => FilterRequest._();
  FilterRequest createEmptyInstance() => create();
  static $pb.PbList<FilterRequest> createRepeated() => $pb.PbList<FilterRequest>();
  @$core.pragma('dart2js:noInline')
  static FilterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterRequest>(create);
  static FilterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Filter get filter => $_getN(0);
  @$pb.TagNumber(1)
  set filter(Filter v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
  @$pb.TagNumber(1)
  Filter ensureFilter() => $_ensure(0);
}

class FilterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOM<Filter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filter', subBuilder: Filter.create)
    ..hasRequiredFields = false
  ;

  FilterResponse._() : super();
  factory FilterResponse({
    Filter? filter,
  }) {
    final _result = create();
    if (filter != null) {
      _result.filter = filter;
    }
    return _result;
  }
  factory FilterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterResponse clone() => FilterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterResponse copyWith(void Function(FilterResponse) updates) => super.copyWith((message) => updates(message as FilterResponse)) as FilterResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterResponse create() => FilterResponse._();
  FilterResponse createEmptyInstance() => create();
  static $pb.PbList<FilterResponse> createRepeated() => $pb.PbList<FilterResponse>();
  @$core.pragma('dart2js:noInline')
  static FilterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterResponse>(create);
  static FilterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Filter get filter => $_getN(0);
  @$pb.TagNumber(1)
  set filter(Filter v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
  @$pb.TagNumber(1)
  Filter ensureFilter() => $_ensure(0);
}

class GetTopicTitlesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
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

class Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Filter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterId', protoName: 'filterId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopic')
    ..pc<FilterKey>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeys', $pb.PbFieldType.PM, protoName: 'filterKeys', subBuilder: FilterKey.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookmarked')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribed')
    ..hasRequiredFields = false
  ;

  Filter._() : super();
  factory Filter({
    $core.String? filterId,
    $core.String? userId,
    $core.String? topic,
    $core.String? subtopic,
    $core.Iterable<FilterKey>? filterKeys,
    $core.bool? bookmarked,
    $core.bool? subscribed,
  }) {
    final _result = create();
    if (filterId != null) {
      _result.filterId = filterId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (subtopic != null) {
      _result.subtopic = subtopic;
    }
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
    }
    if (bookmarked != null) {
      _result.bookmarked = bookmarked;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    return _result;
  }
  factory Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Filter clone() => Filter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Filter copyWith(void Function(Filter) updates) => super.copyWith((message) => updates(message as Filter)) as Filter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Filter create() => Filter._();
  Filter createEmptyInstance() => create();
  static $pb.PbList<Filter> createRepeated() => $pb.PbList<Filter>();
  @$core.pragma('dart2js:noInline')
  static Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Filter>(create);
  static Filter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set filterId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get topic => $_getSZ(2);
  @$pb.TagNumber(3)
  set topic($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get subtopic => $_getSZ(3);
  @$pb.TagNumber(4)
  set subtopic($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubtopic() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtopic() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<FilterKey> get filterKeys => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get bookmarked => $_getBF(5);
  @$pb.TagNumber(6)
  set bookmarked($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBookmarked() => $_has(5);
  @$pb.TagNumber(6)
  void clearBookmarked() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get subscribed => $_getBF(6);
  @$pb.TagNumber(7)
  set subscribed($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSubscribed() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubscribed() => clearField(7);
}

class FilterKeyList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKeyList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..pc<FilterKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeys', $pb.PbFieldType.PM, protoName: 'filterKeys', subBuilder: FilterKey.create)
    ..hasRequiredFields = false
  ;

  FilterKeyList._() : super();
  factory FilterKeyList({
    $core.Iterable<FilterKey>? filterKeys,
  }) {
    final _result = create();
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
    }
    return _result;
  }
  factory FilterKeyList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterKeyList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterKeyList clone() => FilterKeyList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterKeyList copyWith(void Function(FilterKeyList) updates) => super.copyWith((message) => updates(message as FilterKeyList)) as FilterKeyList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterKeyList create() => FilterKeyList._();
  FilterKeyList createEmptyInstance() => create();
  static $pb.PbList<FilterKeyList> createRepeated() => $pb.PbList<FilterKeyList>();
  @$core.pragma('dart2js:noInline')
  static FilterKeyList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterKeyList>(create);
  static FilterKeyList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FilterKey> get filterKeys => $_getList(0);
}

class FilterKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeyId', protoName: 'filterKeyId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopicId', protoName: 'subtopicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selected')
    ..hasRequiredFields = false
  ;

  FilterKey._() : super();
  factory FilterKey({
    $core.String? filterKeyId,
    $core.String? subtopicId,
    $core.String? title,
    $core.bool? selected,
  }) {
    final _result = create();
    if (filterKeyId != null) {
      _result.filterKeyId = filterKeyId;
    }
    if (subtopicId != null) {
      _result.subtopicId = subtopicId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (selected != null) {
      _result.selected = selected;
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
  $core.String get filterKeyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set filterKeyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilterKeyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterKeyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtopicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtopicId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtopicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtopicId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get selected => $_getBF(3);
  @$pb.TagNumber(4)
  set selected($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSelected() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelected() => clearField(4);
}

class GetAllFiltersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAllFiltersRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  GetAllFiltersRequest._() : super();
  factory GetAllFiltersRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetAllFiltersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllFiltersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllFiltersRequest clone() => GetAllFiltersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllFiltersRequest copyWith(void Function(GetAllFiltersRequest) updates) => super.copyWith((message) => updates(message as GetAllFiltersRequest)) as GetAllFiltersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllFiltersRequest create() => GetAllFiltersRequest._();
  GetAllFiltersRequest createEmptyInstance() => create();
  static $pb.PbList<GetAllFiltersRequest> createRepeated() => $pb.PbList<GetAllFiltersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAllFiltersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllFiltersRequest>(create);
  static GetAllFiltersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetFilterKeysRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFilterKeysResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
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

class CompositeFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompositeFilter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compositeFilterId', $pb.PbFieldType.OU6, protoName: 'compositeFilterId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Topic>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic', subBuilder: $0.Topic.create)
    ..m<$core.String, FilterKeyList>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterMap', protoName: 'filterMap', entryClassName: 'CompositeFilter.FilterMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: FilterKeyList.create, packageName: const $pb.PackageName('deedee.service'))
    ..e<CompositeFilter_Status>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: CompositeFilter_Status.BOOKMARKED, valueOf: CompositeFilter_Status.valueOf, enumValues: CompositeFilter_Status.values)
    ..hasRequiredFields = false
  ;

  CompositeFilter._() : super();
  factory CompositeFilter({
    $fixnum.Int64? compositeFilterId,
    $0.Topic? topic,
    $core.Map<$core.String, FilterKeyList>? filterMap,
    CompositeFilter_Status? status,
  }) {
    final _result = create();
    if (compositeFilterId != null) {
      _result.compositeFilterId = compositeFilterId;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (filterMap != null) {
      _result.filterMap.addAll(filterMap);
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory CompositeFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompositeFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompositeFilter clone() => CompositeFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompositeFilter copyWith(void Function(CompositeFilter) updates) => super.copyWith((message) => updates(message as CompositeFilter)) as CompositeFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompositeFilter create() => CompositeFilter._();
  CompositeFilter createEmptyInstance() => create();
  static $pb.PbList<CompositeFilter> createRepeated() => $pb.PbList<CompositeFilter>();
  @$core.pragma('dart2js:noInline')
  static CompositeFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompositeFilter>(create);
  static CompositeFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get compositeFilterId => $_getI64(0);
  @$pb.TagNumber(1)
  set compositeFilterId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompositeFilterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompositeFilterId() => clearField(1);

  @$pb.TagNumber(2)
  $0.Topic get topic => $_getN(1);
  @$pb.TagNumber(2)
  set topic($0.Topic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTopic() => $_has(1);
  @$pb.TagNumber(2)
  void clearTopic() => clearField(2);
  @$pb.TagNumber(2)
  $0.Topic ensureTopic() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, FilterKeyList> get filterMap => $_getMap(2);

  @$pb.TagNumber(4)
  CompositeFilter_Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(CompositeFilter_Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

