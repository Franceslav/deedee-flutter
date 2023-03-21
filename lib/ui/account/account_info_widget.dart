import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                'На сервисе с 2023г',
                style: AppTextTheme.titleNormal
                    .copyWith(color: const Color(0xFF8C8C9A)),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 30.5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                ' 228',
                style: AppTextTheme.titleMedium,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Тегов',
                style: AppTextTheme.titleNormal,
              )
            ],
          ),
        ),
        Column(
          children: const [
            Text(
              '1488',
              style: AppTextTheme.titleMedium,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Просмотров',
              style: AppTextTheme.titleNormal,
            )
          ],
        ),
      ],
    );
  }
}
