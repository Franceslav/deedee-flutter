///
//  Generated code. Do not modify.
//  source: request_service_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'timestamp.pb.dart' as $1;

import 'request_service_service.pbenum.dart';

export 'request_service_service.pbenum.dart';

class ServiceRequestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<ServiceRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequest', protoName: 'serviceRequest', subBuilder: ServiceRequest.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  ServiceRequestRequest._() : super();
  factory ServiceRequestRequest({
    ServiceRequest? serviceRequest,
    $core.String? userId,
  }) {
    final _result = create();
    if (serviceRequest != null) {
      _result.serviceRequest = serviceRequest;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory ServiceRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceRequestRequest clone() => ServiceRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceRequestRequest copyWith(void Function(ServiceRequestRequest) updates) => super.copyWith((message) => updates(message as ServiceRequestRequest)) as ServiceRequestRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceRequestRequest create() => ServiceRequestRequest._();
  ServiceRequestRequest createEmptyInstance() => create();
  static $pb.PbList<ServiceRequestRequest> createRepeated() => $pb.PbList<ServiceRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static ServiceRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceRequestRequest>(create);
  static ServiceRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ServiceRequest get serviceRequest => $_getN(0);
  @$pb.TagNumber(1)
  set serviceRequest(ServiceRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceRequest() => clearField(1);
  @$pb.TagNumber(1)
  ServiceRequest ensureServiceRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class ServiceRequestResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequestResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOM<ServiceRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequest', protoName: 'serviceRequest', subBuilder: ServiceRequest.create)
    ..hasRequiredFields = false
  ;

  ServiceRequestResponse._() : super();
  factory ServiceRequestResponse({
    ServiceRequest? serviceRequest,
  }) {
    final _result = create();
    if (serviceRequest != null) {
      _result.serviceRequest = serviceRequest;
    }
    return _result;
  }
  factory ServiceRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceRequestResponse clone() => ServiceRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceRequestResponse copyWith(void Function(ServiceRequestResponse) updates) => super.copyWith((message) => updates(message as ServiceRequestResponse)) as ServiceRequestResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceRequestResponse create() => ServiceRequestResponse._();
  ServiceRequestResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceRequestResponse> createRepeated() => $pb.PbList<ServiceRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceRequestResponse>(create);
  static ServiceRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ServiceRequest get serviceRequest => $_getN(0);
  @$pb.TagNumber(1)
  set serviceRequest(ServiceRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceRequest() => clearField(1);
  @$pb.TagNumber(1)
  ServiceRequest ensureServiceRequest() => $_ensure(0);
}

class ServiceRequestsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequestsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pc<ServiceRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequests', $pb.PbFieldType.PM, protoName: 'serviceRequests', subBuilder: ServiceRequest.create)
    ..hasRequiredFields = false
  ;

  ServiceRequestsResponse._() : super();
  factory ServiceRequestsResponse({
    $core.Iterable<ServiceRequest>? serviceRequests,
  }) {
    final _result = create();
    if (serviceRequests != null) {
      _result.serviceRequests.addAll(serviceRequests);
    }
    return _result;
  }
  factory ServiceRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceRequestsResponse clone() => ServiceRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceRequestsResponse copyWith(void Function(ServiceRequestsResponse) updates) => super.copyWith((message) => updates(message as ServiceRequestsResponse)) as ServiceRequestsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceRequestsResponse create() => ServiceRequestsResponse._();
  ServiceRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceRequestsResponse> createRepeated() => $pb.PbList<ServiceRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceRequestsResponse>(create);
  static ServiceRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ServiceRequest> get serviceRequests => $_getList(0);
}

class GetTopicTitlesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTopicTitlesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topicTitles', protoName: 'topicTitles')
    ..hasRequiredFields = false
  ;

  GetTopicTitlesResponse._() : super();
  factory GetTopicTitlesResponse({
    $core.Iterable<$core.String>? topicTitles,
  }) {
    final _result = create();
    if (topicTitles != null) {
      _result.topicTitles.addAll(topicTitles);
    }
    return _result;
  }
  factory GetTopicTitlesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopicTitlesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopicTitlesResponse clone() => GetTopicTitlesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopicTitlesResponse copyWith(void Function(GetTopicTitlesResponse) updates) => super.copyWith((message) => updates(message as GetTopicTitlesResponse)) as GetTopicTitlesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesResponse create() => GetTopicTitlesResponse._();
  GetTopicTitlesResponse createEmptyInstance() => create();
  static $pb.PbList<GetTopicTitlesResponse> createRepeated() => $pb.PbList<GetTopicTitlesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTopicTitlesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopicTitlesResponse>(create);
  static GetTopicTitlesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get topicTitles => $_getList(0);
}

class ServiceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bucket'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', protoName: 'requestId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId', protoName: 'clientId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$1.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateOfRequest', protoName: 'dateOfRequest', subBuilder: $1.Timestamp.create)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..e<ServiceRequest_Status>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ServiceRequest_Status.PENDING, valueOf: ServiceRequest_Status.valueOf, enumValues: ServiceRequest_Status.values)
    ..hasRequiredFields = false
  ;

  ServiceRequest._() : super();
  factory ServiceRequest({
    $core.String? requestId,
    $core.String? clientId,
    $core.String? description,
    $1.Timestamp? dateOfRequest,
    $core.double? price,
    ServiceRequest_Status? status,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (clientId != null) {
      _result.clientId = clientId;
    }
    if (description != null) {
      _result.description = description;
    }
    if (dateOfRequest != null) {
      _result.dateOfRequest = dateOfRequest;
    }
    if (price != null) {
      _result.price = price;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ServiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceRequest clone() => ServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceRequest copyWith(void Function(ServiceRequest) updates) => super.copyWith((message) => updates(message as ServiceRequest)) as ServiceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceRequest create() => ServiceRequest._();
  ServiceRequest createEmptyInstance() => create();
  static $pb.PbList<ServiceRequest> createRepeated() => $pb.PbList<ServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static ServiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceRequest>(create);
  static ServiceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get dateOfRequest => $_getN(3);
  @$pb.TagNumber(4)
  set dateOfRequest($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateOfRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateOfRequest() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureDateOfRequest() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.double get price => $_getN(4);
  @$pb.TagNumber(6)
  set price($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  ServiceRequest_Status get status => $_getN(5);
  @$pb.TagNumber(7)
  set status(ServiceRequest_Status v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}

