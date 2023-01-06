///
//  Generated code. Do not modify.
//  source: VerificationService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VerifyEmailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyEmailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ipAddress', protoName: 'ipAddress')
    ..hasRequiredFields = false
  ;

  VerifyEmailRequest._() : super();
  factory VerifyEmailRequest({
    $core.String? email,
    $core.String? ipAddress,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (ipAddress != null) {
      _result.ipAddress = ipAddress;
    }
    return _result;
  }
  factory VerifyEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailRequest clone() => VerifyEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailRequest copyWith(void Function(VerifyEmailRequest) updates) => super.copyWith((message) => updates(message as VerifyEmailRequest)) as VerifyEmailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRequest create() => VerifyEmailRequest._();
  VerifyEmailRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailRequest> createRepeated() => $pb.PbList<VerifyEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailRequest>(create);
  static VerifyEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ipAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set ipAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIpAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearIpAddress() => clearField(2);
}

class VerifyEmailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyEmailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'processed')
    ..hasRequiredFields = false
  ;

  VerifyEmailResponse._() : super();
  factory VerifyEmailResponse({
    $core.bool? processed,
  }) {
    final _result = create();
    if (processed != null) {
      _result.processed = processed;
    }
    return _result;
  }
  factory VerifyEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailResponse clone() => VerifyEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailResponse copyWith(void Function(VerifyEmailResponse) updates) => super.copyWith((message) => updates(message as VerifyEmailResponse)) as VerifyEmailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyEmailResponse create() => VerifyEmailResponse._();
  VerifyEmailResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailResponse> createRepeated() => $pb.PbList<VerifyEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailResponse>(create);
  static VerifyEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get processed => $_getBF(0);
  @$pb.TagNumber(1)
  set processed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProcessed() => $_has(0);
  @$pb.TagNumber(1)
  void clearProcessed() => clearField(1);
}

