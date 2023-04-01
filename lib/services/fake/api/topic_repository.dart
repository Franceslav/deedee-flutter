import 'package:deedee/generated/AccountService.pbenum.dart';
import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/generated/TagService.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TopicRepository {
  final TagServiceClient _tagServiceClient = locator.get<TagServiceClient>();

  Future<Topic> getTopic(String topicId, AccountType accountType) async {
    var response = await _tagServiceClient.getTopic(GetTopicRequest()
      ..topicId = topicId
      ..tagType = ACCOUNT_TYPE.valueOf(accountType.index)!);
    // .then((p0) async {
    // await channel.shutdown();
    // },);

    return response.topic;
    //
  }

  Future<List<TopicDescription>> getTopics(
      double latitude, double longitude) async {
    var geoLocation = GeoLocation()
      ..latitude = latitude
      ..longitude = longitude;
    // return [Topic()..title = "test0", Topic()..title = "test1"];
    var response = await _tagServiceClient
        .getTopics(GetAllTopicsDescriptionRequest()..geoLocation = geoLocation);

    return response.topicDescriptions;
  }

  Future<List<TopicDescription>> getSubTopics(
      double latitude, double longitude) async {
    var geoLocation = GeoLocation()
      ..latitude = latitude
      ..longitude = longitude;
    // return [Topic()..title = "test0", Topic()..title = "test1"];
    var response = await _tagServiceClient
        .getSubTopics(GetTopicTitlesRequest()..geoLocation = geoLocation);

    return response.topicDescriptions;
  }
}
