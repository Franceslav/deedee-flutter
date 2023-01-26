///
//  Generated code. Do not modify.
//  source: TagService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'TagService.pb.dart' as $1;
export 'TagService.pb.dart';

class TagServiceClient extends $grpc.Client {
  static final _$getTopic =
      $grpc.ClientMethod<$1.GetTopicRequest, $1.GetTopicResponse>(
          '/topic.TagService/GetTopic',
          ($1.GetTopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetTopicResponse.fromBuffer(value));
  static final _$placeTag =
      $grpc.ClientMethod<$1.PlaceTagRequest, $1.PlaceTagResponse>(
          '/topic.TagService/PlaceTag',
          ($1.PlaceTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.PlaceTagResponse.fromBuffer(value));
  static final _$getFilterKeys =
      $grpc.ClientMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
          '/topic.TagService/GetFilterKeys',
          ($1.GetFilterKeysRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetFilterKeysResponse.fromBuffer(value));
  static final _$verifyAuthCode =
      $grpc.ClientMethod<$1.VerifyAuthCodeRequest, $1.VerifyAuthCodeResponse>(
          '/topic.TagService/VerifyAuthCode',
          ($1.VerifyAuthCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.VerifyAuthCodeResponse.fromBuffer(value));
  static final _$getFilteredTags =
      $grpc.ClientMethod<$1.GetTopicRequest, $1.GetTopicResponse>(
          '/topic.TagService/GetFilteredTags',
          ($1.GetTopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetTopicResponse.fromBuffer(value));
  static final _$getBookmarkTags =
      $grpc.ClientMethod<$1.GetBookmarkTagsRequest, $1.GetBookmarkTagsResponse>(
          '/topic.TagService/GetBookmarkTags',
          ($1.GetBookmarkTagsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetBookmarkTagsResponse.fromBuffer(value));
  static final _$getTopics =
      $grpc.ClientMethod<$1.GetTopicTitlesRequest, $1.GetTopicTitlesResponse>(
          '/topic.TagService/GetTopics',
          ($1.GetTopicTitlesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetTopicTitlesResponse.fromBuffer(value));
  static final _$topUp = $grpc.ClientMethod<$1.TopUpRequest, $1.TopUpResponse>(
      '/topic.TagService/TopUp',
      ($1.TopUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.TopUpResponse.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetTopicResponse> getTopic($1.GetTopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopic, request, options: options);
  }

  $grpc.ResponseFuture<$1.PlaceTagResponse> placeTag($1.PlaceTagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeTag, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetFilterKeysResponse> getFilterKeys(
      $1.GetFilterKeysRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilterKeys, request, options: options);
  }

  $grpc.ResponseFuture<$1.VerifyAuthCodeResponse> verifyAuthCode(
      $1.VerifyAuthCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyAuthCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTopicResponse> getFilteredTags(
      $1.GetTopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredTags, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBookmarkTagsResponse> getBookmarkTags(
      $1.GetBookmarkTagsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBookmarkTags, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTopicTitlesResponse> getTopics(
      $1.GetTopicTitlesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopics, request, options: options);
  }

  $grpc.ResponseFuture<$1.TopUpResponse> topUp($1.TopUpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$topUp, request, options: options);
  }
}

abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'topic.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetTopicRequest, $1.GetTopicResponse>(
        'GetTopic',
        getTopic_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetTopicRequest.fromBuffer(value),
        ($1.GetTopicResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PlaceTagRequest, $1.PlaceTagResponse>(
        'PlaceTag',
        placeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PlaceTagRequest.fromBuffer(value),
        ($1.PlaceTagResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetFilterKeysRequest, $1.GetFilterKeysResponse>(
            'GetFilterKeys',
            getFilterKeys_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetFilterKeysRequest.fromBuffer(value),
            ($1.GetFilterKeysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.VerifyAuthCodeRequest,
            $1.VerifyAuthCodeResponse>(
        'VerifyAuthCode',
        verifyAuthCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.VerifyAuthCodeRequest.fromBuffer(value),
        ($1.VerifyAuthCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetTopicRequest, $1.GetTopicResponse>(
        'GetFilteredTags',
        getFilteredTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetTopicRequest.fromBuffer(value),
        ($1.GetTopicResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetBookmarkTagsRequest,
            $1.GetBookmarkTagsResponse>(
        'GetBookmarkTags',
        getBookmarkTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetBookmarkTagsRequest.fromBuffer(value),
        ($1.GetBookmarkTagsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetTopicTitlesRequest,
            $1.GetTopicTitlesResponse>(
        'GetTopics',
        getTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetTopicTitlesRequest.fromBuffer(value),
        ($1.GetTopicTitlesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TopUpRequest, $1.TopUpResponse>(
        'TopUp',
        topUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TopUpRequest.fromBuffer(value),
        ($1.TopUpResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetTopicResponse> getTopic_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetTopicRequest> request) async {
    return getTopic(call, await request);
  }

  $async.Future<$1.PlaceTagResponse> placeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PlaceTagRequest> request) async {
    return placeTag(call, await request);
  }

  $async.Future<$1.GetFilterKeysResponse> getFilterKeys_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetFilterKeysRequest> request) async {
    return getFilterKeys(call, await request);
  }

  $async.Future<$1.VerifyAuthCodeResponse> verifyAuthCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.VerifyAuthCodeRequest> request) async {
    return verifyAuthCode(call, await request);
  }

  $async.Future<$1.GetTopicResponse> getFilteredTags_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetTopicRequest> request) async {
    return getFilteredTags(call, await request);
  }

  $async.Future<$1.GetBookmarkTagsResponse> getBookmarkTags_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetBookmarkTagsRequest> request) async {
    return getBookmarkTags(call, await request);
  }

  $async.Future<$1.GetTopicTitlesResponse> getTopics_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetTopicTitlesRequest> request) async {
    return getTopics(call, await request);
  }

  $async.Future<$1.TopUpResponse> topUp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.TopUpRequest> request) async {
    return topUp(call, await request);
  }

  $async.Future<$1.GetTopicResponse> getTopic(
      $grpc.ServiceCall call, $1.GetTopicRequest request);
  $async.Future<$1.PlaceTagResponse> placeTag(
      $grpc.ServiceCall call, $1.PlaceTagRequest request);
  $async.Future<$1.GetFilterKeysResponse> getFilterKeys(
      $grpc.ServiceCall call, $1.GetFilterKeysRequest request);
  $async.Future<$1.VerifyAuthCodeResponse> verifyAuthCode(
      $grpc.ServiceCall call, $1.VerifyAuthCodeRequest request);
  $async.Future<$1.GetTopicResponse> getFilteredTags(
      $grpc.ServiceCall call, $1.GetTopicRequest request);
  $async.Future<$1.GetBookmarkTagsResponse> getBookmarkTags(
      $grpc.ServiceCall call, $1.GetBookmarkTagsRequest request);
  $async.Future<$1.GetTopicTitlesResponse> getTopics(
      $grpc.ServiceCall call, $1.GetTopicTitlesRequest request);
  $async.Future<$1.TopUpResponse> topUp(
      $grpc.ServiceCall call, $1.TopUpRequest request);
}
