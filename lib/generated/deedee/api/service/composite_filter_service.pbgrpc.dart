///
//  Generated code. Do not modify.
//  source: deedee/api/service/composite_filter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'composite_filter_service.pb.dart' as $0;
export 'composite_filter_service.pb.dart';

class CompositeFilterServiceClient extends $grpc.Client {
  static final _$addToFavorites = $grpc.ClientMethod<$0.CompositeFilterRequest,
          $0.CompositeFilterResponse>(
      '/deedee.api.compositefilter.service.CompositeFilterService/addToFavorites',
      ($0.CompositeFilterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CompositeFilterResponse.fromBuffer(value));
  static final _$removeFromFavorites = $grpc.ClientMethod<
          $0.CompositeFilterRequest, $0.CompositeFilterResponse>(
      '/deedee.api.compositefilter.service.CompositeFilterService/removeFromFavorites',
      ($0.CompositeFilterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CompositeFilterResponse.fromBuffer(value));
  static final _$editFavorites = $grpc.ClientMethod<$0.CompositeFilterRequest,
          $0.CompositeFilterResponse>(
      '/deedee.api.compositefilter.service.CompositeFilterService/editFavorites',
      ($0.CompositeFilterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CompositeFilterResponse.fromBuffer(value));
  static final _$getAllFavorites = $grpc.ClientMethod<$0.CompositeFilterRequest,
          $0.CompositeFilterResponse>(
      '/deedee.api.compositefilter.service.CompositeFilterService/getAllFavorites',
      ($0.CompositeFilterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CompositeFilterResponse.fromBuffer(value));
  static final _$getFilterKeys = $grpc.ClientMethod<$0.FilterKeyRequest,
          $0.FilterKeyResponse>(
      '/deedee.api.compositefilter.service.CompositeFilterService/getFilterKeys',
      ($0.FilterKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FilterKeyResponse.fromBuffer(value));

  CompositeFilterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CompositeFilterResponse> addToFavorites(
      $0.CompositeFilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addToFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.CompositeFilterResponse> removeFromFavorites(
      $0.CompositeFilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFromFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.CompositeFilterResponse> editFavorites(
      $0.CompositeFilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.CompositeFilterResponse> getAllFavorites(
      $0.CompositeFilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.FilterKeyResponse> getFilterKeys(
      $0.FilterKeyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilterKeys, request, options: options);
  }
}

abstract class CompositeFilterServiceBase extends $grpc.Service {
  $core.String get $name =>
      'deedee.api.compositefilter.service.CompositeFilterService';

  CompositeFilterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CompositeFilterRequest,
            $0.CompositeFilterResponse>(
        'addToFavorites',
        addToFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompositeFilterRequest.fromBuffer(value),
        ($0.CompositeFilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompositeFilterRequest,
            $0.CompositeFilterResponse>(
        'removeFromFavorites',
        removeFromFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompositeFilterRequest.fromBuffer(value),
        ($0.CompositeFilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompositeFilterRequest,
            $0.CompositeFilterResponse>(
        'editFavorites',
        editFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompositeFilterRequest.fromBuffer(value),
        ($0.CompositeFilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompositeFilterRequest,
            $0.CompositeFilterResponse>(
        'getAllFavorites',
        getAllFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompositeFilterRequest.fromBuffer(value),
        ($0.CompositeFilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterKeyRequest, $0.FilterKeyResponse>(
        'getFilterKeys',
        getFilterKeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterKeyRequest.fromBuffer(value),
        ($0.FilterKeyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CompositeFilterResponse> addToFavorites_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CompositeFilterRequest> request) async {
    return addToFavorites(call, await request);
  }

  $async.Future<$0.CompositeFilterResponse> removeFromFavorites_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CompositeFilterRequest> request) async {
    return removeFromFavorites(call, await request);
  }

  $async.Future<$0.CompositeFilterResponse> editFavorites_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CompositeFilterRequest> request) async {
    return editFavorites(call, await request);
  }

  $async.Future<$0.CompositeFilterResponse> getAllFavorites_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CompositeFilterRequest> request) async {
    return getAllFavorites(call, await request);
  }

  $async.Future<$0.FilterKeyResponse> getFilterKeys_Pre($grpc.ServiceCall call,
      $async.Future<$0.FilterKeyRequest> request) async {
    return getFilterKeys(call, await request);
  }

  $async.Future<$0.CompositeFilterResponse> addToFavorites(
      $grpc.ServiceCall call, $0.CompositeFilterRequest request);
  $async.Future<$0.CompositeFilterResponse> removeFromFavorites(
      $grpc.ServiceCall call, $0.CompositeFilterRequest request);
  $async.Future<$0.CompositeFilterResponse> editFavorites(
      $grpc.ServiceCall call, $0.CompositeFilterRequest request);
  $async.Future<$0.CompositeFilterResponse> getAllFavorites(
      $grpc.ServiceCall call, $0.CompositeFilterRequest request);
  $async.Future<$0.FilterKeyResponse> getFilterKeys(
      $grpc.ServiceCall call, $0.FilterKeyRequest request);
}
