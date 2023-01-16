///
//  Generated code. Do not modify.
//  source: AccountService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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

