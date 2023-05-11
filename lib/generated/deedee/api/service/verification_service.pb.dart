///
//  Generated code. Do not modify.
//  source: deedee/api/service/verification_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/verification.pb.dart' as $1;

class VerificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.verification.service'), createEmptyInstance: create)
    ..aOM<$1.Verification>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verification', subBuilder: $1.Verification.create)
    ..hasRequiredFields = false
  ;

  VerificationRequest._() : super();
  factory VerificationRequest({
    $1.Verification? verification,
  }) {
    final _result = create();
    if (verification != null) {
      _result.verification = verification;
    }
    return _result;
  }
  factory VerificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationRequest clone() => VerificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationRequest copyWith(void Function(VerificationRequest) updates) => super.copyWith((message) => updates(message as VerificationRequest)) as VerificationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationRequest create() => VerificationRequest._();
  VerificationRequest createEmptyInstance() => create();
  static $pb.PbList<VerificationRequest> createRepeated() => $pb.PbList<VerificationRequest>();
  @$core.pragma('dart2js:noInline')
  static VerificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationRequest>(create);
  static VerificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Verification get verification => $_getN(0);
  @$pb.TagNumber(1)
  set verification($1.Verification v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerification() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerification() => clearField(1);
  @$pb.TagNumber(1)
  $1.Verification ensureVerification() => $_ensure(0);
}

class VerificationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.verification.service'), createEmptyInstance: create)
    ..pc<$1.Verification>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifications', $pb.PbFieldType.PM, subBuilder: $1.Verification.create)
    ..hasRequiredFields = false
  ;

  VerificationResponse._() : super();
  factory VerificationResponse({
    $core.Iterable<$1.Verification>? verifications,
  }) {
    final _result = create();
    if (verifications != null) {
      _result.verifications.addAll(verifications);
    }
    return _result;
  }
  factory VerificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationResponse clone() => VerificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationResponse copyWith(void Function(VerificationResponse) updates) => super.copyWith((message) => updates(message as VerificationResponse)) as VerificationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationResponse create() => VerificationResponse._();
  VerificationResponse createEmptyInstance() => create();
  static $pb.PbList<VerificationResponse> createRepeated() => $pb.PbList<VerificationResponse>();
  @$core.pragma('dart2js:noInline')
  static VerificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationResponse>(create);
  static VerificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Verification> get verifications => $_getList(0);
}

