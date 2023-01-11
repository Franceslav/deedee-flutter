import 'package:deedee/model/user.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/help/help_bloc.dart';
import 'package:deedee/ui/help/help_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpScreen extends StatefulWidget {
  final User user;


  HelpScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _HelpState();
}

class _HelpState extends State<HelpScreen> {
  late User user;
  TextEditingController messageEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HelpBloc>(
      create: (context) => HelpBloc(),
      child: Scaffold(
          drawer: DeeDeeDrawer(user: user),
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.helpTitle,
              style: const TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: Stack(children: [
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Column(
                children: [
                  BlocBuilder<HelpBloc, GetMessageState>(
                      builder: (context, state) {
                        final message = context.select((
                            HelpBloc bloc) => bloc.state.messages);
                        return
                        Expanded(
                          child: ListView.builder(
                            itemCount: message.length,
                            itemBuilder: (context, index) {
                              return Card(
                                semanticContainer: false,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
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
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${user.firstName}  '
                                            '${DateTime.now()}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                    }
                  ),
                  Row(
                    children: [
                      BlocBuilder<HelpBloc, GetMessageState>(
                        bloc: HelpBloc(),
                        builder: (context, state) {
                          return Expanded(
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                context.read<HelpBloc>().add(
                                    GetMessagesEvent(value));
                              },
                              controller: messageEditingController,
                              style: TextStyle(
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
                                    borderSide:
                                    BorderSide(color: Colors.blue, width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.cyan,
                                      width: 3,
                                    )),
                                border: InputBorder.none,
                              ),
                            ),

                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(Icons.attach_file),
                        color: Colors.black,
                        onPressed: () {
                          print('');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
