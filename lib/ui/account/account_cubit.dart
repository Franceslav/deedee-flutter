import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends ChangeNotifier {

  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  void changeLocal(String s) {
    _appLocale = Locale(s);
    notifyListeners();
  }
}
