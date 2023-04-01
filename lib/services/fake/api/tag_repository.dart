import 'package:deedee/generated/AccountService.pbenum.dart';
import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/client_channel.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TagRepository {
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
        ..tagType = ACCOUNT_TYPE.valueOf(accountType.index)!;

      var response = await _tagServiceClient.placeTag(PlaceTagRequest()
        ..tag = tag
        ..filters.addAll(filterKeys));
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Topic> getFilteredTags(String topicId, List<String> activeFilters,
      AccountType accountType) async {
    var response = await _tagServiceClient.getFilteredTags(GetTopicRequest()
      ..topicId = topicId
      ..filters.addAll(activeFilters)
      ..tagType = ACCOUNT_TYPE.valueOf(accountType.index)!);

    return response.topic;
  }

  Future<TagDetails> getUserTagDetails(String userId, String tagId) async {
    final response =
        await _tagServiceClient.getUserTagDetails(GetUserTagDetailsRequest()
          ..userId = userId
          ..tagId = tagId);
    return response.tagDetails;
  }

  Future<Tag> getUserTag(String userId, String tagId) async {
    final response = await _tagServiceClient.getUserTag(UserTagRequest()
      ..userId = userId
      ..tagId = tagId);
    return response.tag;
  }
}
