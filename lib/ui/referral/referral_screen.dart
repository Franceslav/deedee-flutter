import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReferralScreen extends StatefulWidget {
  final User user;

  const ReferralScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _ReferralState();
}

class _ReferralState extends State<ReferralScreen> {
  late User user;
  final ScrollController _scrollController = ScrollController();
  final List<String> listEmail = [
    "alex_mia@rambler.ru",
    "coco_relax@google.com",
    "vasytop_2020@yandex.ru",
    "romajava@yahoo.com",
    "boryseo@rambler.ru",
    "maratiosapp@google.com",
    "flutter12345@google.com",
    "tolygnom2000@google.com",
    "vipmag777win@go0gle.com",
    "rexvasy1420@rambler.ru",
    "bidboss787@google.com",
    "mashaviptop@google.cpm",
  ];

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return pushReplacement(context, HomeScreen(user: widget.user!));
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                pushReplacement(context, HomeScreen(user: widget.user));
              }),
          title: Text(
            AppLocalizations.of(context)!.accountReferralTitle,
            style: const TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Total referrals: ${listEmail.length}", style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Credits: ${listEmail.length}", style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: double.infinity, maxHeight: double.infinity),
                color: Colors.white,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: listEmail.length, // количество email для отрисовки
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      elevation: 12,
                      color: Colors.indigo,
                      shadowColor: Colors.blueAccent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "${listEmail[index]}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
