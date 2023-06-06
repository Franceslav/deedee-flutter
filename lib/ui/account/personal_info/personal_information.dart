import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/app_text_theme.dart';

class PersonalInfoPage extends StatefulWidget {
  PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.personalInformation),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  locale.providerPersonalInfo,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  locale.secureAccountText,
                  style: AppTextTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InfoButton(
                  controller: locale.emailAddressTitle,
                  data: 'abc@gmail.com',
                  onTap: () {}),
              InfoButton(
                  controller: locale.phoneNumber,
                  data: '+123465',
                  onTap: () {}),
              InfoButton(controller: locale.gender, data: 'Male', onTap: () {}),
              InfoButton(
                  controller: locale.birthday,
                  data: '1994.01.23',
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final String data;
  final String controller;

  final void Function()? onTap;

  const InfoButton({
    Key? key,
    required this.data,
    required this.controller,
    //required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: const Color(0xFFF8F4FE),
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller,
                      style: AppTextTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(data, style: AppTextTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
        const DeeDeeDeviderWidget(),
      ],
    );
  }
}
