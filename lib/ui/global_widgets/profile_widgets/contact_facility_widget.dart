import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactFacilityWidget extends StatelessWidget {
  const ContactFacilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            //TODO implement data
            onPressed: () {},
            icon: SvgPicture.asset(
                'assets/images/svg_images/telegram_logo.svg'),
          ),
          SizedBox(width: 12,),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            //TODO implement data
            onPressed: () {},
            icon: SvgPicture.asset(
                'assets/images/svg_images/instagram_logo.svg'),
          ),
          SizedBox(width: 12,),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            //TODO implement data
            onPressed: () {},
            icon: SvgPicture.asset(
                'assets/images/svg_images/phone_logo.svg'),
          ),
        ],
      ),
    );
  }
}
