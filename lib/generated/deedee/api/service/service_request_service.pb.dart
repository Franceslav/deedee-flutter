///
//  Generated code. Do not modify.
//  source: deedee/api/service/service_request_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/service_request.pb.dart' as $1;

class ServiceRequestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.servicerequest.service'), createEmptyInstance: create)
    ..aOM<$1.ServiceRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequest', protoName: 'serviceRequest', subBuilder: $1.ServiceRequest.create)
    ..hasRequiredFields = false
  ;

  ServiceRequestRequest._() : super();
  factory ServiceRequestRequest({
    $1.ServiceRequest? serviceRequest,
  }) {
    final _result = create();
    if (serviceRequest != null) {
      _result.serviceRequest = serviceRequest;
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
  $1.ServiceRequest get serviceRequest => $_getN(0);
  @$pb.TagNumber(1)
  set serviceRequest($1.ServiceRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceRequest() => clearField(1);
  @$pb.TagNumber(1)
  $1.ServiceRequest ensureServiceRequest() => $_ensure(0);
}

class ServiceRequestResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceRequestResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deedee.api.servicerequest.service'), createEmptyInstance: create)
    ..pc<$1.ServiceRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceRequests', $pb.PbFieldType.PM, protoName: 'serviceRequests', subBuilder: $1.ServiceRequest.create)
    ..hasRequiredFields = false
  ;

  ServiceRequestResponse._() : super();
  factory ServiceRequestResponse({
    $core.Iterable<$1.ServiceRequest>? serviceRequests,
  }) {
    final _result = create();
    if (serviceRequests != null) {
      _result.serviceRequests.addAll(serviceRequests);
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
  $core.List<$1.ServiceRequest> get serviceRequests => $_getList(0);
}

