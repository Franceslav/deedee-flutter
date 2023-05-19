///
//  Generated code. Do not modify.
//  source: deedee/api/service/supplier_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'supplier_service.pb.dart' as $0;

export 'supplier_service.pb.dart';

class SupplierServiceClient extends $grpc.Client {
  static final _$createSupplierEntity =
      $grpc.ClientMethod<$0.SupplierRequest, $0.SupplierResponse>(
          '/deedee.api.user.service.SupplierService/createSupplierEntity',
          ($0.SupplierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SupplierResponse.fromBuffer(value));
  static final _$modifySupplierEntity =
      $grpc.ClientMethod<$0.SupplierRequest, $0.SupplierResponse>(
          '/deedee.api.user.service.SupplierService/modifySupplierEntity',
          ($0.SupplierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SupplierResponse.fromBuffer(value));
  static final _$deleteSupplierEntity =
      $grpc.ClientMethod<$0.SupplierRequest, $0.SupplierResponse>(
          '/deedee.api.user.service.SupplierService/deleteSupplierEntity',
          ($0.SupplierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SupplierResponse.fromBuffer(value));
  static final _$getSupplierEntities =
      $grpc.ClientMethod<$0.SupplierRequest, $0.SupplierResponse>(
          '/deedee.api.user.service.SupplierService/getSupplierEntities',
          ($0.SupplierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SupplierResponse.fromBuffer(value));
  static final _$getSupplierEntityById =
      $grpc.ClientMethod<$0.SupplierRequest, $0.SupplierResponse>(
          '/deedee.api.user.service.SupplierService/getSupplierEntityById',
          ($0.SupplierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SupplierResponse.fromBuffer(value));

  SupplierServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SupplierResponse> createSupplierEntity(
      $0.SupplierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSupplierEntity, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupplierResponse> modifySupplierEntity(
      $0.SupplierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$modifySupplierEntity, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupplierResponse> deleteSupplierEntity(
      $0.SupplierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSupplierEntity, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupplierResponse> getSupplierEntities(
      $0.SupplierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSupplierEntities, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupplierResponse> getSupplierEntityById(
      $0.SupplierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSupplierEntityById, request, options: options);
  }
}

abstract class SupplierServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.user.service.SupplierService';

  SupplierServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SupplierRequest, $0.SupplierResponse>(
        'createSupplierEntity',
        createSupplierEntity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupplierRequest.fromBuffer(value),
        ($0.SupplierResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupplierRequest, $0.SupplierResponse>(
        'modifySupplierEntity',
        modifySupplierEntity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupplierRequest.fromBuffer(value),
        ($0.SupplierResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupplierRequest, $0.SupplierResponse>(
        'deleteSupplierEntity',
        deleteSupplierEntity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupplierRequest.fromBuffer(value),
        ($0.SupplierResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupplierRequest, $0.SupplierResponse>(
        'getSupplierEntities',
        getSupplierEntities_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupplierRequest.fromBuffer(value),
        ($0.SupplierResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupplierRequest, $0.SupplierResponse>(
        'getSupplierEntityById',
        getSupplierEntityById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupplierRequest.fromBuffer(value),
        ($0.SupplierResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SupplierResponse> createSupplierEntity_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SupplierRequest> request) async {
    return createSupplierEntity(call, await request);
  }

  $async.Future<$0.SupplierResponse> modifySupplierEntity_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SupplierRequest> request) async {
    return modifySupplierEntity(call, await request);
  }

  $async.Future<$0.SupplierResponse> deleteSupplierEntity_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SupplierRequest> request) async {
    return deleteSupplierEntity(call, await request);
  }

  $async.Future<$0.SupplierResponse> getSupplierEntities_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SupplierRequest> request) async {
    return getSupplierEntities(call, await request);
  }

  $async.Future<$0.SupplierResponse> getSupplierEntityById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SupplierRequest> request) async {
    return getSupplierEntityById(call, await request);
  }

  $async.Future<$0.SupplierResponse> createSupplierEntity(
      $grpc.ServiceCall call, $0.SupplierRequest request);
  $async.Future<$0.SupplierResponse> modifySupplierEntity(
      $grpc.ServiceCall call, $0.SupplierRequest request);
  $async.Future<$0.SupplierResponse> deleteSupplierEntity(
      $grpc.ServiceCall call, $0.SupplierRequest request);
  $async.Future<$0.SupplierResponse> getSupplierEntities(
      $grpc.ServiceCall call, $0.SupplierRequest request);
  $async.Future<$0.SupplierResponse> getSupplierEntityById(
      $grpc.ServiceCall call, $0.SupplierRequest request);
}
