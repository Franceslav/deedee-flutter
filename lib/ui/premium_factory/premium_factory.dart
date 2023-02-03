import 'package:deedee/ui/premium_factory/premium_button.dart';
import 'package:deedee/ui/premium_factory/premium_text.dart';
import 'package:flutter/material.dart';

//This class helps to build widgets according to user Premium status using factory constructor

//PremiumSpecificText and PremiumSpecificButton are represented only for understanding
//of the main idea of how you could implement factory constructors

class PremiumFactory {
  static Widget buildPremiumSpecificText(bool isPremium) {
    return PremiumSpecificText(isPremium).build();
  }

  static buildPremiumSpecificButton({
    required bool isPremium,
    required VoidCallback onPressed,
  }) {
    return PremiumSpecificButton(isPremium).build(onPressed);
  }
}
