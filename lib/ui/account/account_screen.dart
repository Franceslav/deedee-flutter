import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/account/account_cubit.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class AccountScreen extends StatefulWidget {
  final User user;

  const AccountScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  late User user;
  final uuid = Uuid();

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
        drawer: DeeDeeDrawer(user: user),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.accountTitle,
            style: const TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              user.profilePictureURL == ''
                  ? CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.shade400,
                      child: ClipOval(
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/images/placeholder.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : displayCircleImage(user.profilePictureURL, 80, false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.fullName()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('0.00'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      splashColor: Colors.indigo,
                      splashRadius: 20,
                      onPressed: () async {
                        var uuidValue = uuid.v5(
                            Uuid.NAMESPACE_URL,
                            "${HTTPS_REF_DOMAIN}${widget.user.email}");
                        var ValueURL = "${HTTPS_REF_DOMAIN}${uuidValue}";
                        await Clipboard.setData(ClipboardData(text: "$ValueURL"));
                        context.read<LocaleCubit>().showToast(context);
                      },
                      icon: const Icon(
                        Icons.link_sharp,
                      )),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(COLOR_PRIMARY),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.accountTopUp,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          context.read<LocaleCubit>().changeLocal('en');
                        },
                        icon: Image.asset('assets/images/en.png')),
                    IconButton(
                        onPressed: () {
                          context.read<LocaleCubit>().changeLocal('ru');
                        },
                        icon: Image.asset('assets/images/ru.png'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
