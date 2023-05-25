import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../injection.dart';
import '../../../repository/gps_repository.dart';
import '../../../repository/topic_repository.dart';
import '../../../repository/profile_repository.dart';
import '../../../services/helper.dart';
import '../../../services/push_notification_service.dart';
import '../../global_widgets/profile_photo_with_badge.dart';
import '../../page/home/city_picker.dart';
import '../../page/home/home_bloc.dart';
import '../../routes/app_router.gr.dart';
import '../../theme/app_text_theme.dart';
import '../../user_bloc/user_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _namecontroller;
  late TextEditingController _UsernameController;
  late TextEditingController _WebsiteController;
  late TextEditingController _BioController;

  List<Topic> _mainTopics = [];
  Location? _selectedCity;
  final PanelController _controller = PanelController();
  bool _isInit = true;

  @override
  void initState() {
    _namecontroller = TextEditingController(text: 'my name ');
    _UsernameController = TextEditingController(text: 'username');
    _WebsiteController = TextEditingController(text: 'web.com');
    _BioController = TextEditingController(text: 'my bio is empty');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return BlocProvider(
        create: (_) => HomeBloc(
              locator.get<PushNotificationService>(),
              locator.get<GPSRepository>(),
              locator.get<TopicRepository>(),
              locator.get<ProfileRepository>(),
            )..add(HomeScreenInitLoadEvent()),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(locale.editProfile),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.done,
                  ),
                  onPressed: () {
                    context.read<HomeBloc>().add(SaveEditDataEvent(
                          profile: Profile(
                          profileId: Int64(0),
                          username: _UsernameController.text,
                        )));
                  },
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfilePhotoWithBadge(),

                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          locale.editPictureOrAvatar,
                          style: AppTextTheme.bodyLarge,
                        ),
                        TextEditingField(
                            labelText: locale.name,
                            controller: _namecontroller),
                        TextEditingField(
                            labelText: locale.username,
                            controller: _UsernameController),
                        TextEditingField(
                            labelText: locale.website,
                            controller: _WebsiteController),
                        TextEditingField(
                            labelText: locale.bio, controller: _BioController),
                        BlocConsumer<HomeBloc, HomeScreenState>(
                          listener: (ctx, state) {
                            if (state is HomeScreenLoadedState) {
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
                                  if (user.accountType !=
                                      state.user.accountType) {
                                    BlocProvider.of<HomeBloc>(context).add(
                                        HomeScreenChangeEvent(
                                            user: state.user,
                                            city: _selectedCity));
                                  }
                                },
                                child: Column(
                                  children: [
                                    CityPicker(
                                      selectedCity: _selectedCity,
                                      availableCities: user.availablePlaces,
                                      user: user,
                                      onChangeCity: (user, city) =>
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(HomeScreenChangeEvent(
                                                  user: user, city: city)),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),

                        // ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        context.router.push(PersonalInfoPageRoute());
                      },
                      child: Text(
                        locale.personalInfoSettings,
                        textAlign: TextAlign.start,
                        style:
                            AppTextTheme.bodyLarge.copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

class TextEditingField extends StatelessWidget {
  TextEditingField(
      {Key? key, required this.labelText, required this.controller})
      : super(key: key);
  final String labelText;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          style: AppTextTheme.bodyLarge,
          cursorColor: Colors.grey,
          controller: controller,
          decoration: InputDecoration(
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              labelText: labelText,
              labelStyle: AppTextTheme.labelLarge)),
    );
  }
}
