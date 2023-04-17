///
//  Generated code. Do not modify.
//  source: topic_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'geolocation_service.pb.dart' as $1;

class TopicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopicRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOM<Topic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic', subBuilder: Topic.create)
    ..hasRequiredFields = false
  ;

  TopicRequest._() : super();
  factory TopicRequest({
    Topic? topic,
  }) {
    final _result = create();
    if (topic != null) {
      _result.topic = topic;
    }
    return _result;
  }
  factory TopicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopicRequest clone() => TopicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopicRequest copyWith(void Function(TopicRequest) updates) => super.copyWith((message) => updates(message as TopicRequest)) as TopicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopicRequest create() => TopicRequest._();
  TopicRequest createEmptyInstance() => create();
  static $pb.PbList<TopicRequest> createRepeated() => $pb.PbList<TopicRequest>();
  @$core.pragma('dart2js:noInline')
  static TopicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopicRequest>(create);
  static TopicRequest? _defaultInstance;

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

class TopicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopicResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..pc<Topic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topics', $pb.PbFieldType.PM, subBuilder: Topic.create)
    ..hasRequiredFields = false
  ;

  TopicResponse._() : super();
  factory TopicResponse({
    $core.Iterable<Topic>? topics,
  }) {
    final _result = create();
    if (topics != null) {
      _result.topics.addAll(topics);
    }
    return _result;
  }
  factory TopicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopicResponse clone() => TopicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopicResponse copyWith(void Function(TopicResponse) updates) => super.copyWith((message) => updates(message as TopicResponse)) as TopicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopicResponse create() => TopicResponse._();
  TopicResponse createEmptyInstance() => create();
  static $pb.PbList<TopicResponse> createRepeated() => $pb.PbList<TopicResponse>();
  @$core.pragma('dart2js:noInline')
  static TopicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopicResponse>(create);
  static TopicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Topic> get topics => $_getList(0);
}

class SubtopicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubtopicRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..aOM<Subtopic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopic', subBuilder: Subtopic.create)
    ..hasRequiredFields = false
  ;

  SubtopicRequest._() : super();
  factory SubtopicRequest({
    Subtopic? subtopic,
  }) {
    final _result = create();
    if (subtopic != null) {
      _result.subtopic = subtopic;
    }
    return _result;
  }
  factory SubtopicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubtopicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubtopicRequest clone() => SubtopicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubtopicRequest copyWith(void Function(SubtopicRequest) updates) => super.copyWith((message) => updates(message as SubtopicRequest)) as SubtopicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubtopicRequest create() => SubtopicRequest._();
  SubtopicRequest createEmptyInstance() => create();
  static $pb.PbList<SubtopicRequest> createRepeated() => $pb.PbList<SubtopicRequest>();
  @$core.pragma('dart2js:noInline')
  static SubtopicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubtopicRequest>(create);
  static SubtopicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Subtopic get subtopic => $_getN(0);
  @$pb.TagNumber(1)
  set subtopic(Subtopic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubtopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubtopic() => clearField(1);
  @$pb.TagNumber(1)
  Subtopic ensureSubtopic() => $_ensure(0);
}

class SubtopicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubtopicResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..pc<Subtopic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopic', $pb.PbFieldType.PM, subBuilder: Subtopic.create)
    ..hasRequiredFields = false
  ;

  SubtopicResponse._() : super();
  factory SubtopicResponse({
    $core.Iterable<Subtopic>? subtopic,
  }) {
    final _result = create();
    if (subtopic != null) {
      _result.subtopic.addAll(subtopic);
    }
    return _result;
  }
  factory SubtopicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubtopicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubtopicResponse clone() => SubtopicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubtopicResponse copyWith(void Function(SubtopicResponse) updates) => super.copyWith((message) => updates(message as SubtopicResponse)) as SubtopicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubtopicResponse create() => SubtopicResponse._();
  SubtopicResponse createEmptyInstance() => create();
  static $pb.PbList<SubtopicResponse> createRepeated() => $pb.PbList<SubtopicResponse>();
  @$core.pragma('dart2js:noInline')
  static SubtopicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubtopicResponse>(create);
  static SubtopicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Subtopic> get subtopic => $_getList(0);
}

class Topic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Topic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', $pb.PbFieldType.OU3, protoName: 'topicId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$1.Geolocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $1.Geolocation.create)
    ..hasRequiredFields = false
  ;

  Topic._() : super();
  factory Topic({
    $core.int? topicId,
    $core.String? userId,
    $core.String? title,
    $1.Geolocation? geolocation,
  }) {
    final _result = create();
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
  $core.int get topicId => $_getIZ(0);
  @$pb.TagNumber(1)
  set topicId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $1.Geolocation get geolocation => $_getN(3);
  @$pb.TagNumber(4)
  set geolocation($1.Geolocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeolocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeolocation() => clearField(4);
  @$pb.TagNumber(4)
  $1.Geolocation ensureGeolocation() => $_ensure(3);
}

class Subtopic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Subtopic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopicId', $pb.PbFieldType.OU3, protoName: 'subtopicId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicId', $pb.PbFieldType.OU3, protoName: 'topicId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<$1.Geolocation>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geolocation', subBuilder: $1.Geolocation.create)
    ..hasRequiredFields = false
  ;

  Subtopic._() : super();
  factory Subtopic({
    $core.int? subtopicId,
    $core.int? topicId,
    $core.String? userId,
    $core.String? title,
    $1.Geolocation? geolocation,
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
  $1.Geolocation get geolocation => $_getN(4);
  @$pb.TagNumber(5)
  set geolocation($1.Geolocation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGeolocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearGeolocation() => clearField(5);
  @$pb.TagNumber(5)
  $1.Geolocation ensureGeolocation() => $_ensure(4);
}

