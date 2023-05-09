import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/location_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/tag_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/verification_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

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

  Future<List<Location>> getAllLocations() async {
    final response = await _locationServiceClient.getAllLocations(LocationRequest());
    return response.locations;
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
