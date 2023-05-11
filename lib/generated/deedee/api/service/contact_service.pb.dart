///
//  Generated code. Do not modify.
//  source: deedee/api/service/contact_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/contact.pb.dart' as $1;

class ContactRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContactRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.contact.service'), createEmptyInstance: create)
    ..aOM<$1.Contact>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact', subBuilder: $1.Contact.create)
    ..hasRequiredFields = false
  ;

  ContactRequest._() : super();
  factory ContactRequest({
    $1.Contact? contact,
  }) {
    final _result = create();
    if (contact != null) {
      _result.contact = contact;
    }
    return _result;
  }
  factory ContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactRequest clone() => ContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactRequest copyWith(void Function(ContactRequest) updates) => super.copyWith((message) => updates(message as ContactRequest)) as ContactRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactRequest create() => ContactRequest._();
  ContactRequest createEmptyInstance() => create();
  static $pb.PbList<ContactRequest> createRepeated() => $pb.PbList<ContactRequest>();
  @$core.pragma('dart2js:noInline')
  static ContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactRequest>(create);
  static ContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Contact get contact => $_getN(0);
  @$pb.TagNumber(1)
  set contact($1.Contact v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContact() => $_has(0);
  @$pb.TagNumber(1)
  void clearContact() => clearField(1);
  @$pb.TagNumber(1)
  $1.Contact ensureContact() => $_ensure(0);
}

class ContactResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContactResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.contact.service'), createEmptyInstance: create)
    ..pc<$1.Contact>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: $1.Contact.create)
    ..hasRequiredFields = false
  ;

  ContactResponse._() : super();
  factory ContactResponse({
    $core.Iterable<$1.Contact>? contacts,
  }) {
    final _result = create();
    if (contacts != null) {
      _result.contacts.addAll(contacts);
    }
    return _result;
  }
  factory ContactResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactResponse clone() => ContactResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactResponse copyWith(void Function(ContactResponse) updates) => super.copyWith((message) => updates(message as ContactResponse)) as ContactResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContactResponse create() => ContactResponse._();
  ContactResponse createEmptyInstance() => create();
  static $pb.PbList<ContactResponse> createRepeated() => $pb.PbList<ContactResponse>();
  @$core.pragma('dart2js:noInline')
  static ContactResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactResponse>(create);
  static ContactResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Contact> get contacts => $_getList(0);
}

