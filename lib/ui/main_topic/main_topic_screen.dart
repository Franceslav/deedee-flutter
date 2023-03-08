import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';

import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_custom_toggle.dart';
import 'package:deedee/ui/main_topic/main_topic_grid.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bloc/main_topics_bloc.dart';
import 'main_topic_toggle.dart';

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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: MainTopicGrid(
                screenType: widget.screenType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
