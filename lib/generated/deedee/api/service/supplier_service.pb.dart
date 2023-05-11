///
//  Generated code. Do not modify.
//  source: deedee/api/service/supplier_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/supplier.pb.dart' as $1;

class SupplierRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SupplierRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.user.service'), createEmptyInstance: create)
    ..aOM<$1.Supplier>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supplier', subBuilder: $1.Supplier.create)
    ..hasRequiredFields = false
  ;

  SupplierRequest._() : super();
  factory SupplierRequest({
    $1.Supplier? supplier,
  }) {
    final _result = create();
    if (supplier != null) {
      _result.supplier = supplier;
    }
    return _result;
  }
  factory SupplierRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupplierRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupplierRequest clone() => SupplierRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupplierRequest copyWith(void Function(SupplierRequest) updates) => super.copyWith((message) => updates(message as SupplierRequest)) as SupplierRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupplierRequest create() => SupplierRequest._();
  SupplierRequest createEmptyInstance() => create();
  static $pb.PbList<SupplierRequest> createRepeated() => $pb.PbList<SupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static SupplierRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupplierRequest>(create);
  static SupplierRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier($1.Supplier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => clearField(1);
  @$pb.TagNumber(1)
  $1.Supplier ensureSupplier() => $_ensure(0);
}

class SupplierResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SupplierResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.user.service'), createEmptyInstance: create)
    ..pc<$1.Supplier>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suppliers', $pb.PbFieldType.PM, subBuilder: $1.Supplier.create)
    ..hasRequiredFields = false
  ;

  SupplierResponse._() : super();
  factory SupplierResponse({
    $core.Iterable<$1.Supplier>? suppliers,
  }) {
    final _result = create();
    if (suppliers != null) {
      _result.suppliers.addAll(suppliers);
    }
    return _result;
  }
  factory SupplierResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupplierResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupplierResponse clone() => SupplierResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupplierResponse copyWith(void Function(SupplierResponse) updates) => super.copyWith((message) => updates(message as SupplierResponse)) as SupplierResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupplierResponse create() => SupplierResponse._();
  SupplierResponse createEmptyInstance() => create();
  static $pb.PbList<SupplierResponse> createRepeated() => $pb.PbList<SupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static SupplierResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupplierResponse>(create);
  static SupplierResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Supplier> get suppliers => $_getList(0);
}

