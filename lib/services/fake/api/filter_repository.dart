import 'dart:io';
import 'dart:ui';

import 'package:dartx/dartx.dart';
import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class FilterServiceApi {
  late Map<String, List<FilterKey>> _filterKeys;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    String deviceLanguage = Platform.localeName.substring(0, 2);
    _filterKeys = {
      "Car Wash": [
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKey24Hour,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyCovered,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyElectricCharging,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyValet,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyMotorCycle,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleParkingGarage
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyOverNight,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeySelfService,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyFullService,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleCarWash
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyTouchless,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyDiesel,
        FilterKey()
          ..topicId =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterTitleGasStation
          ..title =
              (await AppLocalizations.delegate.load(Locale(deviceLanguage)))
                  .mockFilterKeyBenzene,
      ]
    };
  }

  List<FilterKey> getFilterKeys(String subtopic) {
    return _filterKeys.getOrElse(subtopic, () => []);
  }
}
