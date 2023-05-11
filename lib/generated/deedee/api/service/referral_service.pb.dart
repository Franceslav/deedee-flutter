///
//  Generated code. Do not modify.
//  source: deedee/api/service/referral_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/referral.pb.dart' as $1;

class ReferralRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReferralRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.referral.service'), createEmptyInstance: create)
    ..aOM<$1.Referral>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referral', subBuilder: $1.Referral.create)
    ..hasRequiredFields = false
  ;

  ReferralRequest._() : super();
  factory ReferralRequest({
    $1.Referral? referral,
  }) {
    final _result = create();
    if (referral != null) {
      _result.referral = referral;
    }
    return _result;
  }
  factory ReferralRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReferralRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReferralRequest clone() => ReferralRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReferralRequest copyWith(void Function(ReferralRequest) updates) => super.copyWith((message) => updates(message as ReferralRequest)) as ReferralRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReferralRequest create() => ReferralRequest._();
  ReferralRequest createEmptyInstance() => create();
  static $pb.PbList<ReferralRequest> createRepeated() => $pb.PbList<ReferralRequest>();
  @$core.pragma('dart2js:noInline')
  static ReferralRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReferralRequest>(create);
  static ReferralRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Referral get referral => $_getN(0);
  @$pb.TagNumber(1)
  set referral($1.Referral v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReferral() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferral() => clearField(1);
  @$pb.TagNumber(1)
  $1.Referral ensureReferral() => $_ensure(0);
}

class ReferralResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReferralResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.referral.service'), createEmptyInstance: create)
    ..pc<$1.Referral>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referrals', $pb.PbFieldType.PM, subBuilder: $1.Referral.create)
    ..hasRequiredFields = false
  ;

  ReferralResponse._() : super();
  factory ReferralResponse({
    $core.Iterable<$1.Referral>? referrals,
  }) {
    final _result = create();
    if (referrals != null) {
      _result.referrals.addAll(referrals);
    }
    return _result;
  }
  factory ReferralResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReferralResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReferralResponse clone() => ReferralResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReferralResponse copyWith(void Function(ReferralResponse) updates) => super.copyWith((message) => updates(message as ReferralResponse)) as ReferralResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReferralResponse create() => ReferralResponse._();
  ReferralResponse createEmptyInstance() => create();
  static $pb.PbList<ReferralResponse> createRepeated() => $pb.PbList<ReferralResponse>();
  @$core.pragma('dart2js:noInline')
  static ReferralResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReferralResponse>(create);
  static ReferralResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Referral> get referrals => $_getList(0);
}

