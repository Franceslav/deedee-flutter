import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/services/helper.dart';

class AccountBusinessPage extends StatelessWidget {
  const AccountBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const AccountInfoBusinessPage(),
    );
  }
}

class AccountInfoBusinessPage extends StatelessWidget {
  const AccountInfoBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [AccountInfoTitle()],
      ),
    );
  }
}

class AccountInfoTitle extends StatelessWidget {
  const AccountInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.deeDeeForBusiness,
            style: AppTextTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            locale.placeText,
            style: AppTextTheme.labelLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey,
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}
