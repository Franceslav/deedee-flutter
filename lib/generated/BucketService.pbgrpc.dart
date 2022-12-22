///
//  Generated code. Do not modify.
//  source: BucketService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'BucketService.pb.dart' as $0;
export 'BucketService.pb.dart';

class BucketServiceClient extends $grpc.Client {
  static final _$getBucket =
      $grpc.ClientMethod<$0.GetBucketRequest, $0.GetBucketResponse>(
          '/bucket.BucketService/GetBucket',
          ($0.GetBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBucketResponse.fromBuffer(value));
  static final _$placeTag =
      $grpc.ClientMethod<$0.PlaceTagRequest, $0.PlaceTagResponse>(
          '/bucket.BucketService/PlaceTag',
          ($0.PlaceTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PlaceTagResponse.fromBuffer(value));
  static final _$getFilterKeys =
      $grpc.ClientMethod<$0.GetFilterKeysRequest, $0.GetFilterKeysResponse>(
          '/bucket.BucketService/GetFilterKeys',
          ($0.GetFilterKeysRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetFilterKeysResponse.fromBuffer(value));
  static final _$verifyAuthCode =
      $grpc.ClientMethod<$0.VerifyAuthCodeRequest, $0.VerifyAuthCodeResponse>(
          '/bucket.BucketService/VerifyAuthCode',
          ($0.VerifyAuthCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.VerifyAuthCodeResponse.fromBuffer(value));
  static final _$getFilteredTags =
      $grpc.ClientMethod<$0.GetBucketRequest, $0.GetBucketResponse>(
          '/bucket.BucketService/GetFilteredTags',
          ($0.GetBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBucketResponse.fromBuffer(value));
  static final _$getTopics =
      $grpc.ClientMethod<$0.GetTopicTitlesRequest, $0.GetTopicTitlesResponse>(
          '/bucket.BucketService/GetTopics',
          ($0.GetTopicTitlesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetTopicTitlesResponse.fromBuffer(value));

  BucketServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetBucketResponse> getBucket(
      $0.GetBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBucket, request, options: options);
  }

  $grpc.ResponseFuture<$0.PlaceTagResponse> placeTag($0.PlaceTagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeTag, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFilterKeysResponse> getFilterKeys(
      $0.GetFilterKeysRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilterKeys, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyAuthCodeResponse> verifyAuthCode(
      $0.VerifyAuthCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyAuthCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBucketResponse> getFilteredTags(
      $0.GetBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTopicTitlesResponse> getTopics(
      $0.GetTopicTitlesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopics, request, options: options);
  }
}

abstract class BucketServiceBase extends $grpc.Service {
  $core.String get $name => 'bucket.BucketService';

  BucketServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetBucketRequest, $0.GetBucketResponse>(
        'GetBucket',
        getBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBucketRequest.fromBuffer(value),
        ($0.GetBucketResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlaceTagRequest, $0.PlaceTagResponse>(
        'PlaceTag',
        placeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlaceTagRequest.fromBuffer(value),
        ($0.PlaceTagResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetFilterKeysRequest, $0.GetFilterKeysResponse>(
            'GetFilterKeys',
            getFilterKeys_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetFilterKeysRequest.fromBuffer(value),
            ($0.GetFilterKeysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyAuthCodeRequest,
            $0.VerifyAuthCodeResponse>(
        'VerifyAuthCode',
        verifyAuthCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyAuthCodeRequest.fromBuffer(value),
        ($0.VerifyAuthCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBucketRequest, $0.GetBucketResponse>(
        'GetFilteredTags',
        getFilteredTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBucketRequest.fromBuffer(value),
        ($0.GetBucketResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTopicTitlesRequest,
            $0.GetTopicTitlesResponse>(
        'GetTopics',
        getTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTopicTitlesRequest.fromBuffer(value),
        ($0.GetTopicTitlesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetBucketResponse> getBucket_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBucketRequest> request) async {
    return getBucket(call, await request);
  }

  $async.Future<$0.PlaceTagResponse> placeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlaceTagRequest> request) async {
    return placeTag(call, await request);
  }

  $async.Future<$0.GetFilterKeysResponse> getFilterKeys_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetFilterKeysRequest> request) async {
    return getFilterKeys(call, await request);
  }

  $async.Future<$0.VerifyAuthCodeResponse> verifyAuthCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerifyAuthCodeRequest> request) async {
    return verifyAuthCode(call, await request);
  }

  $async.Future<$0.GetBucketResponse> getFilteredTags_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetBucketRequest> request) async {
    return getFilteredTags(call, await request);
  }

  $async.Future<$0.GetTopicTitlesResponse> getTopics_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetTopicTitlesRequest> request) async {
    return getTopics(call, await request);
  }

  $async.Future<$0.GetBucketResponse> getBucket(
      $grpc.ServiceCall call, $0.GetBucketRequest request);
  $async.Future<$0.PlaceTagResponse> placeTag(
      $grpc.ServiceCall call, $0.PlaceTagRequest request);
  $async.Future<$0.GetFilterKeysResponse> getFilterKeys(
      $grpc.ServiceCall call, $0.GetFilterKeysRequest request);
  $async.Future<$0.VerifyAuthCodeResponse> verifyAuthCode(
      $grpc.ServiceCall call, $0.VerifyAuthCodeRequest request);
  $async.Future<$0.GetBucketResponse> getFilteredTags(
      $grpc.ServiceCall call, $0.GetBucketRequest request);
  $async.Future<$0.GetTopicTitlesResponse> getTopics(
      $grpc.ServiceCall call, $0.GetTopicTitlesRequest request);
}
