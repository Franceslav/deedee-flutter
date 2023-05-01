import 'dart:async';

import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/service/tag_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/tag_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TagServiceClient, env: [Environment.dev])
class MockTagServiceClient implements TagServiceClient {
  TagServiceApi api = locator.get<TagServiceApi>();
  AccountBloc bloc = AccountBloc();
  String retrieveUserIdFrom(TagRequest request) =>
      request.tag.compositeFilter.topic.userId;

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<TagResponse> placeTag(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_placeTag(request)));
  }

  Future<TagResponse> _placeTag(TagRequest request) async {
    return TagResponse(tags: [Tag()]);
  }

  @override
  ResponseFuture<TagResponse> addTagToBookmarks(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_addTagToBookmark(request)));
  }

  Future<TagResponse> _addTagToBookmark(TagRequest request) async {
    final userId = retrieveUserIdFrom(request);
    return TagResponse(
      tags: [
        api.addTagToFavorites(userId, request.tag.tagId),
      ],
    );
  }

  @override
  ResponseFuture<TagResponse> addTagToFavorites(TagRequest request,
      {CallOptions? options}) {
    // TODO: implement addTagToFavorites
    throw UnimplementedError();
  }

  @override
  ResponseFuture<TagResponse> editTag(TagRequest request,
      {CallOptions? options}) {
    // TODO: implement editTag
    throw UnimplementedError();
  }

  @override
  ResponseFuture<TagResponse> getBookmarkedTags(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_getBookmarkTags(request)));
  }

  Future<TagResponse> _getBookmarkTags(TagRequest request) async {
    final userId = retrieveUserIdFrom(request);
    return TagResponse()..tags.addAll(api.getFavoriteTags(userId));
  }

  @override
  ResponseFuture<TagResponse> getFavoriteTags(TagRequest request,
      {CallOptions? options}) {
    // TODO: implement getFavoriteTags
    throw UnimplementedError();
  }

  @override
  ResponseFuture<TagResponse> getTags(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_getTags(request)));
  }

  Future<TagResponse> _getTags(TagRequest request) {
    final userId = retrieveUserIdFrom(request);
    final completer = Completer<TagResponse>();
    completer.complete(
      TagResponse(
        tags: api.getTags(userId),
      ),
    );
    return completer.future;
  }

  @override
  ResponseFuture<TagResponse> removeTag(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_removeTag(request)));
  }

  Future<TagResponse> _removeTag(TagRequest request) async {
    final userId = retrieveUserIdFrom(request);
    return TagResponse()
      ..tags.add(await api.deleteTag(userId, request.tag.tagId));
  }

  @override
  ResponseFuture<TagResponse> removeTagFromBookmarks(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_removeTagFromBookmarks(request)));
  }

  Future<TagResponse> _removeTagFromBookmarks(TagRequest request) async {
    return TagResponse(tags: []);
  }

  @override
  ResponseFuture<TagResponse> removeTagFromFavorites(TagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TagResponse>(_removeTagFromFavorites(request)));
  }

  Future<TagResponse> _removeTagFromFavorites(TagRequest request) async {
    final userId = retrieveUserIdFrom(request);
    final responseTag =
        await api.removeTagFromFavorites(userId, request.tag.tagId);
    return TagResponse(tags: [responseTag]);
  }
}
