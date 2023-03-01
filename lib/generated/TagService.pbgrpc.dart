///
//  Generated code. Do not modify.
//  source: TagService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'TagService.pb.dart' as $2;
export 'TagService.pb.dart';

class TagServiceClient extends $grpc.Client {
  static final _$getTopic =
      $grpc.ClientMethod<$2.GetTopicRequest, $2.GetTopicResponse>(
          '/topic.TagService/GetTopic',
          ($2.GetTopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.GetTopicResponse.fromBuffer(value));
  static final _$placeTag =
      $grpc.ClientMethod<$2.PlaceTagRequest, $2.PlaceTagResponse>(
          '/topic.TagService/PlaceTag',
          ($2.PlaceTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.PlaceTagResponse.fromBuffer(value));
  static final _$verifyAuthCode =
      $grpc.ClientMethod<$2.VerifyAuthCodeRequest, $2.VerifyAuthCodeResponse>(
          '/topic.TagService/VerifyAuthCode',
          ($2.VerifyAuthCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.VerifyAuthCodeResponse.fromBuffer(value));
  static final _$getFilteredTags =
      $grpc.ClientMethod<$2.GetTopicRequest, $2.GetTopicResponse>(
          '/topic.TagService/GetFilteredTags',
          ($2.GetTopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.GetTopicResponse.fromBuffer(value));
  static final _$getUserTags =
      $grpc.ClientMethod<$2.GetUserTagsRequest, $2.GetUserTagsResponse>(
          '/topic.TagService/GetUserTags',
          ($2.GetUserTagsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.GetUserTagsResponse.fromBuffer(value));
  static final _$getUserTag =
      $grpc.ClientMethod<$2.UserTagRequest, $2.UserTagResponse>(
          '/topic.TagService/GetUserTag',
          ($2.UserTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.UserTagResponse.fromBuffer(value));
  static final _$removeUserTag =
      $grpc.ClientMethod<$2.UserTagRequest, $2.UserTagResponse>(
          '/topic.TagService/RemoveUserTag',
          ($2.UserTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.UserTagResponse.fromBuffer(value));
  static final _$getUserTagDetails = $grpc.ClientMethod<
          $2.GetUserTagDetailsRequest, $2.GetUserTagDetailsResponse>(
      '/topic.TagService/GetUserTagDetails',
      ($2.GetUserTagDetailsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.GetUserTagDetailsResponse.fromBuffer(value));
  static final _$addTagToBookmark =
      $grpc.ClientMethod<$2.TagToBookmarkRequest, $2.TagToBookmarkResponse>(
          '/topic.TagService/AddTagToBookmark',
          ($2.TagToBookmarkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TagToBookmarkResponse.fromBuffer(value));
  static final _$getBookmarkTags =
      $grpc.ClientMethod<$2.GetBookmarkTagsRequest, $2.GetBookmarkTagsResponse>(
          '/topic.TagService/GetBookmarkTags',
          ($2.GetBookmarkTagsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.GetBookmarkTagsResponse.fromBuffer(value));
  static final _$removeTagToBookmark =
      $grpc.ClientMethod<$2.TagToBookmarkRequest, $2.TagToBookmarkResponse>(
          '/topic.TagService/RemoveTagToBookmark',
          ($2.TagToBookmarkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TagToBookmarkResponse.fromBuffer(value));
  static final _$getTopics = $grpc.ClientMethod<
          $2.GetAllTopicsDescriptionRequest,
          $2.GetAllTopicsDescriptionResponse>(
      '/topic.TagService/GetTopics',
      ($2.GetAllTopicsDescriptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.GetAllTopicsDescriptionResponse.fromBuffer(value));
  static final _$getSubTopics = $grpc.ClientMethod<$2.GetTopicTitlesRequest,
          $2.GetAllTopicsDescriptionResponse>(
      '/topic.TagService/GetSubTopics',
      ($2.GetTopicTitlesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.GetAllTopicsDescriptionResponse.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.GetTopicResponse> getTopic($2.GetTopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopic, request, options: options);
  }

  $grpc.ResponseFuture<$2.PlaceTagResponse> placeTag($2.PlaceTagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.VerifyAuthCodeResponse> verifyAuthCode(
      $2.VerifyAuthCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyAuthCode, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetTopicResponse> getFilteredTags(
      $2.GetTopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFilteredTags, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetUserTagsResponse> getUserTags(
      $2.GetUserTagsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserTags, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserTagResponse> getUserTag($2.UserTagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserTagResponse> removeUserTag(
      $2.UserTagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeUserTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetUserTagDetailsResponse> getUserTagDetails(
      $2.GetUserTagDetailsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserTagDetails, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagToBookmarkResponse> addTagToBookmark(
      $2.TagToBookmarkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTagToBookmark, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetBookmarkTagsResponse> getBookmarkTags(
      $2.GetBookmarkTagsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBookmarkTags, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagToBookmarkResponse> removeTagToBookmark(
      $2.TagToBookmarkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTagToBookmark, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetAllTopicsDescriptionResponse> getTopics(
      $2.GetAllTopicsDescriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopics, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetAllTopicsDescriptionResponse> getSubTopics(
      $2.GetTopicTitlesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSubTopics, request, options: options);
  }
}

abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'topic.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetTopicRequest, $2.GetTopicResponse>(
        'GetTopic',
        getTopic_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetTopicRequest.fromBuffer(value),
        ($2.GetTopicResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PlaceTagRequest, $2.PlaceTagResponse>(
        'PlaceTag',
        placeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PlaceTagRequest.fromBuffer(value),
        ($2.PlaceTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.VerifyAuthCodeRequest,
            $2.VerifyAuthCodeResponse>(
        'VerifyAuthCode',
        verifyAuthCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.VerifyAuthCodeRequest.fromBuffer(value),
        ($2.VerifyAuthCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetTopicRequest, $2.GetTopicResponse>(
        'GetFilteredTags',
        getFilteredTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetTopicRequest.fromBuffer(value),
        ($2.GetTopicResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.GetUserTagsRequest, $2.GetUserTagsResponse>(
            'GetUserTags',
            getUserTags_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.GetUserTagsRequest.fromBuffer(value),
            ($2.GetUserTagsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UserTagRequest, $2.UserTagResponse>(
        'GetUserTag',
        getUserTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UserTagRequest.fromBuffer(value),
        ($2.UserTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UserTagRequest, $2.UserTagResponse>(
        'RemoveUserTag',
        removeUserTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UserTagRequest.fromBuffer(value),
        ($2.UserTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetUserTagDetailsRequest,
            $2.GetUserTagDetailsResponse>(
        'GetUserTagDetails',
        getUserTagDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetUserTagDetailsRequest.fromBuffer(value),
        ($2.GetUserTagDetailsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.TagToBookmarkRequest, $2.TagToBookmarkResponse>(
            'AddTagToBookmark',
            addTagToBookmark_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.TagToBookmarkRequest.fromBuffer(value),
            ($2.TagToBookmarkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetBookmarkTagsRequest,
            $2.GetBookmarkTagsResponse>(
        'GetBookmarkTags',
        getBookmarkTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetBookmarkTagsRequest.fromBuffer(value),
        ($2.GetBookmarkTagsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.TagToBookmarkRequest, $2.TagToBookmarkResponse>(
            'RemoveTagToBookmark',
            removeTagToBookmark_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.TagToBookmarkRequest.fromBuffer(value),
            ($2.TagToBookmarkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetAllTopicsDescriptionRequest,
            $2.GetAllTopicsDescriptionResponse>(
        'GetTopics',
        getTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetAllTopicsDescriptionRequest.fromBuffer(value),
        ($2.GetAllTopicsDescriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetTopicTitlesRequest,
            $2.GetAllTopicsDescriptionResponse>(
        'GetSubTopics',
        getSubTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetTopicTitlesRequest.fromBuffer(value),
        ($2.GetAllTopicsDescriptionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.GetTopicResponse> getTopic_Pre(
      $grpc.ServiceCall call, $async.Future<$2.GetTopicRequest> request) async {
    return getTopic(call, await request);
  }

  $async.Future<$2.PlaceTagResponse> placeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.PlaceTagRequest> request) async {
    return placeTag(call, await request);
  }

  $async.Future<$2.VerifyAuthCodeResponse> verifyAuthCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.VerifyAuthCodeRequest> request) async {
    return verifyAuthCode(call, await request);
  }

  $async.Future<$2.GetTopicResponse> getFilteredTags_Pre(
      $grpc.ServiceCall call, $async.Future<$2.GetTopicRequest> request) async {
    return getFilteredTags(call, await request);
  }

  $async.Future<$2.GetUserTagsResponse> getUserTags_Pre($grpc.ServiceCall call,
      $async.Future<$2.GetUserTagsRequest> request) async {
    return getUserTags(call, await request);
  }

  $async.Future<$2.UserTagResponse> getUserTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UserTagRequest> request) async {
    return getUserTag(call, await request);
  }

  $async.Future<$2.UserTagResponse> removeUserTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UserTagRequest> request) async {
    return removeUserTag(call, await request);
  }

  $async.Future<$2.GetUserTagDetailsResponse> getUserTagDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetUserTagDetailsRequest> request) async {
    return getUserTagDetails(call, await request);
  }

  $async.Future<$2.TagToBookmarkResponse> addTagToBookmark_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.TagToBookmarkRequest> request) async {
    return addTagToBookmark(call, await request);
  }

  $async.Future<$2.GetBookmarkTagsResponse> getBookmarkTags_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetBookmarkTagsRequest> request) async {
    return getBookmarkTags(call, await request);
  }

  $async.Future<$2.TagToBookmarkResponse> removeTagToBookmark_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.TagToBookmarkRequest> request) async {
    return removeTagToBookmark(call, await request);
  }

  $async.Future<$2.GetAllTopicsDescriptionResponse> getTopics_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetAllTopicsDescriptionRequest> request) async {
    return getTopics(call, await request);
  }

  $async.Future<$2.GetAllTopicsDescriptionResponse> getSubTopics_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetTopicTitlesRequest> request) async {
    return getSubTopics(call, await request);
  }

  $async.Future<$2.GetTopicResponse> getTopic(
      $grpc.ServiceCall call, $2.GetTopicRequest request);
  $async.Future<$2.PlaceTagResponse> placeTag(
      $grpc.ServiceCall call, $2.PlaceTagRequest request);
  $async.Future<$2.VerifyAuthCodeResponse> verifyAuthCode(
      $grpc.ServiceCall call, $2.VerifyAuthCodeRequest request);
  $async.Future<$2.GetTopicResponse> getFilteredTags(
      $grpc.ServiceCall call, $2.GetTopicRequest request);
  $async.Future<$2.GetUserTagsResponse> getUserTags(
      $grpc.ServiceCall call, $2.GetUserTagsRequest request);
  $async.Future<$2.UserTagResponse> getUserTag(
      $grpc.ServiceCall call, $2.UserTagRequest request);
  $async.Future<$2.UserTagResponse> removeUserTag(
      $grpc.ServiceCall call, $2.UserTagRequest request);
  $async.Future<$2.GetUserTagDetailsResponse> getUserTagDetails(
      $grpc.ServiceCall call, $2.GetUserTagDetailsRequest request);
  $async.Future<$2.TagToBookmarkResponse> addTagToBookmark(
      $grpc.ServiceCall call, $2.TagToBookmarkRequest request);
  $async.Future<$2.GetBookmarkTagsResponse> getBookmarkTags(
      $grpc.ServiceCall call, $2.GetBookmarkTagsRequest request);
  $async.Future<$2.TagToBookmarkResponse> removeTagToBookmark(
      $grpc.ServiceCall call, $2.TagToBookmarkRequest request);
  $async.Future<$2.GetAllTopicsDescriptionResponse> getTopics(
      $grpc.ServiceCall call, $2.GetAllTopicsDescriptionRequest request);
  $async.Future<$2.GetAllTopicsDescriptionResponse> getSubTopics(
      $grpc.ServiceCall call, $2.GetTopicTitlesRequest request);
}
