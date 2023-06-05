import 'package:deedee/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiometricPrefs {
  static late SharedPreferences _BiometricPrefs;

  static final BiometricPrefs _instance = BiometricPrefs._internal();

  factory BiometricPrefs() => _instance;

  BiometricPrefs._internal();

  Future<void> init() async {
    _BiometricPrefs = await SharedPreferences.getInstance();
  }

  String get userEmail => _BiometricPrefs.getString(USER_EMAIL) ?? "";
  String get userPassword => _BiometricPrefs.getString(USER_PASSWORD) ?? "";
  bool get userBiometric => _BiometricPrefs.getBool(BIOMETRIC_ON) ?? false;

  set userEmail(String value) {
    _BiometricPrefs.setString(USER_EMAIL, value);
  }

  set userPassword(String value) {
    _BiometricPrefs.setString(USER_PASSWORD, value);
  }

  set userBiometric(bool value) {
    _BiometricPrefs.setBool(BIOMETRIC_ON, value);
  }
}
