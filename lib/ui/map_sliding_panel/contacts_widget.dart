import 'package:deedee/ui/global_widgets/add_to_favourites_clickable_icon.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

import '../../services/social_service.dart';

class ContactsWidget extends StatelessWidget {
  final String selectedMessengerId;
  final Int64 tagId;

  const ContactsWidget({
    super.key,
    required this.selectedMessengerId,
    required this.tagId,
  });

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
          onPressed: () => SocialService.launchInstagram(selectedMessengerId),
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
        AddToFavouritesClickableIcon(tagId: tagId,)
      ],
    );
  }
}
