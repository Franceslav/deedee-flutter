import 'dart:io';

import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class VerifyScreen extends StatefulWidget {
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.accountVerify,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.indigo,
        child: ListView(
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
                        context.read<UserBloc>().add(UserEmailVerification());
                      },
                      child: Text(AppLocalizations.of(context)!.accountVerify),
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
                        //TODO: [DEEMOB-76]
                        context.read<UserBloc>().add(UserDocVerification());
                      },
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.accountVerify,
                            ),
                            const Icon(Icons.attach_file)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
