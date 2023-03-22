// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/account/account_info_widget.dart';
import 'package:deedee/ui/account/account_language_screen.dart';
import 'package:deedee/ui/account/account_popover.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_toggle_button.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/global_widgets/profile_menu_slider.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.profile,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    OutlinedButtonWidget(
                      text: locale.edit,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    OutlinedButtonWidget(
                      text: locale.share,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const _InfoWidget(),
                const SizedBox(height: 20),
                _TextButtonWidget(
                  text: locale.switchLanguage,
                  textColor: AppColors.blue,
                  onPressed: () {
                    context.router.push(const AccountLanguageScreenRoute());
                  },
                ),
                const SizedBox(height: 0),
                _TextButtonWidget(
                  text: locale.switchAccount,
                  textColor: AppColors.blue,
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                _TextButtonWidget(
                  text: locale.logout,
                  textColor: AppColors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          ProfileMenuSlider(
            context,
            controller: _controller,
            user: user,
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
            onTap: () {
              context.router.push(const VerifyScreenRoute());
            },
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
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return const AccountPopover();
                },
              );
            },
            icon: Image.asset('assets/images/premium_0_icon.png'),
          ),
        ],
      ),
    );
  }
}

class _TextButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;

  final void Function()? onPressed;

  const _TextButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextTheme.bodyLarge.copyWith(
            color: textColor,
          ),
        ));
  }
}
