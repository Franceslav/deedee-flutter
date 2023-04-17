///
//  Generated code. Do not modify.
//  source: tag_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tag_service.pb.dart' as $2;
export 'tag_service.pb.dart';

class TagServiceClient extends $grpc.Client {
  static final _$placeTag = $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
      '/deedee.service.TagService/placeTag',
      ($2.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$removeTag = $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
      '/deedee.service.TagService/removeTag',
      ($2.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$editTag = $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
      '/deedee.service.TagService/editTag',
      ($2.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$getTags = $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
      '/deedee.service.TagService/getTags',
      ($2.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$addTagToFavorites =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/addTagToFavorites',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$removeTagFromFavorites =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/removeTagFromFavorites',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$getFavoriteTags =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/getFavoriteTags',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$addTagToBookmarks =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/addTagToBookmarks',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$removeTagFromBookmarks =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/removeTagFromBookmarks',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));
  static final _$getBookmarkedTags =
      $grpc.ClientMethod<$2.TagRequest, $2.TagResponse>(
          '/deedee.service.TagService/getBookmarkedTags',
          ($2.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TagResponse.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.TagResponse> placeTag($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> removeTag($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> editTag($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editTag, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> getTags($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTags, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> addTagToFavorites($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTagToFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> removeTagFromFavorites(
      $2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTagFromFavorites, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> getFavoriteTags($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFavoriteTags, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> addTagToBookmarks($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTagToBookmarks, request, options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> removeTagFromBookmarks(
      $2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTagFromBookmarks, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.TagResponse> getBookmarkedTags($2.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBookmarkedTags, request, options: options);
  }
}

abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.service.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'placeTag',
        placeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'removeTag',
        removeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'editTag',
        editTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'getTags',
        getTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'addTagToFavorites',
        addTagToFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'removeTagFromFavorites',
        removeTagFromFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'getFavoriteTags',
        getFavoriteTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'addTagToBookmarks',
        addTagToBookmarks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'removeTagFromBookmarks',
        removeTagFromBookmarks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TagRequest, $2.TagResponse>(
        'getBookmarkedTags',
        getBookmarkedTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TagRequest.fromBuffer(value),
        ($2.TagResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.TagResponse> placeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return placeTag(call, await request);
  }

  $async.Future<$2.TagResponse> removeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return removeTag(call, await request);
  }

  $async.Future<$2.TagResponse> editTag_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return editTag(call, await request);
  }

  $async.Future<$2.TagResponse> getTags_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return getTags(call, await request);
  }

  $async.Future<$2.TagResponse> addTagToFavorites_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return addTagToFavorites(call, await request);
  }

  $async.Future<$2.TagResponse> removeTagFromFavorites_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return removeTagFromFavorites(call, await request);
  }

  $async.Future<$2.TagResponse> getFavoriteTags_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return getFavoriteTags(call, await request);
  }

  $async.Future<$2.TagResponse> addTagToBookmarks_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return addTagToBookmarks(call, await request);
  }

  $async.Future<$2.TagResponse> removeTagFromBookmarks_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return removeTagFromBookmarks(call, await request);
  }

  $async.Future<$2.TagResponse> getBookmarkedTags_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TagRequest> request) async {
    return getBookmarkedTags(call, await request);
  }

  $async.Future<$2.TagResponse> placeTag(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> removeTag(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> editTag(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> getTags(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> addTagToFavorites(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> removeTagFromFavorites(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> getFavoriteTags(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> addTagToBookmarks(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> removeTagFromBookmarks(
      $grpc.ServiceCall call, $2.TagRequest request);
  $async.Future<$2.TagResponse> getBookmarkedTags(
      $grpc.ServiceCall call, $2.TagRequest request);
}
