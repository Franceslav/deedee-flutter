import 'package:deedee/ui/account/account_verify_screen.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import '../../model/user.dart';
import '../../services/helper.dart';

class Popover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return Container(
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FractionallySizedBox(
            widthFactor: 0.25,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Container(
                height: 5.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (user.emailVerification ==
                        EmailVerificationStatus.unverified &&
                    user.docVerification ==
                        DocVerificationStatus.unverified) ...[
                  Text(
                    AppLocalizations.of(context)!.accountNeedVerify,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
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
                          AppLocalizations.of(context)!.accountVerify,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          push(context, VerifyScreen());
                        }),
                  ),
                ],
                if (user.emailVerification ==
                        EmailVerificationStatus.verified &&
                    user.docVerification == DocVerificationStatus.verified &&
                    user.premiumStatus == PremiumStatus.notPremium) ...[
                  Text(
                    AppLocalizations.of(context)!.accountPremiumPrice,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
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
                          AppLocalizations.of(context)!.accountGetPremium,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          context.read<UserBloc>().add(UserTogglePremium());
                          Navigator.of(context).pop();
                        }),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
