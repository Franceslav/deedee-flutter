// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';

import 'package:deedee/injection.dart';
import 'package:deedee/services/gps.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/home/home_bloc.dart';
import 'package:deedee/ui/home/pick_city_dropdown.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_grid.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../model/user.dart';
import '../../services/helper.dart';
import '../../services/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final PanelController _controller = PanelController();
  var shownDialog = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<UserBloc>().add(UserAvailablePlaces());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    if (!shownDialog) {
      Future.delayed(Duration.zero, () => pickCityDialog(context, user));
      shownDialog = true;
    }

    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(locator.get<PushNotificationService>(),
          locator.get<GPSRepository>(), locator.get<GRCPRepository>(), user),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.homeTitle,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: <Widget>[
            BlocConsumer<HomeBloc, HomePageState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeFailureState) {
                  // _validate = AutovalidateMode.onUserInteraction;
                }
                // final user = context.select((UserBloc bloc) => bloc.state.user);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSnackBar(context,
                            'To change your city, you need to have premium status');
                      },
                      child: AbsorbPointer(
                          absorbing:
                              user.premiumStatus == PremiumStatus.notPremium,
                          child: const PickCityDropDown()),
                    ),
                    const Flexible(
                      child: MainTopicGrid(screenType: ScreenType.filterTags),
                    ),
                  ],
                );
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            )
          ],
        ),
      ),
    );
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  Future<void> pickCityDialog(BuildContext context, User user) async {
    //TODO DEEMOB-94
    String? userPlace = await locator.get<SharedUtils>().getUserPlace();
    if (user.availablePlaces == null &&
        userPlace == null &&
        user.emailVerification == EmailVerificationStatus.unverified &&
        user.docVerification == DocVerificationStatus.unverified &&
        user.premiumStatus == PremiumStatus.notPremium) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: AlertDialog(
            actions: [
              const PickCityDropDown(),
              TextButton(
                  onPressed: () async {
                    //TODO DEEMOB-94
                    String? userPlace =
                        await locator.get<SharedUtils>().getUserPlace();
                    if (userPlace != null) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.safe))
            ],
          ),
        ),
      );
    }
  }
}
