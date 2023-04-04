import 'dart:io';
import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/generated/AccountService.pb.dart';
import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';


@LazySingleton(as: TagServiceClient, env: [Environment.dev])
class MockTagServiceClient implements TagServiceClient {
  AccountBloc bloc = AccountBloc();
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
  ResponseFuture<TagToBookmarkResponse> addTagToBookmark(
      TagToBookmarkRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, TagToBookmarkResponse>(
        _addTagToBookmark(request)));
  }

  Future<TagToBookmarkResponse> _addTagToBookmark(
      TagToBookmarkRequest request) async {
    return TagToBookmarkResponse()..succeed = true;
  }

  @override
  ResponseFuture<GetTopicResponse> getFilteredTags(GetTopicRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetTopicResponse>(_getFilteredTags(request)));
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
        ..bookmarked = true
        ..tagType = ACCOUNT_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp1,
      Tag()
        ..topicId = 'маникюр 2'
        ..messengerId = 'selenagomez'
        ..geoLocation = geoLocation2
        ..bookmarked = false
        ..tagType = ACCOUNT_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp2,
      Tag()
        ..topicId = 'маникюр 3'
        ..messengerId = 'arianagrande'
        ..geoLocation = geoLocation3
        ..bookmarked = true
        ..tagType = ACCOUNT_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp3,
      Tag()
        ..topicId = 'маникюр 4'
        ..messengerId = 'kyliejenner'
        ..geoLocation = geoLocation4
        ..bookmarked = true
        ..tagType = ACCOUNT_TYPE.valueOf(request.tagType.value)!
        ..dueDate = timestamp4,
    ];
    var topic = Topic()..tags.addAll(ftags);
    return GetTopicResponse()..topic = topic;
  }

  @override
  ResponseFuture<GetTopicResponse> getTopic(GetTopicRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetTopicResponse>(_getTopic(request)));
  }

  Future<GetTopicResponse> _getTopic(GetTopicRequest request) async {
    return GetTopicResponse()..topic = Topic();
  }

  // @override
  // ResponseFuture<GetTopicTitlesResponse> getTopics(
  //     GetTopicTitlesRequest request,
  //     {CallOptions? options}) {
  //   return ResponseFuture(
  //       FakeClientCall<dynamic, GetTopicTitlesResponse>(_getTopics(request)));
  // }
  //
  // Future<GetTopicTitlesResponse> _getTopics(
  //     GetTopicTitlesRequest request) async {
  //   return GetTopicTitlesResponse()
  //     ..topicTitles.addAll(["строительство", "маникюр", "сто"]);
  // }

  @override
  ResponseFuture<PlaceTagResponse> placeTag(PlaceTagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, PlaceTagResponse>(_placeTag(request)));
  }

  Future<PlaceTagResponse> _placeTag(PlaceTagRequest request) async {
    return PlaceTagResponse()..tag = Tag();
  }

  @override
  ResponseFuture<TagToBookmarkResponse> removeTagToBookmark(
      TagToBookmarkRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, TagToBookmarkResponse>(
        _removeTagToBookmark(request)));
  }

  Future<TagToBookmarkResponse> _removeTagToBookmark(
    TagToBookmarkRequest request,
  ) async {
    return TagToBookmarkResponse()..succeed = true;
  }

  @override
  ResponseFuture<VerifyAuthCodeResponse> verifyAuthCode(
      VerifyAuthCodeRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerifyAuthCodeResponse>(
        _verifyAuthCode(request)));
  }

  Future<VerifyAuthCodeResponse> _verifyAuthCode(
      VerifyAuthCodeRequest request) async {
    return VerifyAuthCodeResponse()..authenticated = true;
  }

  @override
  ResponseFuture<UserTagResponse> getUserTag(UserTagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, UserTagResponse>(_getUserTag(request)));
  }

  Future<UserTagResponse> _getUserTag(UserTagRequest request) async {
    var geoLocation2 = GeoLocation()
      ..latitude = 51.521
      ..longitude = -0.116
      ..title = 'маникюр 2';
    var timestamp2 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
              .round()
              .toString());
    final tag = Tag()
      ..tagId = '2'
      ..topicId = 'маникюр 2'
      ..messengerId = 'selenagomez'
      ..geoLocation = geoLocation2
      ..tagType = ACCOUNT_TYPE.SELL
      ..dueDate = timestamp2;
    return UserTagResponse()..tag = tag;
  }

  @override
  ResponseFuture<GetUserTagDetailsResponse> getUserTagDetails(
      GetUserTagDetailsRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetUserTagDetailsResponse>(
        _getUserTagDetails(request)));
  }

  Future<GetUserTagDetailsResponse> _getUserTagDetails(
      GetUserTagDetailsRequest request) async {
    final tagDetails = TagDetails()
      ..description = 'Ноготочки это для души, вообще у меня есть свой бизнес!'
      ..price = '300\$'
      ..timetable = 'Mon - Fri 08:00 am - 10:00 pm';
    return GetUserTagDetailsResponse()..tagDetails = tagDetails;
  }

  @override
  ResponseFuture<GetUserTagsResponse> getUserTags(GetUserTagsRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetUserTagsResponse>(_getUserTags(request)));
  }

  Future<GetUserTagsResponse> _getUserTags(GetUserTagsRequest request) async {
    String deviceLanguage =  bloc.appLocal?.languageCode ?? Platform.localeName.substring(0, 2);
    AppLocalizations myLocal =
        await AppLocalizations.delegate.load(Locale(deviceLanguage));

    var timestamp1 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
              .round()
              .toString());
    var timestamp2 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
              .round()
              .toString());
    var timestamp3 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
              .round()
              .toString());
    var timestamp4 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000 - 100000)
              .round()
              .toString());

    var geoLocation1 = GeoLocation()
      ..latitude = 51.51
      ..longitude = -0.1165888
      ..title = myLocal.mockFilterKey24Hour;

    var geoLocation2 = GeoLocation()
      ..latitude = 51.521
      ..longitude = -0.116
      ..title = myLocal.mockFilterKeyCovered;

    var geoLocation3 = GeoLocation()
      ..latitude = 51.53
      ..longitude = 0.1167
      ..title = myLocal.mockFilterKeyMotorCycle;

    var geoLocation4 = GeoLocation()
      ..latitude = 51.52134
      ..longitude = -0.1169
      ..title = myLocal.mockFilterKeyOverNight;

    var geoLocation5 = GeoLocation()
      ..latitude = 8.91489
      ..longitude = 38.5169
      ..title = myLocal.mockFilterKeyBenzene;

    var ftags = [
      Tag()
        ..tagId = '1'
        ..topicId = myLocal.mockFilterKey24Hour
        ..messengerId = 'beyonce'
        ..geoLocation = geoLocation1
        ..dueDate = timestamp1,
      Tag()
        ..tagId = '2'
        ..topicId = myLocal.mockFilterKeyCovered
        ..messengerId = 'selenagomez'
        ..geoLocation = geoLocation2
        ..tagType = ACCOUNT_TYPE.SELL
        ..dueDate = timestamp2,
      Tag()
        ..tagId = '3'
        ..topicId = myLocal.mockFilterKeyMotorCycle
        ..messengerId = 'arianagrande'
        ..geoLocation = geoLocation3
        ..tagType = ACCOUNT_TYPE.SELL
        ..dueDate = timestamp3,
      Tag()
        ..tagId = '4'
        ..topicId = myLocal.mockFilterKeyOverNight
        ..messengerId = 'kyliejenner'
        ..geoLocation = geoLocation4
        ..tagType = ACCOUNT_TYPE.SELL
        ..dueDate = timestamp4,
      Tag()
        ..tagId = '5'
        ..topicId = myLocal.mockFilterKeyBenzene
        ..messengerId = 'Dr. Peterson'
        ..geoLocation = geoLocation5
        ..tagType = ACCOUNT_TYPE.SELL
        ..dueDate = timestamp4,
    ];
    return GetUserTagsResponse()..tags.addAll(ftags);
  }

  @override
  ResponseFuture<UserTagResponse> removeUserTag(UserTagRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, UserTagResponse>(_removeUserTag(request)));
  }

  @override
  ResponseFuture<GetAllTopicsDescriptionResponse> getSubTopics(
      GetTopicTitlesRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetAllTopicsDescriptionResponse>(
            _getSubTopics(request)));
  }

  Future<GetAllTopicsDescriptionResponse> _getSubTopics(
      GetTopicTitlesRequest request) async {
    String deviceLanguage =  bloc.appLocal?.languageCode ?? Platform.localeName.substring(0, 2);

    final subTopics = [
      TopicDescription(
        id: 1,
        title: (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
            .mockFilterTitleParkingGarage,
        offerCount: 110,
      ),
      TopicDescription(
        id: 2,
        title: (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
            .mockFilterTitleCarWash,
        offerCount: 12,
      ),
      TopicDescription(
        id: 3,
        title: (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
            .mockFilterTitleGasStation,
        offerCount: 7,
      ),
    ];
    return GetAllTopicsDescriptionResponse()
      ..topicDescriptions.addAll(subTopics);
  }

  @override
  ResponseFuture<GetAllTopicsDescriptionResponse> getTopics(
      GetAllTopicsDescriptionRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, GetAllTopicsDescriptionResponse>(
            _getTopics(request)));
  }

  Future<GetAllTopicsDescriptionResponse> _getTopics(
      GetAllTopicsDescriptionRequest request) async {
    final topics = [
      TopicDescription(
        id: 1,
        title: 'Авто',
        offerCount: 110,
      ),
      TopicDescription(
        id: 2,
        title: 'Бьюти',
        offerCount: 12,
      ),
      TopicDescription(
        id: 3,
        title: 'Отделка',
        offerCount: 7,
      ),
      TopicDescription(
        id: 4,
        title: 'Дети',
        offerCount: 14,
      ),
      TopicDescription(
        id: 5,
        title: 'Рабочие',
        offerCount: 5,
      ),
      TopicDescription(
        id: 1,
        title: 'Клининг',
        offerCount: 10,
      ),
    ];
    return GetAllTopicsDescriptionResponse()..topicDescriptions.addAll(topics);
  }

  Future<UserTagResponse> _removeUserTag(UserTagRequest request) async {
    return UserTagResponse()..tag = Tag(isDeleted: false);
  }

  @override
  ResponseFuture<GetBookmarkTagsResponse> getBookmarkTags(
      GetBookmarkTagsRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetBookmarkTagsResponse>(
        _getBookmarkTags(request)));
  }

  Future<GetBookmarkTagsResponse> _getBookmarkTags(
      GetBookmarkTagsRequest request) async {
    String deviceLanguage =  bloc.appLocal?.languageCode ?? Platform.localeName.substring(0, 2);
    AppLocalizations myLocal =
        await AppLocalizations.delegate.load(Locale(deviceLanguage));

    return GetBookmarkTagsResponse()
      ..tags.addAll([
        Tag()
          ..tagId = '1'
          ..topicId = myLocal.mockFilterKeyOverNight
          ..geoLocation = GeoLocation(
            latitude: 50.8476,
            longitude: 4.3572,
            title: myLocal.mockFilterKeyOverNight,
          )
          ..messengerId = 'Beyonce',
        Tag()
          ..tagId = '2'
          ..topicId = myLocal.mockFilterKeyValet
          ..geoLocation = GeoLocation(
            latitude: 48.8566,
            longitude: 2.3522,
            title: myLocal.mockFilterKeyValet,
          )
          ..messengerId = 'Kylian Mbappe',
      ]);
  }
}
