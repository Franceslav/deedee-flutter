import 'package:flutter/material.dart';

abstract class PremiumSpecificButton {
  factory PremiumSpecificButton(bool isPremium) {
    if (isPremium) {
      return PremiumButton();
    } else {
      return NonPremiumButton();
    }
  }

  Widget build(VoidCallback onPressed);
}

class PremiumButton implements PremiumSpecificButton {
  @override
  Widget build(VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Premium Button'),
    );
  }
}

class NonPremiumButton implements PremiumSpecificButton {
  @override
  Widget build(VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Non Premium Button'),
    );
  }
}
