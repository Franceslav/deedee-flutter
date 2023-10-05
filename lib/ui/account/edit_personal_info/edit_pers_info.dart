import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../injection.dart';
import '../../../model/user.dart';
import '../../../repository/profile_repository.dart';
import '../../global_widgets/profile_photo_with_badge.dart';
import '../../routes/app_router.gr.dart';
import '../../theme/app_text_theme.dart';
import 'bloc/edit_pers_info_bloc.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _namecontroller;
  late TextEditingController _lastnamecontroller;
  late TextEditingController _UsernameController;
  late TextEditingController _WebsiteController;
  late TextEditingController _BioController;

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _lastnamecontroller = TextEditingController();
    _UsernameController = TextEditingController();
    _WebsiteController = TextEditingController();
    _BioController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.select((UserBloc bloc) => bloc.state.user);
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (_) => EditPersInfoBloc(
              user,
              locator.get<ProfileRepository>(),
            ),
        child: BlocConsumer<EditPersInfoBloc, EditPersInfoScreenState>(
          listener: (ctx, state) {
            if (state is EditPersInfoScreenLoadedState) {
              _UsernameController.text = state.profile.username;
            }
            if (state is EditPersInfpScreenDataChangedState) {
              _UsernameController.text = state.profile.username;
            }
          },
          builder: (context, state) {
            var bloc = context.read<EditPersInfoBloc>();
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
                      bloc.add(SaveEditDataEvent(
                        user: user,
                        username: _UsernameController.text,
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ProfilePhotoWithBadge(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          locale.editPictureOrAvatar,
                          style: AppTextTheme.bodyLarge,
                        ),
                        TextEditingField(
                            labelText: locale.name,
                            controller: _namecontroller,
                            hintText: locale.editProfileNameHint),
                        TextEditingField(
                            labelText: locale.lastname,
                            controller: _lastnamecontroller,
                            hintText: locale.editProfileLastnameHint),
                        TextEditingField(
                            labelText: locale.username,
                            controller: _UsernameController,
                            hintText: locale.editProfileUsernameHint),
                        TextEditingField(
                            labelText: locale.website,
                            controller: _WebsiteController,
                            hintText: locale.editProfileWebsiteHint),
                        TextEditingField(
                            labelText: locale.bio, controller: _BioController,
                            hintText: locale.editProfileBioHint),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    DeeDeeRowInfoWidget(
                      icon: Image.asset('assets/images/instagram_logo.png'),
                      mainText: Text(
                        locale.contacts,
                        style: AppTextTheme.bodyLarge,
                      ),
                      secondaryText: const Text(
                        '',
                        style: AppTextTheme.bodyMedium,
                      ),
                      onTap: () {
                        context.router.push(const CommunicationFacilityComponentScreenRoute());
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class TextEditingField extends StatelessWidget {
  TextEditingField(
      {Key? key, required this.labelText, required this.controller, required this.hintText})
      : super(key: key);
  final String labelText;
  late TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          style: AppTextTheme.bodyLarge,
          cursorColor: Colors.grey,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              labelText: labelText,
              labelStyle: AppTextTheme.labelLarge)),

    );
  }
}
