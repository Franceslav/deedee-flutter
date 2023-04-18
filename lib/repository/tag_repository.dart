import 'package:deedee/generated/AccountService.pbenum.dart';
import 'package:deedee/generated/filter_service.pb.dart';
import 'package:deedee/generated/tag_service.pb.dart';
import 'package:deedee/generated/tag_service.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/generated/topic_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/client_channel.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../generated/geolocation_service.pb.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TagRepository {
  final TagServiceClient _tagServiceClient = locator.get<TagServiceClient>();

  Future<Tag> placeTag(
      AccountType accountType,
      String topic,
      String messengerId,
      double lat,
      double lon,
      List<String> filterKeys) async {
    var timestamp = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var geo = Geolocation()
      ..latitude = lat
      ..longitude = lon;
    var tag = Tag()
      ..tagId = Int64(0)
      ..geolocation = geo
      ..createdAt = timestamp
      ..type = Tag_Type.valueOf(accountType.index)!; //TODO:

    var response = await _tagServiceClient.placeTag(TagRequest()..tag = tag);

    return response.tags.first;
  }

  // Future<List<Tag>> getTags(String topicId, AccountType accountType) async {
  //   var response =
  //       await _tagServiceClient.getTags(TagRequest()..tag = Tag()); //TODO:

  //   return response.tags;
  // }

  Future<List<Tag>> getTags(String userId) async {
    final response = await _tagServiceClient.getTags(
        TagRequest(tag: Tag(compositeFilter: CompositeFilter(topic: Topic(userId: userId))))
    );
    return response.tags;
  }

  Future<Tag> deleteTag(String userId, Int64 tagId) async {
    final response = await _tagServiceClient.removeTag(
        TagRequest(tag: Tag(
            tagId: tagId, compositeFilter: CompositeFilter(topic: Topic(userId: userId))
        ))
    );
    return response.tags.first;
  }

  Future<List<Tag>> getBookmarkTags(String userId) async {
    final response = await _tagServiceClient.getBookmarkedTags(
        TagRequest()..tag = Tag(status: Tag_Status.BOOKMARKED));
    return response.tags;
  }

// Future<Tag> deleteTag(TagRequest request, {dynamic options}) async {
//   return (await _tagServiceClient.removeTag(request)).tags.first;
// }
}




// .removeUserTag(UserTagRequest()
//       ..userId = userId
//       ..tagId = tagId);






