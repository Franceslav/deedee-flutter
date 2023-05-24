import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/generated/deedee/api/model/uuid.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/gps_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/repository/profile_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/http_service.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_grid.dart';
import 'package:deedee/ui/page/home/city_picker_dialog.dart';
import 'package:deedee/ui/page/home/home_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<Topic> _mainTopics = [];
  Location? _selectedCity;
  final PanelController _controller = PanelController();
  bool _isInit = true;
  bool _hideAppBarButton = true;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (_) => HomeBloc(
        locator.get<PushNotificationService>(),
        locator.get<GPSRepository>(),
        locator.get<TopicRepository>(),
        locator.get<ProfileRepository>(),
        httpService: locator.get<HttpService>(),
      )..add(HomeScreenInitLoadEvent()),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.homeTitle,
          controller: _controller,
          child: _hideAppBarButton ? null : const Icon(Icons.menu),
        ),
        body: Stack(
          children: [
            BlocConsumer<HomeBloc, HomeScreenState>(
              listener: (ctx, state) {
                if (state is HomePageRequestReceivedState) {
                  context.router.push(
                    RequestScreenRoute(
                      serviceRequestId: UUID(value: state.id!),
                      readOnly: false,
                    ),
                  );
                }
                if (state is HomeScreenLoadedState) {
                  setState(() {
                    _hideAppBarButton = false;
                  });
                  if (state.selectedCity != null) {
                    _selectedCity = state.selectedCity;
                  }
                  _mainTopics = state.topics;
                  _selectedCity = state.selectedCity;
                }
                if (state is HomeScreenFailureState) {
                  showSnackBar(context, state.errorMessage);
                }
                if (state is HomeScreenLoadingState) {
                  if (_isInit) {
                    BlocProvider.of<UserBloc>(context)
                        .add(UserGetGPSPosition());
                    BlocProvider.of<UserBloc>(context)
                        .add(UserAvailablePlaces());
                    _isInit = false;
                  }
                }
              },
              builder: (context, state) {
                if (state is HomeScreenLoadedState) {
                  return BlocListener<UserBloc, UserState>(
                    listener: (context, state) {
                      if (user.accountType != state.user.accountType) {
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeScreenChangeEvent(
                                user: state.user, city: _selectedCity));
                      }
                    },
                    child: Column(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: MainTopicGrid(
                              screenType: ScreenType.filterTags,
                              mainTopics: _mainTopics,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is HomeScreenFirstLaunchState) {
                  return CityPickerDialog(
                    availableCities: user.availablePlaces,
                    user: user,
                    onSave: (user, city) {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeScreenChangeEvent(user: user, city: city));
                      setState(() {
                        _hideAppBarButton = false;
                      });
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
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
      ),
    );
  }
}
