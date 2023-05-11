///
//  Generated code. Do not modify.
//  source: deedee/api/service/tag_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tag_service.pb.dart' as $0;
export 'tag_service.pb.dart';

class TagServiceClient extends $grpc.Client {
  static final _$placeTag = $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
      '/deedee.api.tag.service.TagService/placeTag',
      ($0.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$removeTag = $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
      '/deedee.api.tag.service.TagService/removeTag',
      ($0.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$editTag = $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
      '/deedee.api.tag.service.TagService/editTag',
      ($0.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$getTags = $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
      '/deedee.api.tag.service.TagService/getTags',
      ($0.TagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$addTagToFavorites =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/addTagToFavorites',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$removeTagFromFavorites =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/removeTagFromFavorites',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$getFavoriteTags =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/getFavoriteTags',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$addTagToBookmarks =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/addTagToBookmarks',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$removeTagFromBookmarks =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/removeTagFromBookmarks',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));
  static final _$getBookmarkedTags =
      $grpc.ClientMethod<$0.TagRequest, $0.TagResponse>(
          '/deedee.api.tag.service.TagService/getBookmarkedTags',
          ($0.TagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TagResponse.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TagResponse> placeTag($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeTag, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> removeTag($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTag, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> editTag($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editTag, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> getTags($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> addTagToFavorites($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTagToFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> removeTagFromFavorites(
      $0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTagFromFavorites, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> getFavoriteTags($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFavoriteTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> addTagToBookmarks($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTagToBookmarks, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> removeTagFromBookmarks(
      $0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTagFromBookmarks, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.TagResponse> getBookmarkedTags($0.TagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBookmarkedTags, request, options: options);
  }
}

abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.tag.service.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'placeTag',
        placeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'removeTag',
        removeTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'editTag',
        editTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'getTags',
        getTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'addTagToFavorites',
        addTagToFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'removeTagFromFavorites',
        removeTagFromFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'getFavoriteTags',
        getFavoriteTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'addTagToBookmarks',
        addTagToBookmarks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'removeTagFromBookmarks',
        removeTagFromBookmarks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TagRequest, $0.TagResponse>(
        'getBookmarkedTags',
        getBookmarkedTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TagRequest.fromBuffer(value),
        ($0.TagResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TagResponse> placeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return placeTag(call, await request);
  }

  $async.Future<$0.TagResponse> removeTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return removeTag(call, await request);
  }

  $async.Future<$0.TagResponse> editTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return editTag(call, await request);
  }

  $async.Future<$0.TagResponse> getTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return getTags(call, await request);
  }

  $async.Future<$0.TagResponse> addTagToFavorites_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return addTagToFavorites(call, await request);
  }

  $async.Future<$0.TagResponse> removeTagFromFavorites_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return removeTagFromFavorites(call, await request);
  }

  $async.Future<$0.TagResponse> getFavoriteTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return getFavoriteTags(call, await request);
  }

  $async.Future<$0.TagResponse> addTagToBookmarks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return addTagToBookmarks(call, await request);
  }

  $async.Future<$0.TagResponse> removeTagFromBookmarks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return removeTagFromBookmarks(call, await request);
  }

  $async.Future<$0.TagResponse> getBookmarkedTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TagRequest> request) async {
    return getBookmarkedTags(call, await request);
  }

  $async.Future<$0.TagResponse> placeTag(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> removeTag(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> editTag(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> getTags(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> addTagToFavorites(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> removeTagFromFavorites(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> getFavoriteTags(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> addTagToBookmarks(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> removeTagFromBookmarks(
      $grpc.ServiceCall call, $0.TagRequest request);
  $async.Future<$0.TagResponse> getBookmarkedTags(
      $grpc.ServiceCall call, $0.TagRequest request);
}
