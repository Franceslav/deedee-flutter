import 'dart:io';
import 'dart:ui';

import 'package:dartx/dartx.dart';
import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/generated/topic_service.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class FilterServiceApi {
  late Map<String, List<CompositeFilter>> _compositeFilters;
  late Map<String, List<FilterKey>> _filterKeys;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    String deviceLanguage = Platform.localeName.substring(0, 2);
    _filterKeys = {
      "Car Wash": [
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKey24Hour,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyCovered,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyElectricCharging,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyValet,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyMotorCycle,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyOverNight,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeySelfService,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyFullService,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyTouchless,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyDiesel,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyBenzene,
      ],
      "Parking Garage": [
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyValet,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyMotorCycle,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyOverNight,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeySelfService,
      ],
      "Gas station": [
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyTouchless,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyDiesel,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyBenzene,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKey24Hour,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyCovered,
      ],
    };

    _compositeFilters = {
      '': [
        CompositeFilter(
          compositeFilterId: Int64(1),
          topic: Topic(title: '1'),
          filterMap: {},
          status: CompositeFilter_Status.BOOKMARKED,
        ),
        CompositeFilter(
          compositeFilterId: Int64(2),
          topic: Topic(title: '2'),
          filterMap: {},
          status: CompositeFilter_Status.BOOKMARKED,
        ),
        CompositeFilter(
          compositeFilterId: Int64(3),
          topic: Topic(title: '3'),
          filterMap: {},
          status: CompositeFilter_Status.BOOKMARKED,
        ),
      ]
    };
  }

  List<FilterKey> getFilterKeys(subtopic) {
    return _filterKeys.getOrElse(subtopic, () => []);
  }

  CompositeFilter createCompositeFilter({
    required String userId,
    required Int64 filterId,
    required Topic topic,
    required String subtopic,
    required List<FilterKey> filterKeys,
    required CompositeFilter_Status status,
  }) {
    var filter = CompositeFilter(
      compositeFilterId: filterId,
      topic: topic,
      filterMap: {subtopic: FilterKeyList(filterKeys: filterKeys)},
      status: status,
    );
    _compositeFilters.update(userId, (value) {
      value.add(filter);
      return value;
    });
    return filter;
  }

  List<CompositeFilter> readCompositeFilter(String userId) {
    return _compositeFilters.getOrElse(userId, () => []);
  }

  CompositeFilter updateCompositeFilter(
    String userId,
    Int64 filterId,
    String subtopic,
    List<FilterKey> filterKeys,
  ) {
    var currentFilter = _compositeFilters
        .getOrElse(userId, () => [])
        .firstWhere((element) => element.compositeFilterId == filterId);
    var updatedFilter = CompositeFilter(
      compositeFilterId: currentFilter.compositeFilterId,
      topic: currentFilter.topic,
      filterMap: {subtopic: FilterKeyList(filterKeys: filterKeys)},
      status: currentFilter.status,
    );
    currentFilter.status = CompositeFilter_Status.DELETED;
    return updatedFilter;
  }

  CompositeFilter deleteCompositeFilter(String userId, Int64 filterId) {
    return _compositeFilters
        .getOrElse(userId, () => [])
        .firstWhere((element) => element.compositeFilterId == filterId)
      ..status = CompositeFilter_Status.DELETED;
  }
}
