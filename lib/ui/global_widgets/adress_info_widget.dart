import 'package:flutter/material.dart';

import '../theme/app_text_theme.dart';
import 'calendar_dialog.dart';
import 'outlined_button_widget.dart';

class AddressInfoWidget extends StatelessWidget {
  const AddressInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //TODO implement data
        children: [
          const Text(
            'Адрес',
            style: AppTextTheme.bodyMedium,
          ),
          const SizedBox(height: 2),
          const Text(
            'ул.Калиновского д.235/4',
            style: AppTextTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          OutlinedButtonWidget(
            onPressed: () => showDialog(
                context: context, builder: (ctx) => const CalendarDialog()),
            text: 'Fake Button Сalendar',
          ),
        ],
      ),
    );
  }
}
