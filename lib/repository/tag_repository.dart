import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'observation_repository.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/service/tag_service.pbgrpc.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class TagRepository {
  final TagServiceClient _tagServiceClient = locator.get<TagServiceClient>();
  final ObservationRepository _observationRepository = locator.get<ObservationRepository>();

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

  Future<List<Tag>> getTags(String userId) async {
    Observation observation = await _observationRepository.addObservation(
      observationId: Int64(DateTime.now().microsecondsSinceEpoch), 
      userId: Int64(0),
      latitude: Geolocation().latitude,
      longitude: Geolocation().longitude,
      );

    final response = await _tagServiceClient.getTags(TagRequest(
        tag: Tag(
              compositeFilter: CompositeFilter(topic: Topic(userId: userId)),
              observations: [observation],
        )
      )
     );
    return response.tags;
  }

  Future<List<Tag>> getTagsByName(String title) async {
    Observation observation = await _observationRepository.addObservation(
      observationId: Int64(DateTime.now().microsecondsSinceEpoch), 
      userId: Int64(0),
      latitude: Geolocation().latitude,
      longitude: Geolocation().longitude,
      );
    final response = await _tagServiceClient.getTags(TagRequest(
        tag: Tag(
              compositeFilter: CompositeFilter(topic: Topic(title: title)),
              observations: [observation],
        )
      )
     );
    return response.tags;
  }

  Future<Tag> deleteTag(String userId, Int64 tagId) async {
    final response = await _tagServiceClient.removeTag(TagRequest(
        tag: Tag(
            tagId: tagId,
            compositeFilter: CompositeFilter(topic: Topic(userId: userId)))));
    return response.tags.first;
  }

  Future<List<Tag>> getFavoriteTags(String email) async {
    Observation observation = await _observationRepository.addObservation(
      observationId: Int64(DateTime.now().microsecondsSinceEpoch), 
      userId: Int64(0),
      latitude: Geolocation().latitude,
      longitude: Geolocation().longitude,
      );
    final response = await _tagServiceClient.getTags(TagRequest(
        tag: Tag(
              compositeFilter: CompositeFilter(topic: Topic(title: email)),
              observations: [observation],
        )
      )
     );
    return response.tags;
  }

  Future<Tag> addTagToFavorites(String email, Int64 tagId) async {
    final response = await _tagServiceClient.addTagToBookmarks(TagRequest(
        tag: Tag(
            tagId: tagId,
            compositeFilter: CompositeFilter(topic: Topic(userId: email)))));
    return response.tags.first;
  }

  Future<Tag> removeTagFromFavorites(String email, Int64 tagId) async {
    final response = await _tagServiceClient.removeTagFromFavorites(TagRequest(
        tag: Tag(
            tagId: tagId,
            compositeFilter: CompositeFilter(topic: Topic(userId: email)))));
    return response.tags.first;
  }
}
