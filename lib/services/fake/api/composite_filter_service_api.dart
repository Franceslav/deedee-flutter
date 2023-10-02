import 'package:dartx/dartx.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../../../generated/deedee/api/model/composite_filter.pb.dart';
import '../../../generated/deedee/api/model/topic.pb.dart';
import '../../helper.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class CompositeFilterServiceApi {
  late Map<String, List<CompositeFilter>> _compositeFilters;
  late Map<String, FilterKeyList> _filterKeys;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final currentAppLocalization = await getLocalizationDirectly();

    _filterKeys = {
      "Car Wash": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId = (currentAppLocalization.mockFilterTitleParkingGarage)
          ..title = (currentAppLocalization).mockFilterKey24Hour,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyCovered,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyElectricCharging,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyValet,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyMotorCycle,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
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
      "Parking Garage": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyValet,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyMotorCycle,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyOverNight,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleCarWash
          ..title = currentAppLocalization.mockFilterKeySelfService,
      ]),
      "Gas station": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyTouchless,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyDiesel,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyBenzene,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKey24Hour,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyElectricCharging,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyElectrical,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyOverNight,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyShell,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyTATNEFT,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyLukoil,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeyORLEN,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleGasStation
          ..title = currentAppLocalization.mockFilterKeySTATOIL,
      ]),
      "Auto repair shop": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyOilChange,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeySuspensionRepair,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyEngineRepair,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyWheelRepair,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyElectricsRepair,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyPainting,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleAutoRepairShop
          ..title = currentAppLocalization.mockFilterKeyTransmissionRepair,
      ]),
      "Roadsidecafe": FilterKeyList(filterKeys: [
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleCarWash
          ..title = currentAppLocalization.mockFilterKeyFullService,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyOverNight,
        FilterKey()
          ..subtopicId = currentAppLocalization.mockFilterTitleParkingGarage
          ..title = currentAppLocalization.mockFilterKeyElectricCharging,

      ]),
      "Emergency Evacuation Stations": FilterKeyList(filterKeys: [

      ]),
      "Rest Areas": FilterKeyList(filterKeys: [

      ]),
    };
    _filterKeys.update('Gas station', (value) {
      value.filterKeys[0].selected = true;
      value.filterKeys[1].selected = true;
      value.filterKeys[2].selected = true;
      return value;
    });
    _compositeFilters = {
      'dnMzQqeXxAQ8N1LBVnF9Oe50ucs2': [
      CompositeFilter(
          compositeFilterId: Int64(0),
          userId: 'dnMzQqeXxAQ8N1LBVnF9Oe50ucs2',
          topic: Topic(title: 'Auto', topicId: 1),
          filterMap: _filterKeys,
          status: CompositeFilter_Status.FAVORITE,
          title: 'Test'),
      ],

      'buEDlPEYiVe8tuhLwN2287AqI9D3': [
        CompositeFilter(
            compositeFilterId: Int64(0),
            userId: 'buEDlPEYiVe8tuhLwN2287AqI9D3',
            topic: Topic(title: 'Auto', topicId: 1),
            filterMap: _filterKeys,
            status: CompositeFilter_Status.FAVORITE,
            title: 'Test'),
        CompositeFilter(
            compositeFilterId: Int64(0),
            userId: 'buEDlPEYiVe8tuhLwN2287AqI9D3',
            topic: Topic(title: 'Auto', topicId: 1),
            filterMap: _filterKeys,
            status: CompositeFilter_Status.FAVORITE,
            title: 'Test2'),
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
