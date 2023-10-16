import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardedDateIndicatorWidget extends StatelessWidget {
  final String date;
  const OnBoardedDateIndicatorWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
          AppLocalizations.of(context)!.onServiceSince,
          style: AppTextTheme.titleNormal
              .copyWith(color: const Color(0xFF8C8C9A)),
        ),
          Text(
            date,
            style: AppTextTheme.titleNormal
                .copyWith(color: const Color(0xFF8C8C9A)),
          )],
      ),
    );
  }
}
