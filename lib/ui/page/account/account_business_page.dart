import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deedee/services/helper.dart';

class AccountBusinessPage extends StatelessWidget {
  const AccountBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AccountInfoBusinessPage(),
      ),
    );
  }
}

class AccountInfoBusinessPage extends StatelessWidget {
  const AccountInfoBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.business_center),
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        height: 20,
                        color: Colors.grey[800],
                        thickness: 4,
                        indent: 170,
                        endIndent: 170,
                      ),
                      infoBusinessUser(context),
                      const SizedBox(
                        height: 20,
                      ),
                      const SocialMediaIcon(),
                      const SizedBox(
                        height: 20,
                      ),
                      const WorkTimePlaces()
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Row infoBusinessUser(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: Container(
                // замена на ProfilePhotoWithBadge
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text(
                    "locale.onServiceSince",
                    //AppLocalizations.of(context).text,
                    style: AppTextTheme.titleNormal
                        .copyWith(color: const Color(0xFF8C8C9A)),
                  ),
                  Text(
                    '2023',
                    style: AppTextTheme.titleNormal
                        .copyWith(color: const Color(0xFF8C8C9A)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        showSnackBar(
                          context,
                          AppLocalizations.of(context)!.notAuthorized,
                        );
                      },
                      child: _infoColumn('228', "locale.tags")),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        showSnackBar(
                          context,
                          AppLocalizations.of(context)!.notAuthorized,
                        );
                      },
                      child: _infoColumn('1488', "locale.views")),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _infoColumn(String type, String quantity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          type,
          style: AppTextTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          quantity,
          style: AppTextTheme.titleNormal,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class SocialMediaIcon extends StatefulWidget {
  const SocialMediaIcon({super.key});

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/instagram_logo.png"),
            Image.asset("assets/images/telegram_logo.png"),
            Image.asset("assets/images/phone_icon.png"),
            Image.asset("assets/images/favorite_icon.png"),
          ],
        ),
      ),
    );
  }
}

class WorkTimePlaces extends StatelessWidget {
  const WorkTimePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Время работы",
            style: AppTextTheme.titleNormal.copyWith(
              color: const Color(0xFF8C8C9A),
            ),
          ),
          const Text("Пн-Пт 9:00 - 18:00", style: AppTextTheme.titleNormal),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Адрес",
            style: AppTextTheme.titleNormal.copyWith(
              color: const Color(0xFF8C8C9A),
            ),
          ),
          const Text("г. Брест, ул. Калиноского, 234/4",
              style: AppTextTheme.titleNormal),
        ],
      ),
    );
  }
}
