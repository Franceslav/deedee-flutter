///
//  Generated code. Do not modify.
//  source: deedee/api/model/profile.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'contact.pb.dart' as $0;
import 'profile.pbenum.dart';

export 'profile.pbenum.dart';

class Profile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Profile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.profile.model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profileId', $pb.PbFieldType.OU6, protoName: 'profileId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referredBy', protoName: 'referredBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..pc<$0.Contact>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: $0.Contact.create)
    ..e<Profile_Status>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Profile_Status.ACTIVE, valueOf: Profile_Status.valueOf, enumValues: Profile_Status.values)
    ..hasRequiredFields = false
  ;

  Profile._() : super();
  factory Profile({
    $fixnum.Int64? profileId,
    $core.String? referredBy,
    $core.String? username,
    $core.Iterable<$0.Contact>? contacts,
    Profile_Status? status,
  }) {
    final _result = create();
    if (profileId != null) {
      _result.profileId = profileId;
    }
    if (referredBy != null) {
      _result.referredBy = referredBy;
    }
    if (username != null) {
      _result.username = username;
    }
    if (contacts != null) {
      _result.contacts.addAll(contacts);
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Profile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Profile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Profile clone() => Profile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Profile copyWith(void Function(Profile) updates) => super.copyWith((message) => updates(message as Profile)) as Profile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Profile create() => Profile._();
  Profile createEmptyInstance() => create();
  static $pb.PbList<Profile> createRepeated() => $pb.PbList<Profile>();
  @$core.pragma('dart2js:noInline')
  static Profile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Profile>(create);
  static Profile? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get profileId => $_getI64(0);
  @$pb.TagNumber(1)
  set profileId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get referredBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set referredBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReferredBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearReferredBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$0.Contact> get contacts => $_getList(3);

  @$pb.TagNumber(5)
  Profile_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(Profile_Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

