///
//  Generated code. Do not modify.
//  source: FilterService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'AccountService.pbenum.dart' as $0;

class FilterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FilterRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOM<Filter>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter',
        subBuilder: Filter.create)
    ..e<$0.ACCOUNT_TYPE>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accountType',
        $pb.PbFieldType.OE,
        protoName: 'accountType',
        defaultOrMaker: $0.ACCOUNT_TYPE.BUY,
        valueOf: $0.ACCOUNT_TYPE.valueOf,
        enumValues: $0.ACCOUNT_TYPE.values)
    ..hasRequiredFields = false;

  FilterRequest._() : super();
  factory FilterRequest({
    Filter? filter,
    $0.ACCOUNT_TYPE? accountType,
  }) {
    final _result = create();
    if (filter != null) {
      _result.filter = filter;
    }
    if (accountType != null) {
      _result.accountType = accountType;
    }
    return _result;
  }
  factory FilterRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FilterRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FilterRequest clone() => FilterRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FilterRequest copyWith(void Function(FilterRequest) updates) =>
      super.copyWith((message) => updates(message as FilterRequest))
          as FilterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterRequest create() => FilterRequest._();
  FilterRequest createEmptyInstance() => create();
  static $pb.PbList<FilterRequest> createRepeated() =>
      $pb.PbList<FilterRequest>();
  @$core.pragma('dart2js:noInline')
  static FilterRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FilterRequest>(create);
  static FilterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Filter get filter => $_getN(0);
  @$pb.TagNumber(1)
  set filter(Filter v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
  @$pb.TagNumber(1)
  Filter ensureFilter() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.ACCOUNT_TYPE get accountType => $_getN(1);
  @$pb.TagNumber(2)
  set accountType($0.ACCOUNT_TYPE v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAccountType() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountType() => clearField(2);
}

class FilterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FilterResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOM<Filter>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter',
        subBuilder: Filter.create)
    ..hasRequiredFields = false;

  FilterResponse._() : super();
  factory FilterResponse({
    Filter? filter,
  }) {
    final _result = create();
    if (filter != null) {
      _result.filter = filter;
    }
    return _result;
  }
  factory FilterResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FilterResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FilterResponse clone() => FilterResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FilterResponse copyWith(void Function(FilterResponse) updates) =>
      super.copyWith((message) => updates(message as FilterResponse))
          as FilterResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterResponse create() => FilterResponse._();
  FilterResponse createEmptyInstance() => create();
  static $pb.PbList<FilterResponse> createRepeated() =>
      $pb.PbList<FilterResponse>();
  @$core.pragma('dart2js:noInline')
  static FilterResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FilterResponse>(create);
  static FilterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Filter get filter => $_getN(0);
  @$pb.TagNumber(1)
  set filter(Filter v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
  @$pb.TagNumber(1)
  Filter ensureFilter() => $_ensure(0);
}

class GetFilterKeysRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetFilterKeysRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicId',
        protoName: 'topicId')
    ..hasRequiredFields = false;

  GetFilterKeysRequest._() : super();
  factory GetFilterKeysRequest({
    $core.String? topicId,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
    }
    return _result;
  }
  factory GetFilterKeysRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetFilterKeysRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetFilterKeysRequest clone() =>
      GetFilterKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetFilterKeysRequest copyWith(void Function(GetFilterKeysRequest) updates) =>
      super.copyWith((message) => updates(message as GetFilterKeysRequest))
          as GetFilterKeysRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysRequest create() => GetFilterKeysRequest._();
  GetFilterKeysRequest createEmptyInstance() => create();
  static $pb.PbList<GetFilterKeysRequest> createRepeated() =>
      $pb.PbList<GetFilterKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFilterKeysRequest>(create);
  static GetFilterKeysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set topicId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);
}

class GetFilterKeysResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetFilterKeysResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..pc<FilterKey>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterKeys',
        $pb.PbFieldType.PM,
        protoName: 'filterKeys',
        subBuilder: FilterKey.create)
    ..hasRequiredFields = false;

  GetFilterKeysResponse._() : super();
  factory GetFilterKeysResponse({
    $core.Iterable<FilterKey>? filterKeys,
  }) {
    final _result = create();
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
    }
    return _result;
  }
  factory GetFilterKeysResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetFilterKeysResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetFilterKeysResponse clone() =>
      GetFilterKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetFilterKeysResponse copyWith(
          void Function(GetFilterKeysResponse) updates) =>
      super.copyWith((message) => updates(message as GetFilterKeysResponse))
          as GetFilterKeysResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysResponse create() => GetFilterKeysResponse._();
  GetFilterKeysResponse createEmptyInstance() => create();
  static $pb.PbList<GetFilterKeysResponse> createRepeated() =>
      $pb.PbList<GetFilterKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFilterKeysResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFilterKeysResponse>(create);
  static GetFilterKeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FilterKey> get filterKeys => $_getList(0);
}

class GetAllFiltersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetAllFiltersRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        protoName: 'userId')
    ..hasRequiredFields = false;

  GetAllFiltersRequest._() : super();
  factory GetAllFiltersRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetAllFiltersRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetAllFiltersRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetAllFiltersRequest clone() =>
      GetAllFiltersRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetAllFiltersRequest copyWith(void Function(GetAllFiltersRequest) updates) =>
      super.copyWith((message) => updates(message as GetAllFiltersRequest))
          as GetAllFiltersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllFiltersRequest create() => GetAllFiltersRequest._();
  GetAllFiltersRequest createEmptyInstance() => create();
  static $pb.PbList<GetAllFiltersRequest> createRepeated() =>
      $pb.PbList<GetAllFiltersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAllFiltersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllFiltersRequest>(create);
  static GetAllFiltersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Filter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterId',
        protoName: 'filterId')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        protoName: 'userId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topic')
    ..pc<FilterKey>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterKeys',
        $pb.PbFieldType.PM,
        protoName: 'filterKeys',
        subBuilder: FilterKey.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bookmarked')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscribed')
    ..hasRequiredFields = false;

  Filter._() : super();
  factory Filter({
    $core.String? filterId,
    $core.String? userId,
    $core.String? topic,
    $core.Iterable<FilterKey>? filterKeys,
    $core.bool? bookmarked,
    $core.bool? subscribed,
  }) {
    final _result = create();
    if (filterId != null) {
      _result.filterId = filterId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (filterKeys != null) {
      _result.filterKeys.addAll(filterKeys);
    }
    if (bookmarked != null) {
      _result.bookmarked = bookmarked;
    }
    if (subscribed != null) {
      _result.subscribed = subscribed;
    }
    return _result;
  }
  factory Filter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Filter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Filter clone() => Filter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Filter copyWith(void Function(Filter) updates) =>
      super.copyWith((message) => updates(message as Filter))
          as Filter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Filter create() => Filter._();
  Filter createEmptyInstance() => create();
  static $pb.PbList<Filter> createRepeated() => $pb.PbList<Filter>();
  @$core.pragma('dart2js:noInline')
  static Filter getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Filter>(create);
  static Filter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set filterId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get topic => $_getSZ(2);
  @$pb.TagNumber(3)
  set topic($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<FilterKey> get filterKeys => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get bookmarked => $_getBF(4);
  @$pb.TagNumber(5)
  set bookmarked($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBookmarked() => $_has(4);
  @$pb.TagNumber(5)
  void clearBookmarked() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get subscribed => $_getBF(5);
  @$pb.TagNumber(6)
  set subscribed($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSubscribed() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscribed() => clearField(6);
}

class FilterKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FilterKey',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'topic'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicId',
        protoName: 'topicId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  FilterKey._() : super();
  factory FilterKey({
    $core.String? topicId,
    $core.String? title,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory FilterKey.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FilterKey.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FilterKey clone() => FilterKey()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FilterKey copyWith(void Function(FilterKey) updates) =>
      super.copyWith((message) => updates(message as FilterKey))
          as FilterKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterKey create() => FilterKey._();
  FilterKey createEmptyInstance() => create();
  static $pb.PbList<FilterKey> createRepeated() => $pb.PbList<FilterKey>();
  @$core.pragma('dart2js:noInline')
  static FilterKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterKey>(create);
  static FilterKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set topicId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}
