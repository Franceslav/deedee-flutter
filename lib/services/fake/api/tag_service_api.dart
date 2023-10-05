import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

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
        ..createdBy = 'matveev.yakov@yahoo.com'
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
        ..tagId = Int64(1)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(2)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(3)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(3)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(4)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(7)
        ..createdBy = 'ron.x.by.su@gmail.com'
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
        ..tagId = Int64(6)
        ..createdBy = 'mister@mail.ru'
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
        ..geolocation = Geolocation(latitude: 13.754, longitude: 100.501)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(5)
        ..createdBy = 'matveev.yakov@yahoo.com'
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
        ..tagId = Int64(6)
        ..createdBy = 'matveev.yakov@yahoo.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 3000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          // compositeFilterId: Int64(1),
          topic: Topic(topicId: 3, userId: '', title: 'Bookmark2'),
          filterMap: {
            'Bookmark22': FilterKeyList(
              filterKeys: [FilterKey(title: 'filterKey6')],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 39.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.BOOKMARKED,
      Tag()
        ..tagId = Int64(7)
        ..createdBy = 'vierumary@yandex.ru'
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
            'Valet': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: true),
                FilterKey(title: 'ElectricCharging', selected: false),
                FilterKey(title: 'Valet', selected: true),
                FilterKey(title: 'Suspension', selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 38.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(8)
        ..createdBy = 'vierumary@yandex.ru'
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
            '24 Hour': FilterKeyList(
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
        ..tagId = Int64(9)
        ..createdBy = 'vierumary@yandex.ru'
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
            'Motor Cycle': FilterKeyList(
              filterKeys: [
                FilterKey(title: '24 Hour', selected: true),
                FilterKey(title: 'Covered', selected: true),
                FilterKey(title: 'Valet', selected: true),
                FilterKey(title: 'ElectricCharging', selected: false),
                FilterKey(title: 'Valet', selected: false),
                FilterKey(title: 'Suspension', selected: false),
                FilterKey(title: 'Motor Cycle', selected: true),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 8.91489, longitude: 38.5169)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(11)
        ..createdBy = 'vierumary@yandex.ru'
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
            'Car Washh': FilterKeyList(
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
        ..tagId = Int64(12)
        ..createdBy = 'vierumary@yandex.ru'
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
            'Car Washh': FilterKeyList(
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
        ..tagId = Int64(1)
        ..createdBy = 'frantslariinov@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
      // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: "STATOIL"),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: currentAppLocalization.mockFilterKeyShell, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyTATNEFT, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyLukoil, selected: false),
                FilterKey(title: currentAppLocalization.mockFilterKeyORLEN, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyElectrical, selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(1)
        ..createdBy = 'frantslariinov@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
      // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: "Shell"),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: currentAppLocalization.mockFilterKeyElectrical, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyTATNEFT, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyLukoil, selected: false),
                FilterKey(title: currentAppLocalization.mockFilterKeyORLEN, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeySTATOIL, selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(1)
        ..createdBy = 'frantslariinov@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
      // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: "TATNEFT"),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: currentAppLocalization.mockFilterKeyShell, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyElectrical, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyLukoil, selected: false),
                FilterKey(title: currentAppLocalization.mockFilterKeyORLEN, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeySTATOIL, selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(1)
        ..createdBy = 'frantslariinov@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
      // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: "Lukoil"),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: currentAppLocalization.mockFilterKeyShell, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyTATNEFT, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyElectrical, selected: false),
                FilterKey(title: currentAppLocalization.mockFilterKeyORLEN, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeySTATOIL, selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(1)
        ..createdBy = 'frantslariinov@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
      // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: "ORLEN"),
          filterMap: {
            'Two': FilterKeyList(
              filterKeys: [
                FilterKey(title: currentAppLocalization.mockFilterKeyShell, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyTATNEFT, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeyLukoil, selected: false),
                FilterKey(title: currentAppLocalization.mockFilterKeyElectrical, selected: true),
                FilterKey(title: currentAppLocalization.mockFilterKeySTATOIL, selected: false),
              ],
            ),
          },
        )
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
      Tag()
        ..tagId = Int64(1)
        ..createdBy = '12345@gmail.com'
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
        ..tagId = Int64(1)
        ..createdBy = '12345@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: 'ORLEN'),
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
        ..tagId = Int64(1)
        ..createdBy = '12345@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: 'Lukoil'),
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
        ..tagId = Int64(1)
        ..createdBy = '12345@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        // ..createdBy = Int64.parseInt((DateTime.now().isTomorrow).toString())
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(topicId: 1, userId: '', title: 'TATNEFT'),
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
    ];
    _tags = {};
  }

  void setUserEmail(String userEmail) {
    _tags = {
      userEmail: _fakeTags,
    };
  }

  // Tags CRUDs
  List<Tag> getTags(String email) {
    return _tags.getOrElse(email, () => []).toList();
  }

  List<Tag> placeTags(
      String userEmail,
      String userId,
      String topicTitle,
      Map<String, FilterKeyList> filterMap,
      double latitude,
      double longitude,
      int topicId) {
    _fakeTags.add(
      Tag()
        ..tagId = _fakeTags.last.tagId + Int64(1)
        ..createdBy = userEmail
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000)
                    .round()
                    .toString()))
        ..compositeFilter = CompositeFilter(
          compositeFilterId: Int64(1), // что за параметр?
          topic: Topic(
              topicId: topicId,
              userId: '',
              title: topicTitle), // пустой user id убрать?
          filterMap: filterMap,
        )
        ..geolocation = Geolocation(latitude: latitude, longitude: longitude)
        ..type = Tag_Type.CLIENT
        ..status = Tag_Status.PLACED,
    );
    return _tags.getOrElse(userId, () => []).toList();
  }

  List<Tag> getFavoriteTags(String email) {
    return _tags
        .getOrElse(email, () => [])
        .filter((element) => element.status == Tag_Status.BOOKMARKED)
        .toList();
  }

  Future<Tag> deleteTag(String email, Int64 tagId) async {
    return _tags
        .getOrElse(email, () => [])
        .firstWhere((rq) => rq.tagId == tagId)
      ..status = Tag_Status.DELETED;
  }

  Tag addTagToFavorites(String email, Int64 tagId) {
    return _tags
        .getOrElse(email, () => [])
        .firstWhere((rq) => rq.tagId == tagId)
      ..status = Tag_Status.BOOKMARKED;
  }

  Future<Tag> removeTagFromFavorites(String email, Int64 tagId) async {
    return _tags
        .getOrElse(email, () => [])
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
