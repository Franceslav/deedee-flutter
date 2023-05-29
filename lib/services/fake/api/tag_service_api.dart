import 'package:dartx/dartx.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../../../generated/deedee/api/model/composite_filter.pb.dart';
import '../../../generated/deedee/api/model/geolocation.pb.dart';
import '../../../generated/deedee/api/model/observation.pb.dart';
import '../../../generated/deedee/api/model/tag.pb.dart';
import '../../../generated/deedee/api/model/topic.pb.dart';
import '../../../generated/google/protobuf/timestamp.pb.dart';
import '../../helper.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class TagServiceApi {
  late List<Tag> _fakeTags;
  late Map<String, List<Tag>> _tags;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final currentAppLocalization = await getLocalizationDirectly();

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
          topic: Topic(topicId: 1, userId: '', title: 'Workers'),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'ElectricCharging', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
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
          topic: Topic(topicId: 1, userId: '', title: 'Overhaul'),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'ElectricCharging', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(3)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 2, userId: '', title: 'Cleaning'),
          filterMap: {
            'TwoTwo': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'ElectricCharging', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.521, longitude: -0.116)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(4)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 3, userId: '', title: 'Beauty'),
          filterMap: {
            'TwoTwoTwo': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'ElectricCharging', selected: true),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 9.2, longitude: 46.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(5)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 - 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 2, userId: '', title: 'Children'),
          filterMap: {
            'Car Washh  ': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: true),
                FilterKey(title: 'ElectricCharging', selected: false),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 38.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(6)
        ..createdBy = Int64(1)
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 - 2000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 2, userId: '', title: 'Auto'),
          filterMap: {
            'Car Wash': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: true),
                FilterKey(title: 'ElectricCharging', selected: false),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 9.91489, longitude: 40.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(7)
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
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKey24Hour
                ..selected = true,
              FilterKey()
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKeyCovered
                ..selected = true,
              FilterKey()
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKeyElectricCharging
                ..selected = true,
              FilterKey()
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKeyValet,
              FilterKey()
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKeyMotorCycle,
              FilterKey()
                ..subtopicId =
                    currentAppLocalization.mockFilterTitleParkingGarage
                ..title = currentAppLocalization.mockFilterKeyOverNight,
              FilterKey()
                ..subtopicId = currentAppLocalization.mockFilterTitleCarWash
                ..title = currentAppLocalization.mockFilterKeySelfService,
              FilterKey()
                ..subtopicId = currentAppLocalization.mockFilterTitleCarWash
                ..title = currentAppLocalization.mockFilterKeyFullService,
              FilterKey()
                ..subtopicId = currentAppLocalization.mockFilterTitleCarWash
                ..title = currentAppLocalization.mockFilterKeyTouchless,
              FilterKey()
                ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
                ..title = currentAppLocalization.mockFilterKeyDiesel,
              FilterKey()
                ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
                ..title = currentAppLocalization.mockFilterKeyBenzene,
            ]),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 40.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.BOOKMARKED,
      Tag()
        ..tagId = Int64(8)
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
        .observations
        .add(observation);
    return observation;
  }
}
