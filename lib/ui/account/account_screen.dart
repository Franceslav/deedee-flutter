// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deedee/ui/account/account_info_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  final Uuid uuid = const Uuid();
  late String cityChoose;
  late List<String> places;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.profile,
          style: AppTextTheme.titleLarge,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              //TODO
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const DeeDeeToggleButton(),
            const SizedBox(height: 34),
            const AccountInfoWidget(),
            const SizedBox(height: 32),
            Row(
              children: [
                _OutlinedButtonWidget(
                  text: locale.edit,
                ),
                const SizedBox(width: 16),
                _OutlinedButtonWidget(
                  text: locale.share,
                ),
              ],
            ),
            const SizedBox(height: 48),
            const _InfoWidget(),
            const SizedBox(height: 42),
            _TextButtonWidget(
              text: locale.switchAccount,
              style: AppTextTheme.bodyLarge.copyWith(color: AppColors.blue),
            ),
            const SizedBox(height: 8),
            _TextButtonWidget(
              text: locale.logout,
              style: AppTextTheme.bodyLarge.copyWith(
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutlinedButtonWidget extends StatelessWidget {
  final String text;
  const _OutlinedButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.lightgrey),
            overlayColor: MaterialStateProperty.all(AppColors.tapButton),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.transparent))),
        child: Text(
          text,
          style: AppTextTheme.labelLarge,
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          DeeDeeRowInfoWidget(
            icon: Image.asset('assets/images/verify_0_icon.png'),
            mainText: Text(
              locale.verification,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: Text(
              locale.verifyYourAccount,
              style: AppTextTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          const DeeDeeDeviderWidget(),
          DeeDeeRowInfoWidget(
            icon: Image.asset('assets/images/balance_icon.png'),
            mainText: Text(
              locale.balanceTitle,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: const Text(
              '\$0.00',
              style: AppTextTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          const DeeDeeDeviderWidget(),
          DeeDeeRowInfoWidget(
            mainText: Text(
              locale.premium,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: Text(
              locale.activated,
              style: AppTextTheme.bodyMedium,
            ),
            onTap: () {},
            icon: Image.asset('assets/images/premium_0_icon.png'),
          ),
        ],
      ),
    );
  }
}

class _TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  const _TextButtonWidget({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: style,
        ));
  }
}
