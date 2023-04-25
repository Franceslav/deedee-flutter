///
//  Generated code. Do not modify.
//  source: deedee/api/model/subtopic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'geolocation.pb.dart' as $0;

class Subtopic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Subtopic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.topic.model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopicId', $pb.PbFieldType.OU3, protoName: 'subtopicId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', $pb.PbFieldType.OU3, protoName: 'topicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$0.Geolocation>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $0.Geolocation.create)
    ..hasRequiredFields = false
  ;

  Subtopic._() : super();
  factory Subtopic({
    $core.int? subtopicId,
    $core.int? topicId,
    $core.String? userId,
    $core.String? title,
    $0.Geolocation? geolocation,
  }) {
    final _result = create();
    if (subtopicId != null) {
      _result.subtopicId = subtopicId;
    }
    if (topicId != null) {
      _result.topicId = topicId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (geolocation != null) {
      _result.geolocation = geolocation;
    }
    return _result;
  }
  factory Subtopic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Subtopic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Subtopic clone() => Subtopic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Subtopic copyWith(void Function(Subtopic) updates) => super.copyWith((message) => updates(message as Subtopic)) as Subtopic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Subtopic create() => Subtopic._();
  Subtopic createEmptyInstance() => create();
  static $pb.PbList<Subtopic> createRepeated() => $pb.PbList<Subtopic>();
  @$core.pragma('dart2js:noInline')
  static Subtopic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Subtopic>(create);
  static Subtopic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subtopicId => $_getIZ(0);
  @$pb.TagNumber(1)
  set subtopicId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubtopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubtopicId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get topicId => $_getIZ(1);
  @$pb.TagNumber(2)
  set topicId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTopicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTopicId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $0.Geolocation get geolocation => $_getN(4);
  @$pb.TagNumber(5)
  set geolocation($0.Geolocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGeolocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearGeolocation() => clearField(5);
  @$pb.TagNumber(5)
  $0.Geolocation ensureGeolocation() => $_ensure(4);
}

