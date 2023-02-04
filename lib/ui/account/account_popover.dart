import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import '../../model/user.dart';

class Popover extends StatelessWidget {
  final User user;

  const Popover({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                if (!user.isVerified) ...[
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
                          user.isVerified = true;
                          Navigator.of(context).pop();
                        }),
                  ),
                ],
                if (user.isVerified && !user.isPremium) ...[
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
                          user.isPremium = true;
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
