import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "Name is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validateMobile(String? value) {
  String pattern = r'(^\+?[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "Mobile phone number is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Mobile phone number must contain only digits";
  }
  return null;
}

String? validatePassword(String? value) {
  if ((value?.length ?? 0) < 6) {
    return 'Password must be more than 5 characters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validateInstagram(String? value) {
  String pattern =
      r'(?:^|[^\w])(?:@)([A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\.(?!\.))){0,28}(?:[A-Za-z0-9_]))?)';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Instagram Id';
  } else {
    return null;
  }
}

String? validateTelegram(String? value) {
  String pattern =
      r'(?:^|[^\w])(?:@)([A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\.(?!\.))){0,28}(?:[A-Za-z0-9_]))?)';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Telegram Id';
  } else {
    return null;
  }
}

String? validateTopic(String? value) {
  String pattern = r'.';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Topic';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password doesn\'t match';
  } else if (confirmPassword?.isEmpty ?? true) {
    return 'Confirm password is required';
  } else {
    return null;
  }
}

bool isDialogActive = false;

void showProgress(BuildContext context, String message, bool isDismissible) {
  showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) => Dialog(
            backgroundColor: const Color(COLOR_PRIMARY),
            elevation: 10.0,
            insetAnimationCurve: Curves.easeInOut,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(Color(COLOR_PRIMARY)),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      message,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ));
  isDialogActive = true;
}

void hideProgress(BuildContext context) {
  if (isDialogActive) {
    Navigator.pop(context);
    isDialogActive = false;
  }
}

//helper method to show alert dialog
showAlertDialog(BuildContext context, String title, String content) {
  // set up the AlertDialog
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

pushReplacement(BuildContext context, Widget destination) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => destination));
}

push(BuildContext context, Widget destination) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

pushAndRemoveUntil(BuildContext context, Widget destination, bool predict) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => destination),
      (Route<dynamic> route) => predict);
}

Widget displayCircleImage(String picUrl, double size, hasBorder) =>
    CachedNetworkImage(
        imageBuilder: (context, imageProvider) =>
            _getCircularImageProvider(imageProvider, size, false),
        imageUrl: picUrl,
        placeholder: (context, url) =>
            _getPlaceholderOrErrorImage(size, hasBorder),
        errorWidget: (context, url, error) =>
            _getPlaceholderOrErrorImage(size, hasBorder));

Widget _getPlaceholderOrErrorImage(double size, hasBorder) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(
          color: Colors.white,
          width: hasBorder ? 2.0 : 0.0,
        ),
      ),
      child: ClipOval(
          child: Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.cover,
        height: size,
        width: size,
      )),
    );

Widget _getCircularImageProvider(
    ImageProvider provider, double size, bool hasBorder) {
  return ClipOval(
      child: Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(
          color: Colors.white,
          style: hasBorder ? BorderStyle.solid : BorderStyle.none,
          width: 1.0,
        ),
        image: DecorationImage(
          image: provider,
          fit: BoxFit.cover,
        )),
  ));
}

bool isDarkMode(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return false;
  } else {
    return true;
  }
}

InputDecoration getInputDecoration({
  required String hint,
  required bool darkMode,
  required Color errorColor,
  bool isPasswordField = false,
  Widget? iconButton,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    fillColor: darkMode ? Colors.black54 : Colors.white,
    hintText: hint,
    suffixIcon: isPasswordField ? iconButton : null,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Color(COLOR_PRIMARY), width: 2.0)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(25.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(25.0),
    ),
  );
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}

/// This function tries to get device's locale
/// without using AppLocalization.of(context)
Future<AppLocalizations> getLocalizationDirectly() async {
  String deviceLanguage = Platform.localeName.substring(0, 2);

  try {
    return await AppLocalizations.delegate.load(Locale(deviceLanguage));
  } catch (m) {
    /// Here is the Locale which will be chosen as default
    /// in case if the app does not support [deviceLanguage]
    return await AppLocalizations.delegate.load(const Locale('en'));
  }
}
