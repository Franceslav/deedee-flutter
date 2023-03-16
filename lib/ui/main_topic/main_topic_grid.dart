import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/ui/main_topic/main_topic_item.dart';
import 'package:flutter/material.dart';
import 'enum/topic_screens_enum.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'bloc/main_topics_bloc.dart';

class MainTopicGrid extends StatefulWidget {
  final ScreenType screenType;

  const MainTopicGrid({
    super.key,
    required this.screenType,
  });

  @override
  State<MainTopicGrid> createState() => _MainTopicGridState();
}

class _MainTopicGridState extends State<MainTopicGrid> {
  List<TopicDescription> mainTopics = [];
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
    final width = (MediaQuery.of(context).size.width - 48) / 2;
    return BlocConsumer<MainTopicsBloc, MainTopicsState>(
      listener: (context, state) {
        if (state is LoadedMainTopicsState) {
          mainTopics = state.mainTopics;
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
          return Column(
            children: [
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2,
                  ),
                  itemCount: mainTopics.length,
                  itemBuilder: ((context, index) {
                    return MainTopicItem(
                      topic: mainTopics[index],
                      width: width,
                      screenType: widget.screenType,
                    );
                  }),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
