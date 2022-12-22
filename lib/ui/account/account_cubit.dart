import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> with ChangeNotifier {
  AccountCubit() : super(AccountInitial());

  Locale _appLocale = const Locale('ru');

  Locale get appLocal => _appLocale ?? const Locale("en");

  void changeLocal(String s) {
    _appLocale = Locale(s);
    notifyListeners();
  }
}
