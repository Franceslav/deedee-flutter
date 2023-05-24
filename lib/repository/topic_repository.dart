import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/subtopic.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/service/topic_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TopicRepository {
  final TopicServiceClient _topicServiceClient =
      locator.get<TopicServiceClient>();

  Future<List<Topic>> getTopics(double latitude, double longitude) async {
    var response = await _topicServiceClient.getTopics(
      TopicRequest()
        ..topic = Topic(
          geolocation: Geolocation(
            latitude: latitude,
            longitude: longitude,
          ),
        ),
    );

    return response.topics;
  }

  Future<List<Subtopic>> getSubTopics(
      userId, int topicId, double latitude, double longitude) async {
    var response = /* Bad state: No element*/
        await _topicServiceClient.getSubtopics(
      SubtopicRequest()
        ..subtopic = Subtopic(
          topicId: topicId,
          geolocation: Geolocation()
            ..latitude = latitude
            ..longitude = longitude,
          userId: userId,
        ),
    );

    return response.subtopics;
  }
}
