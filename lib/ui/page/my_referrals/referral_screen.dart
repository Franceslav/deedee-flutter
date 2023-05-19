import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/my_referrals/referral_list.dart';
import 'package:deedee/ui/page/my_referrals/referral_tile.dart';
import 'package:deedee/ui/search_field/search_field.dart';
import 'package:deedee/ui/search_field/search_spec.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'referral_cubit.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State createState() => _ReferralState();
}

class _ReferralState extends State<ReferralScreen> {
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();
  final PageController _pageController = PageController();
  late List<Referral> _refs;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.homeTitle,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      floatingActionButton: kDebugMode
          ? FloatingActionButton(
              onPressed: () => context.read<ReferralCubit>().addReferral(
                    Referral(
                      referredBy: user.email,
                      email: "test_referral@mail.ru",
                    ),
                  ),
              child: const Icon(Icons.add),
            )
          : null,
      body: Stack(
        children: [
          BlocBuilder<ReferralCubit, ReferralState>(
            builder: (context, state) {
              if (state is ReferralStateLoading) {
                return const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Color(COLOR_PRIMARY)));
              }
              _refs = state.refs;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: AnimatedButtonBar(
                      invertedSelection: true,
                      radius: 25,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      controller: _buttonController,
                      children: [
                        ButtonBarEntry(
                          child: Text(AppLocalizations.of(context)!.actualTags),
                          onTap: () => setPage(0),
                        ),
                        ButtonBarEntry(
                          child:
                              Text(AppLocalizations.of(context)!.archiveTags),
                          onTap: () => setPage(1),
                        ),
                      ],
                    ),
                  ),
                  SearchField(
                    SearchSpec(
                        searchValueBuilder: (i) => _refs[i].email,
                        length: _refs.length,
                        itemBuilder: (context, i) {
                          return ReferralTile(referral: _refs[i]);
                        }),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                    height: 0,
                  ),
                  Expanded(
                    flex: 7,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) =>
                          _buttonController.setIndex(value),
                      children: [
                        ReferralListWidget(
                            referrals: _refs,
                            refType: Referral_Status.VERIFIED),
                        ReferralListWidget(
                          referrals: _refs,
                          refType: Referral_Status.DELETED,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          DeeDeeMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
