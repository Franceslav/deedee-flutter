///
//  Generated code. Do not modify.
//  source: request_service_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request_service_service.pb.dart' as $0;
export 'request_service_service.pb.dart';

class ServiceRequestServiceClient extends $grpc.Client {
  static final _$create =
      $grpc.ClientMethod<$0.ServiceRequestRequest, $0.ServiceRequestResponse>(
          '/bucket.ServiceRequestService/create',
          ($0.ServiceRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ServiceRequestResponse.fromBuffer(value));
  static final _$accept =
      $grpc.ClientMethod<$0.ServiceRequestRequest, $0.ServiceRequestResponse>(
          '/bucket.ServiceRequestService/accept',
          ($0.ServiceRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ServiceRequestResponse.fromBuffer(value));
  static final _$change =
      $grpc.ClientMethod<$0.ServiceRequestRequest, $0.ServiceRequestResponse>(
          '/bucket.ServiceRequestService/change',
          ($0.ServiceRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ServiceRequestResponse.fromBuffer(value));
  static final _$delete =
      $grpc.ClientMethod<$0.ServiceRequestRequest, $0.ServiceRequestResponse>(
          '/bucket.ServiceRequestService/delete',
          ($0.ServiceRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ServiceRequestResponse.fromBuffer(value));
  static final _$getAll =
      $grpc.ClientMethod<$0.ServiceRequestRequest, $0.ServiceRequestsResponse>(
          '/bucket.ServiceRequestService/getAll',
          ($0.ServiceRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ServiceRequestsResponse.fromBuffer(value));

  ServiceRequestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ServiceRequestResponse> create(
      $0.ServiceRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceRequestResponse> accept(
      $0.ServiceRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$accept, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceRequestResponse> change(
      $0.ServiceRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$change, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceRequestResponse> delete(
      $0.ServiceRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceRequestsResponse> getAll(
      $0.ServiceRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAll, request, options: options);
  }
}

abstract class ServiceRequestServiceBase extends $grpc.Service {
  $core.String get $name => 'bucket.ServiceRequestService';

  ServiceRequestServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ServiceRequestRequest,
            $0.ServiceRequestResponse>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ServiceRequestRequest.fromBuffer(value),
        ($0.ServiceRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceRequestRequest,
            $0.ServiceRequestResponse>(
        'accept',
        accept_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ServiceRequestRequest.fromBuffer(value),
        ($0.ServiceRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceRequestRequest,
            $0.ServiceRequestResponse>(
        'change',
        change_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ServiceRequestRequest.fromBuffer(value),
        ($0.ServiceRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceRequestRequest,
            $0.ServiceRequestResponse>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ServiceRequestRequest.fromBuffer(value),
        ($0.ServiceRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceRequestRequest,
            $0.ServiceRequestsResponse>(
        'getAll',
        getAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ServiceRequestRequest.fromBuffer(value),
        ($0.ServiceRequestsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ServiceRequestResponse> create_Pre($grpc.ServiceCall call,
      $async.Future<$0.ServiceRequestRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$0.ServiceRequestResponse> accept_Pre($grpc.ServiceCall call,
      $async.Future<$0.ServiceRequestRequest> request) async {
    return accept(call, await request);
  }

  $async.Future<$0.ServiceRequestResponse> change_Pre($grpc.ServiceCall call,
      $async.Future<$0.ServiceRequestRequest> request) async {
    return change(call, await request);
  }

  $async.Future<$0.ServiceRequestResponse> delete_Pre($grpc.ServiceCall call,
      $async.Future<$0.ServiceRequestRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.ServiceRequestsResponse> getAll_Pre($grpc.ServiceCall call,
      $async.Future<$0.ServiceRequestRequest> request) async {
    return getAll(call, await request);
  }

  $async.Future<$0.ServiceRequestResponse> create(
      $grpc.ServiceCall call, $0.ServiceRequestRequest request);
  $async.Future<$0.ServiceRequestResponse> accept(
      $grpc.ServiceCall call, $0.ServiceRequestRequest request);
  $async.Future<$0.ServiceRequestResponse> change(
      $grpc.ServiceCall call, $0.ServiceRequestRequest request);
  $async.Future<$0.ServiceRequestResponse> delete(
      $grpc.ServiceCall call, $0.ServiceRequestRequest request);
  $async.Future<$0.ServiceRequestsResponse> getAll(
      $grpc.ServiceCall call, $0.ServiceRequestRequest request);
}
