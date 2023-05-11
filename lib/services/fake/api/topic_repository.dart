import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/subtopic.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TopicServiceApi {
  late List<Topic> _topics;
  late Map<Topic, List<Subtopic>> _subtopics;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    String deviceLanguage = Platform.localeName.substring(0, 2);
    _topics = [
      Topic(
        userId: "",
        topicId: 1,
        title: "Auto",
        geolocation: Geolocation(),
      ),
      Topic(
        userId: "",
        topicId: 2,
        title: "Children",
        geolocation: Geolocation(),
      ),
    ];
    _subtopics = {
      _topics[0]: [
        Subtopic(topicId: 1, subtopicId: 1, title: "Car Wash"),
        Subtopic(topicId: 1, subtopicId: 1, title: "Parking Garage"),
        Subtopic(topicId: 1, subtopicId: 1, title: "Gas station"),
      ],
      _topics[1]: [
        Subtopic(topicId: 1, subtopicId: 1, title: "Car Wash"),
        Subtopic(topicId: 1, subtopicId: 1, title: "Gas station"),
      ],
    };
  }

  Future<List<Topic>> getTopics(userId, latitude, longitude) async {
    return _topics.filter((t) => t.userId == userId).toList();
  }

  Future<List<Subtopic>> getSubTopics(
      userId, topicId, latitude, longitude) async {
    var subtopics = _subtopics.getOrElse(
        _subtopics.keys.firstWhere((t) => t.topicId == topicId), () => []);
    return subtopics;
  }
}
