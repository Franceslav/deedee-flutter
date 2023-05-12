import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class TagServiceApi {
  late List<Tag> _fakeTags;
  late Map<String, List<Tag>> _tags;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    String deviceLanguage = Platform.localeName.substring(0, 2); 
    _fakeTags = [
      Tag()
        ..tagId = Int64(1)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: 'One'),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey1')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(2)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 2, userId: '', title: 'OneOne'),
          filterMap: {
            'TwoTwo': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey2')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.521, longitude: -0.116)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(3)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 3, userId: '', title: 'OneOneOne'),
          filterMap: {
            'TwoTwoTwo': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey3')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 38.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(4)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 - 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 3, userId: '', title: 'OneOneOneOne'),
          filterMap: {
            'TwoTwoTwoTwoTwoTwo': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey4')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 38.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(5)
        ..createdBy = Int64(5)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(
              topicId: 2,
              userId: '',
              title: 'Children',
              geolocation: Geolocation()),
          filterMap: {
            "Car Wash": FilterKeyList(filterKeys: [
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKey24Hour
                ..selected = true,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyCovered
                ..selected = true,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyElectricCharging
                ..selected = true,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyValet,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyMotorCycle,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleParkingGarage
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyOverNight,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleCarWash
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeySelfService,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleCarWash
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyFullService,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleCarWash
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyTouchless,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleGasStation
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyDiesel,
              FilterKey()
                ..subtopicId = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterTitleGasStation
                ..title = (await AppLocalizations.delegate
                        .load(Locale(deviceLanguage)))
                    .mockFilterKeyBenzene,
            ]),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 40.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.BOOKMARKED,
      Tag()
        ..tagId = Int64(6)
        ..createdBy = Int64(6)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 3000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 3, userId: '', title: 'Bookmark2'),
          filterMap: {
            'Bookmark22': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey6')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 39.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.BOOKMARKED
    ];
    _tags = {};
  }

  void setUserEmail(String userEmail) {
    _tags = {
      userEmail: _fakeTags,
    };
  }
  // Tags CRUD
  List<Tag> getTags(String userId) {
    return _tags.getOrElse(userId, () => []).toList();
  }

  List<Tag> getFavoriteTags(String userId) {
    return _tags
        .getOrElse(userId, () => [])
        .filter((element) => element.status == Tag_Status.BOOKMARKED)
        .toList();
  }

  Future<Tag> deleteTag(String userId, Int64 tagId) async {
    return _tags
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.tagId == tagId)
      ..status = Tag_Status.DELETED;
  }

  Tag addTagToFavorites(String userId, Int64 tagId) {
    return _tags
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.tagId == tagId)
      ..status = Tag_Status.BOOKMARKED;
  }

  Future<Tag> removeTagFromFavorites(String userId, Int64 tagId) async {
    return _tags
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.tagId == tagId)
      ..status = Tag_Status.PLACED;
  }

    Observation addObservation(Observation observation) {
      List<Tag> tags = _tags.values as List<Tag>;
      tags
        .firstWhere((tag) => tag.tagId == observation.tagId)
        .observations.add(observation);
      return observation;
  }
}
