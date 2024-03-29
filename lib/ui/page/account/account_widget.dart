import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/appointment_tooltip.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../calendar/calendar_page.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({
    super.key,
  });

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final List<Tag> _tags = [];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = UserTagsBloc(locator.get<TagRepository>(), user);
    return BlocProvider(
      create: (context) => bloc,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: ProfilePhotoWithBadge(
                  canChangePhoto: false,
                  radius: 52,
                  fontSize: 36,
                ),
              ),
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
          BlocConsumer<UserTagsBloc, UserTagsState>(
            listener: (context, state) {
              if (state is LoadedTagsState) {
                _tags.addAll(state.tags.filter((element) =>
                    element.status == Tag_Status.PLACED &&
                    element.createdBy == user.email));
              }
            },
            builder: (context, state) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              context.router
                                  .navigate(const UserTagsScreenRoute());
                            },
                            child:
                                _infoColumn('${_tags.length}', locale.placed)),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {}, child: _infoColumn('4', locale.seen)),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.router.navigate(
                              const LineChartPageRoute(),
                            );
                          },
                          child: _chartColumn(locale.chart),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
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

  Column _chartColumn(String quantity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.area_chart),
        const SizedBox(height: 3),
        Text(
          quantity,
          style: AppTextTheme.titleNormal,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
