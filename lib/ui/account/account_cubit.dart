import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
part 'account_state.dart';

class LocaleCubit extends ChangeNotifier {
  final uuid = Uuid();

  Locale? _appLocale = Get.deviceLocale;
  Locale get appLocal => _appLocale ?? Locale('en');

  void changeLocal(String s) {
    _appLocale = Locale(s);
    notifyListeners();
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Link copied'),
      ),
    );
  }

  String uudiURL(String email) {
    var uuidValue = uuid.v5(Uuid.NAMESPACE_URL, "${HTTPS_REF_DOMAIN}${email}");
    var ValueURL = "${HTTPS_REF_DOMAIN}${uuidValue}";
    Clipboard.setData(ClipboardData(text: "$ValueURL"));
    return ValueURL;
  }
}
