import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/profile.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../injection.dart';
import '../../../repository/profile_repository.dart';
import '../../global_widgets/profile_photo_with_badge.dart';
import '../../routes/app_router.gr.dart';
import '../../theme/app_text_theme.dart';
import 'bloc/edit_pers_info_bloc.dart';

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

  @override
  void initState() {
    _namecontroller = TextEditingController(text: 'my name ');
    _UsernameController = TextEditingController(text: 'username');
    _WebsiteController = TextEditingController(text: 'web.com');
    _BioController = TextEditingController(text: 'my bio is empty');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (_) => EditPersInfoBloc(
              locator.get<ProfileRepository>(),
            )..add(EditPersInfoScreenInitLoadEvent(
                  profile: Profile(
                profileId: Int64(0),
              ))),
        child: BlocConsumer<EditPersInfoBloc, EditPersInfoScreenState>(
          listener: (ctx, state) {
            if (state is EditPersInfoScreenLoadingState) {
              _UsernameController.text = state.profile.username;
            }
            if (state is EditPersInfpScreenDataChangedState) {
              _UsernameController.text = state.profile.username;
            }
          },
          builder: (context, state) {
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
                      context.read<EditPersInfoBloc>().add(SaveEditDataEvent(
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
                            controller: _namecontroller),
                        TextEditingField(
                            labelText: locale.username,
                            controller: _UsernameController),
                        TextEditingField(
                            labelText: locale.website,
                            controller: _WebsiteController),
                        TextEditingField(
                            labelText: locale.bio,
                            controller: _BioController),
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
                        style: AppTextTheme.bodyLarge
                            .copyWith(color: Colors.blue),
                      ),
                    ),
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
