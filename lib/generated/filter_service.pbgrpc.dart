///
//  Generated code. Do not modify.
//  source: filter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'filter_service.pb.dart' as $1;
export 'filter_service.pb.dart';

class FilterServiceClient extends $grpc.Client {
  static final _$addFilterToBookmarkedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/addFilterToBookmarkedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$removeBookmarkedFilter =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/removeBookmarkedFilter',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$editFilterInBookmarkedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/editFilterInBookmarkedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$getAllBookmarkedFilters =
      $grpc.ClientMethod<$1.GetAllFiltersRequest, $1.Filter>(
          '/deedee.service.FilterService/getAllBookmarkedFilters',
          ($1.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Filter.fromBuffer(value));
  static final _$addFilterToSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/addFilterToSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$removeFilterFromSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/removeFilterFromSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$editFilterInSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/deedee.service.FilterService/editFilterInSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$getAllSubscribedFilters =
      $grpc.ClientMethod<$1.GetAllFiltersRequest, $1.Filter>(
          '/deedee.service.FilterService/getAllSubscribedFilters',
          ($1.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Filter.fromBuffer(value));
  static final _$getFilterKeys =
      $grpc.ClientMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
          '/deedee.service.FilterService/getFilterKeys',
          ($1.GetFilterKeysRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetFilterKeysResponse.fromBuffer(value));

  FilterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.FilterResponse> addFilterToBookmarkedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFilterToBookmarkedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.FilterResponse> removeBookmarkedFilter(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeBookmarkedFilter, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.FilterResponse> editFilterInBookmarkedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editFilterInBookmarkedFilters, request,
        options: options);
  }

  $grpc.ResponseStream<$1.Filter> getAllBookmarkedFilters(
      $1.GetAllFiltersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllBookmarkedFilters, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.FilterResponse> addFilterToSubscribedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFilterToSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.FilterResponse> removeFilterFromSubscribedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFilterFromSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.FilterResponse> editFilterInSubscribedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editFilterInSubscribedFilters, request,
        options: options);
  }

  $grpc.ResponseStream<$1.Filter> getAllSubscribedFilters(
      $1.GetAllFiltersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllSubscribedFilters, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.GetFilterKeysResponse> getFilterKeys(
      $1.GetFilterKeysRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilterKeys, request, options: options);
  }
}

abstract class FilterServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.service.FilterService';

  FilterServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'addFilterToBookmarkedFilters',
        addFilterToBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'removeBookmarkedFilter',
        removeBookmarkedFilter_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'editFilterInBookmarkedFilters',
        editFilterInBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAllFiltersRequest, $1.Filter>(
        'getAllBookmarkedFilters',
        getAllBookmarkedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.GetAllFiltersRequest.fromBuffer(value),
        ($1.Filter value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'addFilterToSubscribedFilters',
        addFilterToSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'removeFilterFromSubscribedFilters',
        removeFilterFromSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'editFilterInSubscribedFilters',
        editFilterInSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAllFiltersRequest, $1.Filter>(
        'getAllSubscribedFilters',
        getAllSubscribedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.GetAllFiltersRequest.fromBuffer(value),
        ($1.Filter value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
            'getFilterKeys',
            getFilterKeys_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetFilterKeysRequest.fromBuffer(value),
            ($1.GetFilterKeysResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.FilterResponse> addFilterToBookmarkedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return addFilterToBookmarkedFilters(call, await request);
  }

  $async.Future<$1.FilterResponse> removeBookmarkedFilter_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return removeBookmarkedFilter(call, await request);
  }

  $async.Future<$1.FilterResponse> editFilterInBookmarkedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return editFilterInBookmarkedFilters(call, await request);
  }

  $async.Stream<$1.Filter> getAllBookmarkedFilters_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetAllFiltersRequest> request) async* {
    yield* getAllBookmarkedFilters(call, await request);
  }

  $async.Future<$1.FilterResponse> addFilterToSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return addFilterToSubscribedFilters(call, await request);
  }

  $async.Future<$1.FilterResponse> removeFilterFromSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return removeFilterFromSubscribedFilters(call, await request);
  }

  $async.Future<$1.FilterResponse> editFilterInSubscribedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return editFilterInSubscribedFilters(call, await request);
  }

  $async.Stream<$1.Filter> getAllSubscribedFilters_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetAllFiltersRequest> request) async* {
    yield* getAllSubscribedFilters(call, await request);
  }

  $async.Future<$1.GetFilterKeysResponse> getFilterKeys_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetFilterKeysRequest> request) async {
    return getFilterKeys(call, await request);
  }

  $async.Future<$1.FilterResponse> addFilterToBookmarkedFilters(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Future<$1.FilterResponse> removeBookmarkedFilter(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Future<$1.FilterResponse> editFilterInBookmarkedFilters(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Stream<$1.Filter> getAllBookmarkedFilters(
      $grpc.ServiceCall call, $1.GetAllFiltersRequest request);
  $async.Future<$1.FilterResponse> addFilterToSubscribedFilters(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Future<$1.FilterResponse> removeFilterFromSubscribedFilters(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Future<$1.FilterResponse> editFilterInSubscribedFilters(
      $grpc.ServiceCall call, $1.FilterRequest request);
  $async.Stream<$1.Filter> getAllSubscribedFilters(
      $grpc.ServiceCall call, $1.GetAllFiltersRequest request);
  $async.Future<$1.GetFilterKeysResponse> getFilterKeys(
      $grpc.ServiceCall call, $1.GetFilterKeysRequest request);
}
