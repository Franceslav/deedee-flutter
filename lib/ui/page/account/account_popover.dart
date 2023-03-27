import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPopover extends StatelessWidget {
  const AccountPopover({super.key});

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
                if ((user.emailVerification ==
                            EmailVerificationStatus.unverified &&
                        user.docVerification ==
                            DocVerificationStatus.unverified) ||
                    (user.emailVerification ==
                            EmailVerificationStatus.verified &&
                        user.docVerification ==
                            DocVerificationStatus.unverified) ||
                    (user.emailVerification ==
                            EmailVerificationStatus.unverified &&
                        user.docVerification ==
                            DocVerificationStatus.verified)) ...[
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
                          context.router.push(const VerifyScreenRoute());
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
                          context.router.pop();
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
