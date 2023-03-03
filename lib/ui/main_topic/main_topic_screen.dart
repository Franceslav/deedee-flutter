import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_custom_toggle.dart';
import 'package:deedee/ui/main_topic/main_topic_grid.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'bloc/main_topics_bloc.dart';
import 'main_topic_toggle.dart';

class MainTopicScreen extends StatefulWidget {
  const MainTopicScreen({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  State<MainTopicScreen> createState() => _MainTopicScreenState();
}

class _MainTopicScreenState extends State<MainTopicScreen> {
  List<TopicDescription> _mainTopics = [];
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    _fetchMainTopics();
  }

  void _fetchMainTopics() async {
    final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
    final position = await Geolocator.getCurrentPosition();
    final userLocation = LatLng(position.latitude, position.longitude);
    BlocProvider.of<MainTopicsBloc>(context).add(LoadMainTopicsEvent(
      userId: userId,
      userLocation: userLocation,
    ));
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MainTopicsBloc, MainTopicsState>(
          listener: (context, state) {
            if (state is LoadedMainTopicsState) {
              _mainTopics = state.mainTopics;
            }
          },
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const CustomToggleButton(
                      padding: padding,
                    ),
                    const SizedBox(height: 30),
                    Flexible(
                      child: MainTopicGrid(
                        mainTopics: _mainTopics,
                        screenType: widget.screenType,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
