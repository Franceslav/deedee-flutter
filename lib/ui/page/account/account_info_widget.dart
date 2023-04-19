import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 64, width: 64, child: ProfilePhotoWithBadge()),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                user.fullName(),
                style: AppTextTheme.titleNormal,
              ),
            ),
            //TODO implement data
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Text(
                    locale.onServiceSince,
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
                        context.router.push(const UserTagsScreenRoute());
                      },
                      child: _infoColumn('9', locale.placed)),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        context.router.push(const StatsScreenRoute());
                      },
                      child: _infoColumn('3', locale.seen)),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        context.router.push(const BookmarksScreenRoute());
                      },
                      child: _infoColumn('0', locale.bookmarked)),
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
