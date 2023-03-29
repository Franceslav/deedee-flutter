import 'package:deedee/generated/AccountService.pbgrpc.dart';
import 'package:deedee/generated/LocationService.pbgrpc.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/VerificationService.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/shared.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

import '../generated/ReferralService.pbgrpc.dart';
import '../model/order.dart' as order;

@LazySingleton(env: [Environment.dev, Environment.prod])
class GRCPRepository {
  final LocationServiceClient _locationServiceClient =
      locator.get<LocationServiceClient>();
  final AccountServiceClient _accountServiceClient =
      locator.get<AccountServiceClient>();

  final TagServiceClient _tagServiceClient = locator.get<TagServiceClient>();
  final VerificationServiceClient _verificationServiceClient =
      locator.get<VerificationServiceClient>();

  Future<bool> verifyAuthCode(String code) async {
    var response = await _tagServiceClient
        .verifyAuthCode(VerifyAuthCodeRequest()..code = code);

    return response.authenticated;
  }

  Future<bool> sendVerificationEmail(String email) async {
    String? url = await locator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await locator.get<SharedUtils>().getPrefsPort();
    String? ipAddress = await locator.get<SharedUtils>().getPublicIpAddress();
    //TODO
    if (url == null) {
      return false;
    }
    final channel = ClientChannel(
      url,
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
    final response = await _verificationServiceClient
        .verifyEmail(VerifyEmailRequest()..email = email);
    // return response.processed;
    return true;
  }

  Future<bool> verifyUserIdentity(FileChunk files) async {
    final response = await _verificationServiceClient
        .verifyDocuments(VerifyDocumentsRequest()..files.addAll([files]));
    // return response.processed;
    return true;
  }

  Future<List<Tag>> getUserTags(String userId) async {
    final response = await _tagServiceClient
        .getUserTags(GetUserTagsRequest()..userId = userId);
    return response.tags;
  }

  Future<bool> removeUserTag(String userId, String tagId) async {
    final response = await _tagServiceClient.removeUserTag(UserTagRequest()
      ..userId = userId
      ..tagId = tagId);
    return response.tag.isDeleted;
  }

  Future<bool> placeBidRequest(String userId, order.Order order) async {
    return true;
  }
}
