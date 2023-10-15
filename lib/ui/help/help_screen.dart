import 'dart:io';

import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/help/help_bloc.dart';
import 'package:deedee/ui/help/help_state.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/deedee_appbar.dart';
import '../global_widgets/profile_menu_slider.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State createState() => _HelpState();
}

class _HelpState extends State<HelpScreen> {
  final PanelController _panelController = PanelController();
  TextEditingController messageEditingController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return BlocProvider<HelpBloc>(
      create: (context) => HelpBloc(),
      child: Scaffold(
        appBar: DeeDeeAppBar(
          controller: _panelController,
          title: AppLocalizations.of(context)!.helpTitle,
          child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.indigo,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Column(
                children: [
                  BlocBuilder<HelpBloc, GetMessageState>(
                      builder: (context, state) {
                    final message =
                        context.select((HelpBloc bloc) => bloc.state.messages);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: message.length,
                        itemBuilder: (context, index) {
                          return Card(
                            semanticContainer: false,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 12,
                            color: Colors.white,
                            shadowColor: Colors.black,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    message[index],
                                    maxLines: 10,
                                    softWrap: true,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${user.firstName}  '
                                    '${DateTime.now()}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      image != null
                          ? Image.file(
                              image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const FlutterLogo(size: 0),
                    ],
                  ),
                  Row(
                    children: [
                      BlocBuilder<HelpBloc, GetMessageState>(
                        bloc: HelpBloc(),
                        builder: (context, state) {
                          return Expanded(
                            child: TextFormField(
                              controller: _textController,
                              onFieldSubmitted: (value) {
                                context
                                    .read<HelpBloc>()
                                    .add(MessageReceivedEvent(value));
                                _textController.clear();
                              },
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 5),
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                      color: Colors.cyan,
                                      width: 3,
                                    )),
                                border: InputBorder.none,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(Icons.attach_file),
                        color: Colors.black,
                        onPressed: () =>
                            pickImage(), // TODO: Make a state management Block for adding a photo and implement a button to send a photo.
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProfileMenuSlider(
              context,
              controller: _panelController,
              user: user,
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    // TODO: implement type not dynamic
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
