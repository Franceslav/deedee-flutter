import 'package:dartx/dartx.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: TagServiceClient, env: [Environment.dev])
class MockTagServiceClient implements TagServiceClient {

  @override
  ClientCall<Q, R> $createCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request, {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<TagToBookmarkResponse> addTagToBookmark(TagToBookmarkRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, TagToBookmarkResponse>(_addTagToBookmark(request)));
  }

  Future<TagToBookmarkResponse> _addTagToBookmark(TagToBookmarkRequest request) async {
    return TagToBookmarkResponse()..succeed = true;
  }

  @override
  ResponseFuture<GetBookmarkTagsResponse> getBookmarkTags(GetBookmarkTagsRequest request, {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetBookmarkTagsResponse>(_getBookmarkTags(request)));
  }

  Future<GetBookmarkTagsResponse> _getBookmarkTags(GetBookmarkTagsRequest request) async {
    return GetBookmarkTagsResponse()..tags.addAll([]);
  }

  @override
  ResponseFuture<GetFilterKeysResponse> getFilterKeys(GetFilterKeysRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetFilterKeysResponse>(_getFilterKeys(request)));
  }

  Future<GetFilterKeysResponse> _getFilterKeys(GetFilterKeysRequest request) async {
    return GetFilterKeysResponse()..filterKeys.addAll([
      FilterKey()
        ..topicId = "маникюр"
        ..title = "японский",
      FilterKey()
        ..topicId = "маникюр"
        ..title = "я",
      FilterKey()
        ..topicId = "маникюр"
        ..title = "ф",
    ]);
  }

  @override
  ResponseFuture<GetTopicResponse> getFilteredTags(GetTopicRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetTopicResponse>(_getFilteredTags(request)));

  }

  Future<GetTopicResponse> _getFilteredTags(GetTopicRequest request) async {
      var geoLocation1 = GeoLocation()
        ..latitude = 51.51
        ..longitude = -0.1165888
        ..title = 'маникюр 1';

      var geoLocation2 = GeoLocation()
        ..latitude = 51.521
        ..longitude = -0.116
        ..title = 'маникюр 2';

      var geoLocation3 = GeoLocation()
        ..latitude = 51.53
        ..longitude = 0.1167
        ..title = 'маникюр 3';

      var geoLocation4 = GeoLocation()
        ..latitude = 51.52134
        ..longitude = -0.1169
        ..title = 'маникюр 4';

      var geoLocation5 = GeoLocation()
        ..latitude = 51.522
        ..longitude = 0.117
        ..title = 'маникюр 5';

      var timestamp1 = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
      var timestamp2 = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
      var timestamp3 = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
      var timestamp4 = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());

    var ftags = [
      Tag()
        ..topicId = 'маникюр'
        ..messengerId = 'beyonce'
        ..geoLocation = geoLocation1
        ..tagType = Tag_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp1,
      Tag()
        ..topicId = 'маникюр 2'
        ..messengerId = 'selenagomez'
        ..geoLocation = geoLocation2
        ..tagType = Tag_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp2,
      Tag()
        ..topicId = 'маникюр 3'
        ..messengerId = 'arianagrande'
        ..geoLocation = geoLocation3
        ..tagType = Tag_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp3,
      Tag()
        ..topicId = 'маникюр 4'
        ..messengerId = 'kyliejenner'
        ..geoLocation = geoLocation4
        ..tagType = Tag_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp4,
    ];
    var topic =  Topic()..tags.addAll(ftags);
    return GetTopicResponse()..topic = topic;

  }

  @override
  ResponseFuture<GetTopicResponse> getTopic(GetTopicRequest request, {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, GetTopicResponse>(_getTopic(request)));

  }
  Future<GetTopicResponse> _getTopic(GetTopicRequest request) async {
    return GetTopicResponse()..topic = Topic();
  }

  @override
  ResponseFuture<GetTopicTitlesResponse> getTopics(GetTopicTitlesRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetTopicTitlesResponse>(_getTopics(request)));
  }

  Future<GetTopicTitlesResponse> _getTopics(GetTopicTitlesRequest request) async {
    return GetTopicTitlesResponse()..topicTitles.addAll(["строительство", "маникюр", "сто"]);
  }

  @override
  ResponseFuture<PlaceTagResponse> placeTag(PlaceTagRequest request, {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, PlaceTagResponse>(_placeTag(request)));
  }

  Future<PlaceTagResponse> _placeTag(PlaceTagRequest request) async {
    return PlaceTagResponse()..tag =Tag();
  }

  @override
  ResponseFuture<TagToBookmarkResponse> removeTagToBookmark(TagToBookmarkRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, TagToBookmarkResponse>(_removeTagToBookmark(request)));
  }

  Future<TagToBookmarkResponse> _removeTagToBookmark(TagToBookmarkRequest request, ) async {
    return TagToBookmarkResponse()..succeed = true;
  }

  @override
  ResponseFuture<VerifyAuthCodeResponse> verifyAuthCode(VerifyAuthCodeRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerifyAuthCodeResponse>(_verifyAuthCode(request)));
  }

  Future<VerifyAuthCodeResponse> _verifyAuthCode(VerifyAuthCodeRequest request) async {
    return VerifyAuthCodeResponse()..authenticated = true;
  }
}