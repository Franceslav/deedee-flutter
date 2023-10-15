import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../generated/deedee/api/model/tag.pb.dart';
import '../../../repository/tag_repository.dart';
import '../../../services/helper.dart';
import '../../global_widgets/calendar_dialog.dart';
import '../../routes/app_router.gr.dart';
import '../../theme/app_text_theme.dart';

class ServisProviderSeenScreen extends StatefulWidget {
  const ServisProviderSeenScreen({super.key});

  @override
  State<ServisProviderSeenScreen> createState() =>
      _ServisProviderSeenScreenState();
}

class _ServisProviderSeenScreenState extends State<ServisProviderSeenScreen> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    List<Tag> _tags = [];
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.seen,
        controller: _controller,
        child: ProfilePhotoWithBadge(canChangePhoto: false, radius: 20, fontSize: 20,),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: 5,
        itemBuilder: (context, index) =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32, width: 32, child: Icon(Icons.topic),
                // ProfilePhotoWithBadge()
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
                          context.router
                              .navigate(const ServisProviderScreenRoute());
                        },
                        child: _infoColumn('${_tags.length}', locale.placed)),
                  ),
                  Expanded(
                    // TODO
                    child: InkWell(
                        onTap: () {
                          context.router
                              .navigate(const ServisProviderSeenScreenRoute());
                        },
                        child: _infoColumn('3', locale.seen)),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          showSnackBar(
                            context,
                            AppLocalizations.of(context)!.notAuthorized,
                          );
                        },
                        child: IconButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (ctx) => const CalendarDialog()),
                            icon: const Icon(Icons.edit))),
                  ),
                ],
              ),
            ),
          ),
        ]),
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
}
