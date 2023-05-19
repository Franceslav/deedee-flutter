///
//  Generated code. Do not modify.
//  source: deedee/api/service/topic_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/subtopic.pb.dart' as $2;
import '../model/topic.pb.dart' as $1;

class TopicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopicRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.topic.service'), createEmptyInstance: create)
    ..aOM<$1.Topic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topic', subBuilder: $1.Topic.create)
    ..hasRequiredFields = false
  ;

  TopicRequest._() : super();
  factory TopicRequest({
    $1.Topic? topic,
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
  $1.Topic get topic => $_getN(0);
  @$pb.TagNumber(1)
  set topic($1.Topic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);
  @$pb.TagNumber(1)
  $1.Topic ensureTopic() => $_ensure(0);
}

class TopicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopicResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.topic.service'), createEmptyInstance: create)
    ..pc<$1.Topic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topics', $pb.PbFieldType.PM, subBuilder: $1.Topic.create)
    ..hasRequiredFields = false
  ;

  TopicResponse._() : super();
  factory TopicResponse({
    $core.Iterable<$1.Topic>? topics,
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
  $core.List<$1.Topic> get topics => $_getList(0);
}

class SubtopicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubtopicRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.topic.service'), createEmptyInstance: create)
    ..aOM<$2.Subtopic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopic', subBuilder: $2.Subtopic.create)
    ..hasRequiredFields = false
  ;

  SubtopicRequest._() : super();
  factory SubtopicRequest({
    $2.Subtopic? subtopic,
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
  $2.Subtopic get subtopic => $_getN(0);
  @$pb.TagNumber(1)
  set subtopic($2.Subtopic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubtopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubtopic() => clearField(1);
  @$pb.TagNumber(1)
  $2.Subtopic ensureSubtopic() => $_ensure(0);
}

class SubtopicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubtopicResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.topic.service'), createEmptyInstance: create)
    ..pc<$2.Subtopic>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtopics', $pb.PbFieldType.PM, subBuilder: $2.Subtopic.create)
    ..hasRequiredFields = false
  ;

  SubtopicResponse._() : super();
  factory SubtopicResponse({
    $core.Iterable<$2.Subtopic>? subtopics,
  }) {
    final _result = create();
    if (subtopics != null) {
      _result.subtopics.addAll(subtopics);
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
  $core.List<$2.Subtopic> get subtopics => $_getList(0);
}

