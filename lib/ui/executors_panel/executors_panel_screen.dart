import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/social_service.dart';
import 'package:deedee/ui/executors_panel/bloc/executors_panel_bloc.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/global_widgets/profile_widgets/contact_facility_widget.dart';
import 'package:deedee/ui/global_widgets/profile_widgets/distance_indicator_widget.dart';
import 'package:deedee/ui/global_widgets/profile_widgets/on_boarded_date_indicator_widget.dart';
import 'package:deedee/ui/global_widgets/profile_widgets/rating_indicator_widget.dart';
import 'package:deedee/ui/map_sliding_panel/bloc/map_sliding_panel_bloc.dart';
import 'package:deedee/ui/map_sliding_panel/map_sliding_panel.dart';
import 'package:deedee/ui/page/account/account_info_widget.dart';
import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:deedee/ui/page/map_cubit/tag_marker/tag_marker.dart';
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
  final List<TagMarker> _tagMarkers;

  const ExecutorsPanelScreen(
      {super.key,
      required DeeDeeSliderController controller,
      required List<TagMarker> tagMarkers})
      : _panelController = controller,
        _tagMarkers = tagMarkers;

  @override
  State<ExecutorsPanelScreen> createState() => _ExecutorsPanelScreenState();
}

class _ExecutorsPanelScreenState extends State<ExecutorsPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final size = MediaQuery.of(context).size;
    final bottomStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    return SlidingUpPanel(
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
        panel: ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          itemCount: widget._tagMarkers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: const SizedBox(
                    height: 64, width: 64, child: ProfilePhotoWithBadge()),
                title: Text(
                  user.fullName(),
                  style: AppTextTheme.bodyMedium
                      .copyWith(color: const Color(0xFF1A1A1B)),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnBoardedDateIndicatorWidget(date: '2023'),
                    SizedBox(height: 2),
                    RatingIndicatorWidget(),
                  ],
                ),
                visualDensity: VisualDensity.compact,
                dense: true,
                isThreeLine: true,
                onTap: () {
                  context.router.navigate(
                    AccountSupplierScreenRoute(
                      selectedCreatorId: Int64(0), // TODO: fix later
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
