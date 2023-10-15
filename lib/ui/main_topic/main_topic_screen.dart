import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/profile_menu_slider.dart';

class MainTopicScreen extends StatefulWidget {
  const MainTopicScreen({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  State<MainTopicScreen> createState() => _MainTopicScreenState();
}

class _MainTopicScreenState extends State<MainTopicScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.topics,
        controller: _controller,
        child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Flexible(
                //   child: MainTopicGrid(
                //     screenType: widget.screenType,
                //   ),
                // ),
              ],
            ),
          ),
          ProfileMenuSlider(
            context,
            controller: _controller,
            user: context.select((UserBloc bloc) => bloc.state.user),
          ),
        ],
      ),
    );
  }
}
