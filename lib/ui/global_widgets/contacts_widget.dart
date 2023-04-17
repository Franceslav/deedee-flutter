import 'package:flutter/material.dart';

import '../../services/social_service.dart';
import 'custom_panel_widget.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    super.key,
    required this.widget,
  });

  final CustomPanelWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          //TODO implement data
          onPressed: () {},
          child: Image.asset('assets/images/telegram_logo.png'),
        ),
        TextButton(
          onPressed: () =>
              SocialService.launchInstagram(widget.selectedMessengerId),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Image.asset('assets/images/instagram_logo.png'),
        ),
        TextButton(
          //TODO implement data
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          child: Image.asset('assets/images/phone_icon.png'),
        ),
        TextButton(
          //TODO implement data
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Image.asset('assets/images/favorite_icon.png'),
        ),
      ],
    );
  }
}

