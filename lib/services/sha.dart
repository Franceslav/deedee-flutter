import 'dart:convert';

import 'package:crypto/crypto.dart';

class SHAUtils {

  static generateShaHash(String phrase) async {
    return sha256.convert(utf8.encode(phrase)).toString();
  }

}