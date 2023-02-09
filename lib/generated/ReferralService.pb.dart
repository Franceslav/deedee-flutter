///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetUserReferralsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserReferralsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  GetUserReferralsRequest._() : super();
  factory GetUserReferralsRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory GetUserReferralsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserReferralsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserReferralsRequest clone() => GetUserReferralsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserReferralsRequest copyWith(void Function(GetUserReferralsRequest) updates) => super.copyWith((message) => updates(message as GetUserReferralsRequest)) as GetUserReferralsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserReferralsRequest create() => GetUserReferralsRequest._();
  GetUserReferralsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserReferralsRequest> createRepeated() => $pb.PbList<GetUserReferralsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserReferralsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserReferralsRequest>(create);
  static GetUserReferralsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class GetUserReferralsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserReferralsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pc<UserReferral>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userReferral', $pb.PbFieldType.PM, protoName: 'userReferral', subBuilder: UserReferral.create)
    ..hasRequiredFields = false
  ;

  GetUserReferralsResponse._() : super();
  factory GetUserReferralsResponse({
    $core.Iterable<UserReferral>? userReferral,
  }) {
    final _result = create();
    if (userReferral != null) {
      _result.userReferral.addAll(userReferral);
    }
    return _result;
  }
  factory GetUserReferralsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserReferralsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserReferralsResponse clone() => GetUserReferralsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserReferralsResponse copyWith(void Function(GetUserReferralsResponse) updates) => super.copyWith((message) => updates(message as GetUserReferralsResponse)) as GetUserReferralsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserReferralsResponse create() => GetUserReferralsResponse._();
  GetUserReferralsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserReferralsResponse> createRepeated() => $pb.PbList<GetUserReferralsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserReferralsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserReferralsResponse>(create);
  static GetUserReferralsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserReferral> get userReferral => $_getList(0);
}

class UserReferral extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserReferral', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'placedTagsAmount', $pb.PbFieldType.O3, protoName: 'placedTagsAmount')
    ..hasRequiredFields = false
  ;

  UserReferral._() : super();
  factory UserReferral({
    $core.String? email,
    $core.int? placedTagsAmount,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (placedTagsAmount != null) {
      _result.placedTagsAmount = placedTagsAmount;
    }
    return _result;
  }
  factory UserReferral.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserReferral.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserReferral clone() => UserReferral()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserReferral copyWith(void Function(UserReferral) updates) => super.copyWith((message) => updates(message as UserReferral)) as UserReferral; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserReferral create() => UserReferral._();
  UserReferral createEmptyInstance() => create();
  static $pb.PbList<UserReferral> createRepeated() => $pb.PbList<UserReferral>();
  @$core.pragma('dart2js:noInline')
  static UserReferral getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserReferral>(create);
  static UserReferral? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get placedTagsAmount => $_getIZ(1);
  @$pb.TagNumber(2)
  set placedTagsAmount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlacedTagsAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlacedTagsAmount() => clearField(2);
}

