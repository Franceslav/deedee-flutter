///
//  Generated code. Do not modify.
//  source: deedee/api/model/composite_filter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'composite_filter.pbenum.dart';
import 'topic.pb.dart' as $0;

export 'composite_filter.pbenum.dart';

class CompositeFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompositeFilter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compositeFilterId', $pb.PbFieldType.OU6, protoName: 'compositeFilterId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOM<$0.Topic>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic', subBuilder: $0.Topic.create)
    ..m<$core.String, FilterKeyList>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterMap', protoName: 'filterMap', entryClassName: 'CompositeFilter.FilterMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: FilterKeyList.create, packageName: const $pb.PackageName('deedee.api.compositefilter.model'))
    ..e<CompositeFilter_Status>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: CompositeFilter_Status.FAVORITE, valueOf: CompositeFilter_Status.valueOf, enumValues: CompositeFilter_Status.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  CompositeFilter._() : super();
  factory CompositeFilter({
    $fixnum.Int64? compositeFilterId,
    $core.String? userId,
    $0.Topic? topic,
    $core.Map<$core.String, FilterKeyList>? filterMap,
    CompositeFilter_Status? status,
    $core.String? title,
  }) {
    final _result = create();
    if (compositeFilterId != null) {
      _result.compositeFilterId = compositeFilterId;
    }
    if (userId != null) {
      _result.userId = userId;
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
    if (title != null) {
      _result.title = title;
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
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $0.Topic get topic => $_getN(2);
  @$pb.TagNumber(3)
  set topic($0.Topic v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => clearField(3);
  @$pb.TagNumber(3)
  $0.Topic ensureTopic() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.Map<$core.String, FilterKeyList> get filterMap => $_getMap(3);

  @$pb.TagNumber(5)
  CompositeFilter_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(CompositeFilter_Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);
}

class FilterKeyList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKeyList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.model'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.model'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeyId', protoName: 'filterKeyId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopicId', protoName: 'subtopicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', protoName: 'topicId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selected')
    ..hasRequiredFields = false
  ;

  FilterKey._() : super();
  factory FilterKey({
    $core.String? filterKeyId,
    $core.String? subtopicId,
    $core.String? topicId,
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
    if (topicId != null) {
      _result.topicId = topicId;
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
  $core.String get topicId => $_getSZ(2);
  @$pb.TagNumber(3)
  set topicId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTopicId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopicId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get selected => $_getBF(4);
  @$pb.TagNumber(5)
  set selected($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSelected() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelected() => clearField(5);
}

