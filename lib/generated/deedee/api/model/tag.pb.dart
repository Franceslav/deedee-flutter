///
//  Generated code. Do not modify.
//  source: deedee/api/model/tag.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $0;
import 'composite_filter.pb.dart' as $1;
import 'geolocation.pb.dart' as $2;
import 'observation.pb.dart' as $3;
import 'tag.pbenum.dart';

export 'tag.pbenum.dart';

class Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tag', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.tag.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagId', $pb.PbFieldType.OU6, protoName: 'tagId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdBy', $pb.PbFieldType.OU6, protoName: 'createdBy', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$1.CompositeFilter>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compositeFilter', protoName: 'compositeFilter', subBuilder: $1.CompositeFilter.create)
    ..aOM<$2.Geolocation>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $2.Geolocation.create)
    ..e<Tag_Type>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Tag_Type.CLIENT, valueOf: Tag_Type.valueOf, enumValues: Tag_Type.values)
    ..e<Tag_Status>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Tag_Status.BOOKMARKED, valueOf: Tag_Status.valueOf, enumValues: Tag_Status.values)
    ..pc<$3.Observation>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'observations', $pb.PbFieldType.PM, subBuilder: $3.Observation.create)
    ..hasRequiredFields = false
  ;

  Tag._() : super();
  factory Tag({
    $fixnum.Int64? tagId,
    $fixnum.Int64? createdBy,
    $0.Timestamp? createdAt,
    $1.CompositeFilter? compositeFilter,
    $2.Geolocation? geolocation,
    Tag_Type? type,
    Tag_Status? status,
    $core.Iterable<$3.Observation>? observations,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (createdBy != null) {
      _result.createdBy = createdBy;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (compositeFilter != null) {
      _result.compositeFilter = compositeFilter;
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
    if (observations != null) {
      _result.observations.addAll(observations);
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
  $fixnum.Int64 get tagId => $_getI64(0);
  @$pb.TagNumber(1)
  set tagId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdBy => $_getI64(1);
  @$pb.TagNumber(2)
  set createdBy($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedBy() => clearField(2);

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

  @$pb.TagNumber(4)
  $1.CompositeFilter get compositeFilter => $_getN(3);
  @$pb.TagNumber(4)
  set compositeFilter($1.CompositeFilter v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompositeFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompositeFilter() => clearField(4);
  @$pb.TagNumber(4)
  $1.CompositeFilter ensureCompositeFilter() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Geolocation get geolocation => $_getN(4);
  @$pb.TagNumber(5)
  set geolocation($2.Geolocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGeolocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearGeolocation() => clearField(5);
  @$pb.TagNumber(5)
  $2.Geolocation ensureGeolocation() => $_ensure(4);

  @$pb.TagNumber(6)
  Tag_Type get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(Tag_Type v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  Tag_Status get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(Tag_Status v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$3.Observation> get observations => $_getList(7);
}

