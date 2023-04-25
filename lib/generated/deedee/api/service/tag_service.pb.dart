///
//  Generated code. Do not modify.
//  source: deedee/api/service/tag_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/tag.pb.dart' as $1;

class TagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TagRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.tag.service'), createEmptyInstance: create)
    ..aOM<$1.Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: $1.Tag.create)
    ..hasRequiredFields = false
  ;

  TagRequest._() : super();
  factory TagRequest({
    $1.Tag? tag,
  }) {
    final _result = create();
    if (tag != null) {
      _result.tag = tag;
    }
    return _result;
  }
  factory TagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagRequest clone() => TagRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagRequest copyWith(void Function(TagRequest) updates) => super.copyWith((message) => updates(message as TagRequest)) as TagRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagRequest create() => TagRequest._();
  TagRequest createEmptyInstance() => create();
  static $pb.PbList<TagRequest> createRepeated() => $pb.PbList<TagRequest>();
  @$core.pragma('dart2js:noInline')
  static TagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagRequest>(create);
  static TagRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Tag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($1.Tag v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);
  @$pb.TagNumber(1)
  $1.Tag ensureTag() => $_ensure(0);
}

class TagResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TagResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.tag.service'), createEmptyInstance: create)
    ..pc<$1.Tag>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $1.Tag.create)
    ..hasRequiredFields = false
  ;

  TagResponse._() : super();
  factory TagResponse({
    $core.Iterable<$1.Tag>? tags,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory TagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagResponse clone() => TagResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagResponse copyWith(void Function(TagResponse) updates) => super.copyWith((message) => updates(message as TagResponse)) as TagResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagResponse create() => TagResponse._();
  TagResponse createEmptyInstance() => create();
  static $pb.PbList<TagResponse> createRepeated() => $pb.PbList<TagResponse>();
  @$core.pragma('dart2js:noInline')
  static TagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagResponse>(create);
  static TagResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Tag> get tags => $_getList(0);
}

