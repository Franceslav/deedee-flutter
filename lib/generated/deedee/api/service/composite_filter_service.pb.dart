///
//  Generated code. Do not modify.
//  source: deedee/api/service/composite_filter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/composite_filter.pb.dart' as $1;

class CompositeFilterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompositeFilterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.service'), createEmptyInstance: create)
    ..aOM<$1.CompositeFilter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compositeFilter', protoName: 'compositeFilter', subBuilder: $1.CompositeFilter.create)
    ..hasRequiredFields = false
  ;

  CompositeFilterRequest._() : super();
  factory CompositeFilterRequest({
    $1.CompositeFilter? compositeFilter,
  }) {
    final _result = create();
    if (compositeFilter != null) {
      _result.compositeFilter = compositeFilter;
    }
    return _result;
  }
  factory CompositeFilterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompositeFilterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompositeFilterRequest clone() => CompositeFilterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompositeFilterRequest copyWith(void Function(CompositeFilterRequest) updates) => super.copyWith((message) => updates(message as CompositeFilterRequest)) as CompositeFilterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompositeFilterRequest create() => CompositeFilterRequest._();
  CompositeFilterRequest createEmptyInstance() => create();
  static $pb.PbList<CompositeFilterRequest> createRepeated() => $pb.PbList<CompositeFilterRequest>();
  @$core.pragma('dart2js:noInline')
  static CompositeFilterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompositeFilterRequest>(create);
  static CompositeFilterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CompositeFilter get compositeFilter => $_getN(0);
  @$pb.TagNumber(1)
  set compositeFilter($1.CompositeFilter v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompositeFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompositeFilter() => clearField(1);
  @$pb.TagNumber(1)
  $1.CompositeFilter ensureCompositeFilter() => $_ensure(0);
}

class CompositeFilterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompositeFilterResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.service'), createEmptyInstance: create)
    ..pc<$1.CompositeFilter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compositeFilters', $pb.PbFieldType.PM, protoName: 'compositeFilters', subBuilder: $1.CompositeFilter.create)
    ..hasRequiredFields = false
  ;

  CompositeFilterResponse._() : super();
  factory CompositeFilterResponse({
    $core.Iterable<$1.CompositeFilter>? compositeFilters,
  }) {
    final _result = create();
    if (compositeFilters != null) {
      _result.compositeFilters.addAll(compositeFilters);
    }
    return _result;
  }
  factory CompositeFilterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompositeFilterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompositeFilterResponse clone() => CompositeFilterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompositeFilterResponse copyWith(void Function(CompositeFilterResponse) updates) => super.copyWith((message) => updates(message as CompositeFilterResponse)) as CompositeFilterResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompositeFilterResponse create() => CompositeFilterResponse._();
  CompositeFilterResponse createEmptyInstance() => create();
  static $pb.PbList<CompositeFilterResponse> createRepeated() => $pb.PbList<CompositeFilterResponse>();
  @$core.pragma('dart2js:noInline')
  static CompositeFilterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompositeFilterResponse>(create);
  static CompositeFilterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.CompositeFilter> get compositeFilters => $_getList(0);
}

class FilterKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKeyRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.service'), createEmptyInstance: create)
    ..aOM<$1.FilterKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKey', protoName: 'filterKey', subBuilder: $1.FilterKey.create)
    ..hasRequiredFields = false
  ;

  FilterKeyRequest._() : super();
  factory FilterKeyRequest({
    $1.FilterKey? filterKey,
  }) {
    final _result = create();
    if (filterKey != null) {
      _result.filterKey = filterKey;
    }
    return _result;
  }
  factory FilterKeyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterKeyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterKeyRequest clone() => FilterKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterKeyRequest copyWith(void Function(FilterKeyRequest) updates) => super.copyWith((message) => updates(message as FilterKeyRequest)) as FilterKeyRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterKeyRequest create() => FilterKeyRequest._();
  FilterKeyRequest createEmptyInstance() => create();
  static $pb.PbList<FilterKeyRequest> createRepeated() => $pb.PbList<FilterKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static FilterKeyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterKeyRequest>(create);
  static FilterKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.FilterKey get filterKey => $_getN(0);
  @$pb.TagNumber(1)
  set filterKey($1.FilterKey v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilterKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterKey() => clearField(1);
  @$pb.TagNumber(1)
  $1.FilterKey ensureFilterKey() => $_ensure(0);
}

class FilterKeyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterKeyResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.compositefilter.service'), createEmptyInstance: create)
    ..pc<$1.FilterKey>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterKeys', $pb.PbFieldType.PM, protoName: 'filterKeys', subBuilder: $1.FilterKey.create)
    ..hasRequiredFields = false
  ;

  FilterKeyResponse._() : super();
  factory FilterKeyResponse({
    $core.Iterable<$1.FilterKey>? filterKeys,
  }) {
    final _result = create();
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
    }
    return _result;
  }
  factory FilterKeyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterKeyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterKeyResponse clone() => FilterKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterKeyResponse copyWith(void Function(FilterKeyResponse) updates) => super.copyWith((message) => updates(message as FilterKeyResponse)) as FilterKeyResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterKeyResponse create() => FilterKeyResponse._();
  FilterKeyResponse createEmptyInstance() => create();
  static $pb.PbList<FilterKeyResponse> createRepeated() => $pb.PbList<FilterKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static FilterKeyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterKeyResponse>(create);
  static FilterKeyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.FilterKey> get filterKeys => $_getList(0);
}

