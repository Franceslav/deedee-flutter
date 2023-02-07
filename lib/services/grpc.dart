import 'package:deedee/generated/AccountService.pbgrpc.dart' as account_service;
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/VerificationService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/services/shared.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import '../generated/AccountService.pb.dart';
import '../generated/AccountService.pbgrpc.dart';
import '../generated/LocationService.pb.dart';
import '../generated/ReferralService.pbgrpc.dart';

class GRCPUtils {
  late TagServiceClient stub;

  Future<ClientChannel> createChannel() async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    return ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  Future<void> placeTag(
      AccountType accountType,
      String topic,
      String messengerId,
      double lat,
      double lon,
      List<String> filterKeys) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);
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

      var response = await stub.placeTag(PlaceTagRequest()
        ..tag = tag
        ..filters.addAll(filterKeys));
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Topic> getBucket(String topicId, AccountType accountType) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);

    var response = await stub.getTopic(GetTopicRequest()
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
    final channel = await createChannel();
    final stub = TagServiceClient(channel);

    var response = await stub.getFilteredTags(GetTopicRequest()
      ..topicId = topicId
      ..filters.addAll(activeFilters)
      ..tagType = Tag_TYPE.valueOf(accountType.index)!);

    return response.topic;
  }

  Future<List<String>> getTopics(double latitude, double longitude) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);

    var geoLocation = GeoLocation()
      ..latitude = latitude
      ..longitude = longitude;
    // return [Topic()..title = "test0", Topic()..title = "test1"];
    var response = await stub
        .getTopics(GetTopicTitlesRequest()..geoLocation = geoLocation);

    return response.topicTitles;
  }

  Future<List<FilterKey>> getFilterItems(String topic) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);

    var response =
        await stub.getFilterKeys(GetFilterKeysRequest()..topicId = topic);

    return response.filterKeys;
  }

  Future<bool> verifyAuthCode(String code) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);

    var response =
        await stub.verifyAuthCode(VerifyAuthCodeRequest()..code = code);

    return response.authenticated;
  }

  Future<bool> sendVerificationEmail(String email) async {
    String? ipAddress =
        await serviceLocator.get<SharedUtils>().getPublicIpAddress();
    final channel = await createChannel();
    final stub = VerificationServiceClient(channel);
    final response = await stub.verifyEmail(VerifyEmailRequest()
      ..email = email
      ..ipAddress = ipAddress);
    return response.processed;
  }

  Future<List<UserReferral>> getUserReferrals(String email) async {
    final channel = await createChannel();
    final stub = ReferralServiceClient(channel);
    var response =
        await stub.getUserReferrals(GetUserReferralsRequest()..email = email);
    return response.userReferral;
  }

  Future<bool> topUpAccount(double amount) async {
    final channel = await createChannel();
    final stub = account_service.AccountServiceClient(channel);
    final response =
        await stub.topUp(account_service.TopUpRequest()..amount = amount);
    return response.succeed;
  }

  Future<double> getUserBalance(String userId) async {
    final channel = await createChannel();
    final stub = account_service.AccountServiceClient(channel);
    final response = await stub
        .getBalance(account_service.GetBalanceRequest()..userId = userId);
    return response.balance;
  }

  Future<List<Tag>> getUserBookmarks(String userId) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);
    final response =
        await stub.getBookmarkTags(GetBookmarkTagsRequest()..userId = userId);
    return response.tags;
  }

  Future<bool> removeUserBookmark(String userId, String tagId) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);
    final response = await stub.removeTagToBookmark(TagToBookmarkRequest()
      ..userId = userId
      ..tagId = tagId);
    return response.succeed;
  }

  Future<bool> addUserBookmark(String userId, String tagId) async {
    final channel = await createChannel();
    final stub = TagServiceClient(channel);
    final response = await stub.addTagToBookmark(TagToBookmarkRequest()
      ..userId = userId
      ..tagId = tagId);
    return response.succeed;
  }

  Future<bool> getUserPremiumStatus(String userId) async {
    final channel = await createChannel();
    final stub = AccountServiceClient(channel);
    final response =
        await stub.getAccountStatus(AccountStatusRequest()..userId = userId);
    return response.isPremium;
  }

  Future<bool> toggleUserPremiumStatus(String userId) async {
    final channel = await createChannel();
    final stub = AccountServiceClient(channel);
    final response =
        await stub.toggleAccountStatus(AccountStatusRequest()..userId = userId);
    // return response.isPremium;
    return true;
  }
}
