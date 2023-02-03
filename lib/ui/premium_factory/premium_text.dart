import 'package:flutter/material.dart';

abstract class PremiumSpecificText {
  factory PremiumSpecificText(bool isPremium) {
    if (isPremium) {
      return PremiumText();
    } else {
      return NonPremiumText();
    }
  }

  Widget build();
}

class PremiumText implements PremiumSpecificText {
  @override
  Widget build() {
    return const Text('You are awesome!');
  }
}

class NonPremiumText implements PremiumSpecificText {
  @override
  Widget build() {
    return const Text('You are just an ordinary user...');
  }
}
