import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/ui/executors_panel/bloc/executors_panel_bloc.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/map_sliding_panel/bloc/map_sliding_panel_bloc.dart';
import 'package:deedee/ui/map_sliding_panel/map_sliding_panel.dart';
import 'package:deedee/ui/page/account/account_info_widget.dart';
import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExecutorsPanelScreen extends StatefulWidget {
  final DeeDeeSliderController _panelController;
  final Int64 _selectedTagId;

  const ExecutorsPanelScreen(
      {super.key,
      required DeeDeeSliderController controller,
      required Int64 selectedTagId})
      : _panelController = controller,
        _selectedTagId = selectedTagId;

  @override
  State<ExecutorsPanelScreen> createState() => _ExecutorsPanelScreenState();
}

class _ExecutorsPanelScreenState extends State<ExecutorsPanelScreen> {

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = ExecutorsPanelBloc(user,locator.get<TagRepository>(),
    );

    final size = MediaQuery.of(context).size;
    return BlocProvider<ExecutorsPanelBloc>(create: (context) => bloc,
    child: SlidingUpPanel(
            renderPanelSheet: true,
            panelSnapping: true,
            defaultPanelState: PanelState.OPEN,
            backdropEnabled: false,
            minHeight: MediaQuery.of(context).size.height * 0.04,
            maxHeight: MediaQuery.of(context).size.height * 0.35,
            controller: widget._panelController,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            header: Container(
              margin: EdgeInsets.fromLTRB(size.width / 2 - 30, 10.0, 24.0, 0.0),
              width: 60,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
            panel: BlocBuilder<ExecutorsPanelBloc, ExecutorsPanelState>(
              builder: (context, state) {
                if (state is ExecutorsPanelLoadedState &&
                    widget._selectedTagId != Int64(0)) {
                  return ListView(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ListTile(
                          leading: const SizedBox(
                              height: 64, width: 64, child: ProfilePhotoWithBadge()),
                          title: Text(user.fullName(), style: AppTextTheme.titleMedium
                              .copyWith(color: const Color(0xFF1A1A1B)),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  AppLocalizations.of(context)!.onServiceSince,
                                  style: AppTextTheme.titleNormal
                                      .copyWith(color: const Color(0xFF8C8C9A)),
                                ),
                                Text(
                                  '2023',
                                  style: AppTextTheme.titleNormal
                                      .copyWith(color: const Color(0xFF8C8C9A)),
                                )
                              ]),
                              Row(children: [
                                Icon(Icons.star),
                                Text(
                                  '4.5',
                                  style: AppTextTheme.titleNormal
                                      .copyWith(color: const Color(0xFF8C8C9A)),
                                )
                              ]),
                            ],
                          ),
                          trailing: Text('hello'),
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          isThreeLine: true,
                          onTap: () {
                            context.router.navigate(
                                AccountSupplierScreenRoute(
                                    selectedCreatorId:
                                    widget._selectedTagId));
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              }

            )

          ),

    );

  }
}

