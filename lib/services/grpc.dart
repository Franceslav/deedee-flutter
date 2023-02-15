import 'dart:io';

import 'package:deedee/generated/AccountService.pbgrpc.dart' as account_service;
import 'package:deedee/generated/AccountService.pbgrpc.dart';
import 'package:deedee/generated/LocationService.pbgrpc.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/VerificationService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/client_channel.dart';
import 'package:deedee/services/shared.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

import '../generated/ReferralService.pbgrpc.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class GRCPUtils {
  final LocationServiceClient _locationServiceClient =
      locator.get<LocationServiceClient>();
  final AccountServiceClient _accountServiceClient =
      locator.get<AccountServiceClient>();
  final TagServiceClient _tagServiceClient = locator.get<TagServiceClient>();

  Future<void> placeTag(
      AccountType accountType,
      String topic,
      String messengerId,
      double lat,
      double lon,
      List<String> filterKeys) async {
    ProtobufClientChannel c = ProtobufClientChannel();
    var channel = await c.createChannel();

    try {
      var timestamp = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
      var geo = GeoLocation()
        ..latitude = lat
        ..longitude = lon
        ..title = "";
      var tag = Tag()
        ..topicId = topic
        ..messengerId = messengerId
        ..geoLocation = geo
        ..dueDate = timestamp
        ..tagType = Tag_TYPE.valueOf(accountType.index)!;

      var response = await _tagServiceClient.placeTag(PlaceTagRequest()
        ..tag = tag
        ..filters.addAll(filterKeys));
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Topic> getTopic(String topicId, AccountType accountType) async {
    var response = await _tagServiceClient.getTopic(GetTopicRequest()
      ..topicId = topicId
      ..tagType = Tag_TYPE.valueOf(accountType.index)!);
    // .then((p0) async {
    // await channel.shutdown();
    // },);

    return response.topic;
    //
  }

  Future<Topic> getFilteredTags(String topicId, List<String> activeFilters,
      AccountType accountType) async {
    var response = await _tagServiceClient.getFilteredTags(GetTopicRequest()
      ..topicId = topicId
      ..filters.addAll(activeFilters)
      ..tagType = Tag_TYPE.valueOf(accountType.index)!);

    return response.topic;
  }

  Future<List<String>> getTopics(double latitude, double longitude) async {
    var geoLocation = GeoLocation()
      ..latitude = latitude
      ..longitude = longitude;
    // return [Topic()..title = "test0", Topic()..title = "test1"];
    var response = await _tagServiceClient
        .getTopics(GetTopicTitlesRequest()..geoLocation = geoLocation);

    return response.topicTitles;
  }

  Future<List<FilterKey>> getFilterItems(String topic) async {
    var response = await _tagServiceClient
        .getFilterKeys(GetFilterKeysRequest()..topicId = topic);

    return response.filterKeys;
  }

  Future<bool> verifyAuthCode(String code) async {
    var response = await _tagServiceClient
        .verifyAuthCode(VerifyAuthCodeRequest()..code = code);

    return response.authenticated;
  }

  Future<bool> sendVerificationEmail(String email) async {
    String? url = await locator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await locator.get<SharedUtils>().getPrefsPort();
    String? ipAddress = await locator.get<SharedUtils>().getPublicIpAddress();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VerificationServiceClient(channel);
    final response = await stub.verifyEmail(VerifyEmailRequest()
      ..email = email
      ..ipAddress = ipAddress);
    return response.processed;
  }

  Future<List<UserReferral>> getUserReferrals(String email) async {
    String? url = await locator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await locator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ReferralServiceClient(channel);
    var response =
        await stub.getUserReferrals(GetUserReferralsRequest()..email = email);
    return response.userReferral;
  }

  Future<bool> topUpAccount(double amount) async {
    final response =
        await _accountServiceClient.topUp(TopUpRequest()..amount = amount);
    return response.succeed;
  }

  Future<double> getUserBalance(String userId) async {
    final response = await _accountServiceClient
        .getBalance(GetBalanceRequest()..userId = userId);
    return response.balance;
  }

  Future<List<Place>> getPlaces(GeoLocation geoLocation, double radius) async {
    final response = await _locationServiceClient.getPlaces(GetPlacesRequest()
      ..geoLocation = geoLocation
      ..radius = radius);
    return response.places;
  }

  Future<bool> bookmarkTag(String userId) async {
    final response = await _tagServiceClient
        .addTagToBookmark(TagToBookmarkRequest()..userId = userId);
    return response.succeed;
  }

  Future<List<Tag>> getUserBookmarks(String userId) async {
    final response = await _tagServiceClient
        .getBookmarkTags(GetBookmarkTagsRequest()..userId = userId);
    return response.tags;
  }

  Future<bool> removeUserBookmark(String userId, String tagId) async {
    final response =
        await _tagServiceClient.removeTagToBookmark(TagToBookmarkRequest()
          ..userId = userId
          ..tagId = tagId);
    return response.succeed;
  }

  Future<bool> addUserBookmark(String userId, String tagId) async {
    final response =
        await _tagServiceClient.addTagToBookmark(TagToBookmarkRequest()
          ..userId = userId
          ..tagId = tagId);
    return response.succeed;
  }

  Future<bool> getUserPremiumStatus(String userId) async {
    final response = await _accountServiceClient
        .getAccountStatus(AccountStatusRequest()..userId = userId);
    return response.isPremium;
  }

  Future<bool> toggleUserPremiumStatus(String userId) async {
    final response = await _accountServiceClient
        .toggleAccountStatus(AccountStatusRequest()..userId = userId);
    // return response.isPremium;
    return true;
  }

  Future<bool> verifyUserEmail(String email) async {
    // final channel = await createChannel();
    // final stub = VerificationServiceClient(channel);
    // final response =
    //     await stub.verifyEmail(VerifyEmailRequest()..email = email);
    // return response.processed;
    return true;
  }

  Future<bool> verifyUserIdentity(File files) async {
    // final channel = await createChannel();
    // final stub = VerificationServiceClient(channel);
    // final response =
    //     await stub.verifyDocuments(VerifyDocumentsRequest()..files = files);
    // return response.processed;
    return true;
  }
}
