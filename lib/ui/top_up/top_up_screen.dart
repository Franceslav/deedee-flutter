import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/home/home_screen.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/top_up/top_up_bloc.dart';
import 'package:deedee/ui/top_up/top_up_event.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController topUpAmountController =
      TextEditingController(text: "10");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider<TopUpBloc>(
      create: (context) => TopUpBloc(user),
      child: Builder(
        builder: (context) {
          return Scaffold(
            // drawer: const DeeDeeDrawer(),
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.accountTopUp,
                style: const TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: BlocConsumer<TopUpBloc, TopUpState>(
              listenWhen: (old, current) => old != current,
              listener: (context, state) {
                if (state is TopUpDoneState) {
                  context.read<LoadingCubit>().hideLoading();
                  showSnackBar(
                      context,
                      AppLocalizations.of(context)!
                          .accountWasTopUpSuccessfully);
                } /*else if (state is ValidTopUpField) {
                  context.read<LoadingCubit>().showLoading(context,
                      AppLocalizations.of(context)!.placingTag, false);
                  context
                      .read<PlaceTagBloc>()
                      .placeBid(_topic, _messengerId, _lat, _lon);
                } else if (state is TopUpFailureState) {
                  showSnackBar(context, state.errorMessage);
                }*/
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, right: 24.0, left: 24.0),
                        child: TextFormField(
                            controller: topUpAmountController,
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            validator: validateEmail,
                            style: const TextStyle(fontSize: 18.0),
                            keyboardType: TextInputType.number,
                            cursorColor: const Color(COLOR_PRIMARY),
                            decoration: getInputDecoration(
                                hint: AppLocalizations.of(context)!
                                    .emailAddressTitle,
                                darkMode: isDarkMode(context),
                                errorColor: Theme.of(context).errorColor)),
                      ),
                      DeeDeeButton(AppLocalizations.of(context)!.accountTopUp,
                          () {
                        context.read<TopUpBloc>().add(TopUpActionEvent(
                            double.tryParse(topUpAmountController.text)!));
                      }),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
