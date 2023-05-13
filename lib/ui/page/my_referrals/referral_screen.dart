import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'referral_cubit.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State createState() => _ReferralState();
}

class _ReferralState extends State<ReferralScreen> {
  final PanelController _controller = PanelController();

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
          BlocBuilder<ReferralCubit, ReferralState>(builder: (context, state) {
            if (state is ReferralStateLoading) {
              return const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Color(COLOR_PRIMARY)));
            }
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Total referrals: ${state.refs.length}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            "Credits: 0",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    constraints: const BoxConstraints(
                        maxWidth: double.infinity, maxHeight: double.infinity),
                    color: Colors.white,
                    child: ListView.separated(
                      itemCount: state.refs.length,
                      itemBuilder: (context, i) {
                        return Slidable(
                          endActionPane: ActionPane(
                              extentRatio: 0.2,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((context) {
                                    context
                                        .read<ReferralCubit>()
                                        .removeReferral(
                                            state.refs[i].referralId);
                                  }),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                  icon: Icons.delete,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                title: Text(state.refs[i].email +
                                    (kDebugMode
                                        ? ' ${state.refs[i].referralId}'
                                        : '')),
                                trailing: const Icon(Icons.chevron_right)),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const DeeDeeDeviderWidget();
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
          DeeDeeMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }
}
