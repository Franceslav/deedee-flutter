import 'package:flutter/material.dart';

class ContactFacilityWidget extends StatelessWidget {
  const ContactFacilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          //TODO implement data
          onPressed: () {},
          icon: Image.asset(
              'assets/images/telegram_icon_small.png'),
        ),
        IconButton(
          //TODO implement data
          onPressed: () {},
          icon: Image.asset(
              'assets/images/instagram_icon_small.png'),
        ),
        IconButton(
          //TODO implement data
          onPressed: () {},
          icon: Image.asset(
              'assets/images/phone_icon_small.png'),
        ),
      ],
    );
  }
}
