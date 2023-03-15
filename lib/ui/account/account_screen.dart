// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deedee/ui/map_cubit/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  final PanelController _controller = PanelController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountInfoWidget(),
          // if account is verified SizedBox(height: 111),
          const SizedBox(height: 83),
          const _InfoWidget(),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Переключить аккаунт',
                  style: AppTextTheme.bodyLarge.copyWith(color: AppColors.blue),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {},
              child: Text(
                locale.logout,
                style: AppTextTheme.bodyLarge.copyWith(color: AppColors.red),
              ),
            ),
          ),
        ],
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          InfoWidgetRow(
            mainText: Text(
              locale.verification,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: Text(
              locale.verifyYourAccount,
              style: AppTextTheme.labelMedium,
            ),
            onTap: () {},
          ),
          InfoWidgetRow(
            mainText: Text(
              locale.balanceTitle,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: const Text(
              '00,00',
              style: AppTextTheme.labelMedium,
            ),
            onTap: () {},
          ),
          InfoWidgetRow(
            mainText: Text(
              locale.premium,
              style: AppTextTheme.bodyLarge,
            ),
            secondaryText: Text(
              locale.activated,
              style: AppTextTheme.labelMedium,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class InfoWidgetRow extends StatelessWidget {
  final Text mainText;
  final Text secondaryText;
  final void Function()? onTap;
  const InfoWidgetRow({
    Key? key,
    required this.mainText,
    required this.secondaryText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: const Color(0xFFF8F4FE),
            borderRadius: BorderRadius.circular(30),
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/account_item_icon.png'),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mainText,
                      secondaryText,
                    ],
                  ),
                ),
                Image.asset('assets/images/chevron_right_icon.png'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.lightgrey,
          ),
        ),
      ],
    );
  }
}
