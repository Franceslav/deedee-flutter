///
//  Generated code. Do not modify.
//  source: FilterService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'FilterService.pb.dart' as $1;
export 'FilterService.pb.dart';

class FilterServiceClient extends $grpc.Client {
  static final _$addFilterToBookmarkedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/AddFilterToBookmarkedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$removeFilterFilterBookmarkedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/RemoveFilterFilterBookmarkedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$editFilterInBookmarkedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/EditFilterInBookmarkedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$getAllBookmarkedFilters =
      $grpc.ClientMethod<$1.GetAllFiltersRequest, $1.Filter>(
          '/topic.FilterService/GetAllBookmarkedFilters',
          ($1.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Filter.fromBuffer(value));
  static final _$addFilterToSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/AddFilterToSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$removeFilterFromSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/RemoveFilterFromSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$editFilterInSubscribedFilters =
      $grpc.ClientMethod<$1.FilterRequest, $1.FilterResponse>(
          '/topic.FilterService/EditFilterInSubscribedFilters',
          ($1.FilterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.FilterResponse.fromBuffer(value));
  static final _$getAllSubscribedFilters =
      $grpc.ClientMethod<$1.GetAllFiltersRequest, $1.Filter>(
          '/topic.FilterService/GetAllSubscribedFilters',
          ($1.GetAllFiltersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Filter.fromBuffer(value));
  static final _$getFilterKeys =
      $grpc.ClientMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
          '/topic.FilterService/GetFilterKeys',
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

  $grpc.ResponseFuture<$1.FilterResponse> removeFilterFilterBookmarkedFilters(
      $1.FilterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFilterFilterBookmarkedFilters, request,
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
  $core.String get $name => 'topic.FilterService';

  FilterServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'AddFilterToBookmarkedFilters',
        addFilterToBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'RemoveFilterFilterBookmarkedFilters',
        removeFilterFilterBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'EditFilterInBookmarkedFilters',
        editFilterInBookmarkedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAllFiltersRequest, $1.Filter>(
        'GetAllBookmarkedFilters',
        getAllBookmarkedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.GetAllFiltersRequest.fromBuffer(value),
        ($1.Filter value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'AddFilterToSubscribedFilters',
        addFilterToSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'RemoveFilterFromSubscribedFilters',
        removeFilterFromSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FilterRequest, $1.FilterResponse>(
        'EditFilterInSubscribedFilters',
        editFilterInSubscribedFilters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FilterRequest.fromBuffer(value),
        ($1.FilterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAllFiltersRequest, $1.Filter>(
        'GetAllSubscribedFilters',
        getAllSubscribedFilters_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.GetAllFiltersRequest.fromBuffer(value),
        ($1.Filter value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
            'GetFilterKeys',
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

  $async.Future<$1.FilterResponse> removeFilterFilterBookmarkedFilters_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FilterRequest> request) async {
    return removeFilterFilterBookmarkedFilters(call, await request);
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
  $async.Future<$1.FilterResponse> removeFilterFilterBookmarkedFilters(
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
