import 'package:deedee/constants.dart';
import 'package:deedee/generated/ReferralService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/services/locator.dart';
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
  late List<UserReferral> _userReferrals = [];

  final ScrollController _scrollController = ScrollController();


  @override
  Future<void> initState() async {
    super.initState();
    _userReferrals = await serviceLocator.get<GRCPUtils>()
        .getUserReferrals(widget.user.email);

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
                    child: Text("Total referrals: ${_userReferrals.length}", style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Credits: ${_userReferrals.length}", style: TextStyle(fontSize: 20),),
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
                  itemCount: _userReferrals.length, // количество email для отрисовки
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
                                "${_userReferrals[index]}",
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
