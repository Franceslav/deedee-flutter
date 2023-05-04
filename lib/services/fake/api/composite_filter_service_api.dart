import 'dart:io';
import 'dart:ui';

import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class CompositeFilterServiceApi {
  late Map<String, List<CompositeFilter>> _compositeFilters;
  late Map<String, FilterKeyList> _filterKeys;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    String deviceLanguage = Platform.localeName.substring(0, 2);
    _filterKeys = {
      "Car Wash": FilterKeyList(filterKeys: [
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
      ]),
      "Parking Garage": FilterKeyList(filterKeys: [
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
      ]),
      "Gas station": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
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
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKey24Hour,
        FilterKey()
          ..subtopicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyCovered,
      ])
    };
    _filterKeys.update('Gas station', (value) {
      value.filterKeys[0].selected = true;
      value.filterKeys[1].selected = true;
      value.filterKeys[2].selected = true;
      return value;
    });
    _compositeFilters = {
      '': [
        CompositeFilter(
            compositeFilterId: Int64(0),
            userId: '',
            topic: Topic(title: 'Auto'),
            filterMap: _filterKeys,
            status: CompositeFilter_Status.FAVORITE,
            title: 'Test. Do not click'),
      ],
      'dnMzQqeXxAQ8N1LBVnF9Oe50ucs2' : [
        CompositeFilter(
            compositeFilterId: Int64(0),
            userId: 'dnMzQqeXxAQ8N1LBVnF9Oe50ucs2',
            topic: Topic(title: 'Auto'),
            filterMap: _filterKeys,
            status: CompositeFilter_Status.FAVORITE,
            title: 'Test'),
      ],
    };
  }

  List<FilterKey> getFilterKeys(subtopic) {
    return _filterKeys.getOrElse(subtopic, () => FilterKeyList()).filterKeys;
  }

  CompositeFilter createCompositeFilter(CompositeFilter compositeFilter) {
    _compositeFilters.update(compositeFilter.userId, (value) {
      value.add(compositeFilter);
      return value;
    });
    return compositeFilter;
  }

  List<CompositeFilter> readCompositeFilter(String userId) {
    return _compositeFilters.getOrElse(userId, () => []);
  }

  CompositeFilter updateCompositeFilter(
    String userId,
    Int64 filterId,
    Map<String, FilterKeyList> filterMap,
  ) {
    var currentFilter = _compositeFilters
        .getOrElse(userId, () => [])
        .firstWhere((element) => element.compositeFilterId == filterId);
    var updatedFilter = CompositeFilter(
      compositeFilterId: currentFilter.compositeFilterId,
      topic: currentFilter.topic,
      filterMap: filterMap,
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
