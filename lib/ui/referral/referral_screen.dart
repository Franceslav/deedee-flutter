import 'package:deedee/constants.dart';
import 'package:deedee/generated/ReferralService.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/grpc.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State createState() => _ReferralState();
}

class _ReferralState extends State<ReferralScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return pushReplacement(context, const HomeScreen());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                pushReplacement(context, const HomeScreen());
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
              child: Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        "Total referrals: 0",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        "Credits: 0",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: double.infinity, maxHeight: double.infinity),
                color: Colors.white,
                child: FutureBuilder(
                    future: getUserReferrals(),
                    builder:
                        (context, AsyncSnapshot<List<UserReferral>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.circular(20.0), //<-- SEE HERE
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
                                        snapshot.data![index].email,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        '${snapshot.data![index].placedTagsAmount}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation(Color(COLOR_PRIMARY)));
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<UserReferral>> getUserReferrals() async {
    return locator
        .get<GRCPUtils>()
        .getUserReferrals(BlocProvider.of<UserBloc>(context).state.user.email)
        .then((referrals) {
      return referrals;
    });
  }
}
