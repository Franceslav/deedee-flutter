import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/services/helper.dart';

import '../../../constants.dart';

class AccountBusinessPage extends StatelessWidget {
  const AccountBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const AccountInfoBusinessPage(),
    );
  }
}

class AccountInfoBusinessPage extends StatelessWidget {
  const AccountInfoBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountInfoTitle(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.lightgrey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 13,
              ),
              child: Text(
                AppLocalizations.of(context)!.regToBecomeClient,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const BusinesRowInfoWidget()
        ],
      ),
    );
  }
}

class AccountInfoTitle extends StatelessWidget {
  const AccountInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.deeDeeForBusiness,
            style: AppTextTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            locale.placeText,
            style: AppTextTheme.labelLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class BusinesRowInfoWidget extends StatefulWidget {
  const BusinesRowInfoWidget({super.key});

  @override
  State<BusinesRowInfoWidget> createState() => _BusinesRowInfoWidgetState();
}

class _BusinesRowInfoWidgetState extends State<BusinesRowInfoWidget> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.nameCompany,
              labelText: AppLocalizations.of(context)!.nameCompany,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.homeChooseCity,
              labelText: AppLocalizations.of(context)!.homeChooseCity,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.contactInformation,
              labelText: AppLocalizations.of(context)!.contactInformation,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.phoneNumber,
              labelText: AppLocalizations.of(context)!.phoneNumber,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.agreePP,
                  style: AppTextTheme.bodyLarge, softWrap: true, maxLines: 2),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              )
            ],
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              //width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(GRADIENT_COLOR_START),
                  Color(GRADIENT_COLOR_END)
                ]),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.connect,
                  style: AppTextTheme.titleLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
