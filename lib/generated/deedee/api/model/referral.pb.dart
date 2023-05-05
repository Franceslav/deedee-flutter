///
//  Generated code. Do not modify.
//  source: deedee/api/model/referral.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Referral extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Referral', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.referral.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referralId', $pb.PbFieldType.OU6, protoName: 'referralId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referredBy', protoName: 'referredBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  Referral._() : super();
  factory Referral({
    $fixnum.Int64? referralId,
    $core.String? referredBy,
    $core.String? email,
  }) {
    final _result = create();
    if (referralId != null) {
      _result.referralId = referralId;
    }
    if (referredBy != null) {
      _result.referredBy = referredBy;
    }
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory Referral.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Referral.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Referral clone() => Referral()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Referral copyWith(void Function(Referral) updates) => super.copyWith((message) => updates(message as Referral)) as Referral; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Referral create() => Referral._();
  Referral createEmptyInstance() => create();
  static $pb.PbList<Referral> createRepeated() => $pb.PbList<Referral>();
  @$core.pragma('dart2js:noInline')
  static Referral getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Referral>(create);
  static Referral? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get referralId => $_getI64(0);
  @$pb.TagNumber(1)
  set referralId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReferralId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferralId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get referredBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set referredBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReferredBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearReferredBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

