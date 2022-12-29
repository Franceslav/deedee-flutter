import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:ui';
import 'package:get/get.dart';
part 'account_state.dart';

class LocaleCubit extends ChangeNotifier {

  Locale? _appLocale = Get.deviceLocale;
  Locale get appLocal => _appLocale ?? Locale('en');

  void changeLocal(String s) {
    _appLocale = Locale(s);
    notifyListeners();
  }
}
