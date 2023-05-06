import 'package:deedee/generated/LocationService.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/tag_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/verification_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/shared.dart';
import 'package:fixnum/fixnum.dart';
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

  Future<List<Place>> getPlaces(GeoLocation geoLocation, double radius) async {
    final response = await _locationServiceClient.getPlaces(GetPlacesRequest()
      ..geoLocation = geoLocation
      ..radius = radius);
    return response.places;
  }

  Future<bool> bookmarkTag(String userId) async {
    final response =
        await _tagServiceClient.addTagToBookmarks(TagRequest()..tag = Tag());
    return response.tags.first.status == Tag_Status.BOOKMARKED;
  }

  Future<List<Tag>> getUserBookmarks(String userId) async {
    final response = await _tagServiceClient
        .getBookmarkedTags(TagRequest()..tag = Tag()); //TODO
    return response.tags;
  }

  Future<bool> removeUserBookmark(String userId, String tagId) async {
    final response =
        await _tagServiceClient.addTagToBookmarks(TagRequest()..tag = Tag());
    return response.tags.first.status == Tag_Status.PLACED;
  }

  Future<bool> addUserBookmark(String userId, String tagId) async {
    final response =
        await _tagServiceClient.addTagToBookmarks(TagRequest()..tag = Tag());
    return response.tags.first.status == Tag_Status.BOOKMARKED;
  }

  Future<List<Tag>> getUserTags(String userId) async {
    final response = await _tagServiceClient.getTags(TagRequest()..tag = Tag());
    return response.tags;
  }

  Future<bool> removeUserTag(String userId, Int64 tagId) async {
    final response = await _tagServiceClient.removeTag(TagRequest()); //TODO:
    return response.tags.first.status == Tag_Status.DELETED;
  }

  Future<bool> placeBidRequest(String userId, order.Order order) async {
    return true;
  }

  Future<bool> removeUserRequest(String userId, String requestsId) async {
    return false;
  }
}
