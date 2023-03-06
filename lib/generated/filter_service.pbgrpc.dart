///
//  Generated code. Do not modify.
//  source: filter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'filter_service.pb.dart' as $0;
export 'filter_service.pb.dart';

class FilterServiceClient extends $grpc.Client {
  static final _$addFilterToBookmarkedFilters =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/addFilterToBookmarkedFilters',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$removeBookmarkedFilter =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/removeBookmarkedFilter',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$editFilterInBookmarkedFilters =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/editFilterInBookmarkedFilters',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$getAllBookmarkedFilters =
      $grpc.ClientMethod<$0.GetAllFiltersRequest, $0.Filter>(
          '/bucket.FilterService/getAllBookmarkedFilters',
          ($0.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Filter.fromBuffer(value));
  static final _$addFilterToSubscribedFilters =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/addFilterToSubscribedFilters',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$removeFilterFromSubscribedFilters =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/removeFilterFromSubscribedFilters',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$editFilterInSubscribedFilters =
      $grpc.ClientMethod<$0.FilterRequest, $0.FilterResponse>(
          '/bucket.FilterService/editFilterInSubscribedFilters',
          ($0.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FilterResponse.fromBuffer(value));
  static final _$getAllSubscribedFilters =
      $grpc.ClientMethod<$0.GetAllFiltersRequest, $0.Filter>(
          '/bucket.FilterService/getAllSubscribedFilters',
          ($0.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Filter.fromBuffer(value));
  static final _$getFilterKeys =
      $grpc.ClientMethod<$0.GetFilterKeysRequest, $0.GetFilterKeysResponse>(
          '/bucket.FilterService/getFilterKeys',
          ($0.GetFilterKeysRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetFilterKeysResponse.fromBuffer(value));

  FilterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.FilterResponse> addFilterToBookmarkedFilters(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFilterToBookmarkedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FilterResponse> removeBookmarkedFilter(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeBookmarkedFilter, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FilterResponse> editFilterInBookmarkedFilters(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editFilterInBookmarkedFilters, request,
        options: options);
  }

  $grpc.ResponseStream<$0.Filter> getAllBookmarkedFilters(
      $0.GetAllFiltersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllBookmarkedFilters, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.FilterResponse> addFilterToSubscribedFilters(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFilterToSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FilterResponse> removeFilterFromSubscribedFilters(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFilterFromSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FilterResponse> editFilterInSubscribedFilters(
      $0.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editFilterInSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseStream<$0.Filter> getAllSubscribedFilters(
      $0.GetAllFiltersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllSubscribedFilters, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.GetFilterKeysResponse> getFilterKeys(
      $0.GetFilterKeysRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilterKeys, request, options: options);
  }
}

abstract class FilterServiceBase extends $grpc.Service {
  $core.String get $name => 'bucket.FilterService';

  FilterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'addFilterToBookmarkedFilters',
        addFilterToBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'removeBookmarkedFilter',
        removeBookmarkedFilter_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'editFilterInBookmarkedFilters',
        editFilterInBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAllFiltersRequest, $0.Filter>(
        'getAllBookmarkedFilters',
        getAllBookmarkedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetAllFiltersRequest.fromBuffer(value),
        ($0.Filter value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'addFilterToSubscribedFilters',
        addFilterToSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'removeFilterFromSubscribedFilters',
        removeFilterFromSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterRequest, $0.FilterResponse>(
        'editFilterInSubscribedFilters',
        editFilterInSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterRequest.fromBuffer(value),
        ($0.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAllFiltersRequest, $0.Filter>(
        'getAllSubscribedFilters',
        getAllSubscribedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetAllFiltersRequest.fromBuffer(value),
        ($0.Filter value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetFilterKeysRequest, $0.GetFilterKeysResponse>(
            'getFilterKeys',
            getFilterKeys_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetFilterKeysRequest.fromBuffer(value),
            ($0.GetFilterKeysResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FilterResponse> addFilterToBookmarkedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return addFilterToBookmarkedFilters(call, await request);
  }

  $async.Future<$0.FilterResponse> removeBookmarkedFilter_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return removeBookmarkedFilter(call, await request);
  }

  $async.Future<$0.FilterResponse> editFilterInBookmarkedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return editFilterInBookmarkedFilters(call, await request);
  }

  $async.Stream<$0.Filter> getAllBookmarkedFilters_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetAllFiltersRequest> request) async* {
    yield* getAllBookmarkedFilters(call, await request);
  }

  $async.Future<$0.FilterResponse> addFilterToSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return addFilterToSubscribedFilters(call, await request);
  }

  $async.Future<$0.FilterResponse> removeFilterFromSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return removeFilterFromSubscribedFilters(call, await request);
  }

  $async.Future<$0.FilterResponse> editFilterInSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FilterRequest> request) async {
    return editFilterInSubscribedFilters(call, await request);
  }

  $async.Stream<$0.Filter> getAllSubscribedFilters_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetAllFiltersRequest> request) async* {
    yield* getAllSubscribedFilters(call, await request);
  }

  $async.Future<$0.GetFilterKeysResponse> getFilterKeys_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetFilterKeysRequest> request) async {
    return getFilterKeys(call, await request);
  }

  $async.Future<$0.FilterResponse> addFilterToBookmarkedFilters(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Future<$0.FilterResponse> removeBookmarkedFilter(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Future<$0.FilterResponse> editFilterInBookmarkedFilters(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Stream<$0.Filter> getAllBookmarkedFilters(
      $grpc.ServiceCall call, $0.GetAllFiltersRequest request);
  $async.Future<$0.FilterResponse> addFilterToSubscribedFilters(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Future<$0.FilterResponse> removeFilterFromSubscribedFilters(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Future<$0.FilterResponse> editFilterInSubscribedFilters(
      $grpc.ServiceCall call, $0.FilterRequest request);
  $async.Stream<$0.Filter> getAllSubscribedFilters(
      $grpc.ServiceCall call, $0.GetAllFiltersRequest request);
  $async.Future<$0.GetFilterKeysResponse> getFilterKeys(
      $grpc.ServiceCall call, $0.GetFilterKeysRequest request);
}
