// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const OutlinedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.fiolet),
            overlayColor: MaterialStateProperty.all(AppColors.lightFiolet),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.transparent))),
        child: Text(
          text,
          style: AppTextTheme.labelLarge.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
