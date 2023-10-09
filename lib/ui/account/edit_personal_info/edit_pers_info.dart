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
  late TextEditingController _EmailAddressController;
  late TextEditingController _PhoneNumberController;
  late TextEditingController _BirthdayController;

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _lastnamecontroller = TextEditingController();
    _UsernameController = TextEditingController();
    _WebsiteController = TextEditingController();
    _BioController = TextEditingController();
    _EmailAddressController = TextEditingController();
    _PhoneNumberController = TextEditingController();
    _BirthdayController = TextEditingController();
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
                        TextEditingField(
                            labelText: locale.email, controller: _EmailAddressController,
                            hintText: locale.editProfileEmailAddressHint,
                            validator: validateEmail),
                        TextEditingField(
                            labelText: locale.phoneNumber, controller: _PhoneNumberController,
                            hintText: locale.editProfilePhoneNumberHint,
                            validator: validateMobile),
                        TextEditingField(
                            labelText: locale.birthday, controller: _BirthdayController,
                            hintText: locale.editProfileBirthdayHint,
                            validator: validateBirthday),
                      ],
                    ),
                    const SizedBox(height: 10),
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

  String? validateMobile(String? value, BuildContext context) {
    String pattern = r'(^\+?[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.trim().isEmpty ?? true) {
      return AppLocalizations.of(context)!.mobilePhoneNumber;
    } else if (!regExp.hasMatch(value?.trim() ?? '')) {
      return AppLocalizations.of(context)!.numberContainOnlyDigits;
    }
    return null;
  }

  String? validateBirthday(String? value, BuildContext context) {
    String pattern = r'(^\d{4}\.\d{2}\.\d{2}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value?.trim() ?? '')) {
      return AppLocalizations.of(context)!.numberContainOnlyDigits;
    }
    return null;
  }

  String? validateEmail(String? value, BuildContext context) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return AppLocalizations.of(context)!.validEmail;
    } else {
      return null;
    }
  }
}


class TextEditingField extends StatefulWidget {
  final String labelText;
  late TextEditingController controller;
  final String hintText;
  String? Function(String?, BuildContext)? validator;

  TextEditingField(
  {super.key, required this.labelText, required this.controller, required this.hintText, this.validator});

  @override
  State<TextEditingField> createState() => _TextEditingFieldState();
}

class _TextEditingFieldState extends State<TextEditingField> {
  String? Function(String?)? makeValidatorWithContext(String? Function(String?, BuildContext)? validationFunction) {

    if (validationFunction == null) {
      return null;
    }

    String? validator(String? str) {
      return validationFunction(str, context);
    }

  return validator;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
          style: AppTextTheme.bodyLarge,
          cursorColor: Colors.grey,
          validator: makeValidatorWithContext(widget.validator),
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              labelText: widget.labelText,
              labelStyle: AppTextTheme.labelLarge)),

    );
  }
}
