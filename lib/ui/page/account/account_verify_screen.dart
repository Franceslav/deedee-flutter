import 'dart:io';

import 'package:deedee/model/user.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../generated/deedee/api/model/verification.pb.dart';

class VerifyScreen extends StatefulWidget {
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  File? image;
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.accountVerify,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 100,
                      ),
                      user.emailVerification == EmailVerificationStatus.verified
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : const SizedBox(height: 0),
                      Text(AppLocalizations.of(context)!.verifyEmail,
                          style: Theme.of(context).textTheme.displayLarge),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<UserBloc>()
                              .add(UserCreateVerification(Verification()));
                        },
                        child:
                            Text(AppLocalizations.of(context)!.accountVerify),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      user.docVerification == DocVerificationStatus.verified
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : const SizedBox(height: 0),
                      Text(AppLocalizations.of(context)!.verifyIdentity,
                          style: Theme.of(context).textTheme.displayLarge),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: const Text('Choose Photo'),
                                  children: [
                                    SimpleDialogOption(
                                      onPressed: () {
                                        context.read<UserBloc>().add(
                                            UserImagePicker(
                                                ImageSource.gallery));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('From gallery'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        context.read<UserBloc>().add(
                                            UserImagePicker(
                                                ImageSource.camera));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('From camera'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close'),
                                    )
                                  ],
                                );
                              });
                          //TODO: [DEEMOB-76]
                          context.read<UserBloc>().add(UserDocVerification());
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.accountVerify,
                            ),
                            const Icon(Icons.attach_file)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ProfileMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageVerify = File(image.path);
      setState(() => this.image = imageVerify);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
