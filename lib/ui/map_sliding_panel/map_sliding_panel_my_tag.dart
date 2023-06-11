import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/push_notification_service.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/map_sliding_panel/bloc/map_sliding_panel_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../generated/deedee/api/model/composite_filter.pb.dart';
import '../../injection.dart';
import '../../repository/composite_filter_repository.dart';
import '../../repository/service_request_repository.dart';
import '../../repository/topic_repository.dart';
import '../../services/helper.dart';
import '../page/map_cubit/map_screen_my_tag.dart';
import '../selector/bloc/selector_bloc.dart';
import '../selector/selector_appbar.dart';
import '../theme/app_text_theme.dart';
import '../user_bloc/user_bloc.dart';
import '../user_tags/tag_info_widget.dart';

class MapSlidingPanelMyTag extends StatefulWidget {
  final DeeDeeSliderMyTagsController _panelController;
  final Int64 _selectedTagId;
  final bool _openedFirstTime;
  final List<FilterKey> filterKeys;
  final List<FilterKey> selectedFilterKeys;
  final CompositeFilter currentFilter;
  final Tag tag;

  const MapSlidingPanelMyTag({
    super.key,
    required DeeDeeSliderMyTagsController controller,
    required String selectedMessengerId,
    required Int64 selectedTagId,
    required bool openedFirstTime,
    s,
    required this.filterKeys,
    required this.selectedFilterKeys,
    required this.currentFilter,
    required this.tag,
  })  : _panelController = controller,
        _selectedTagId = selectedTagId,
        _openedFirstTime = openedFirstTime;

  @override
  State<MapSlidingPanelMyTag> createState() => _MapSlidingPanelMyTagState();
}

class _MapSlidingPanelMyTagState extends State<MapSlidingPanelMyTag> {
  var _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = MapSlidingPanelBloc(
      locator.get<ServiceRequestRepository>(),
      locator.get<TagRepository>(),
      widget._selectedTagId,
      user,
    );
    final selectorBloc = SelectorBloc(
      locator.get<TagRepository>(),
      locator.get<TopicRepository>(),
      locator.get<CompositeFilterRepository>(),
      user,
    );
    final size = MediaQuery.of(context).size;
    final bottomStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    return BlocProvider(
      create: (_) => selectorBloc,
      child: BlocConsumer<MapSlidingPanelBloc, MapSlidingPanelState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ServiceRequestCreatedState) {
            locator.get<PushNotificationService>().sendPushNotification(
                  context: context,
                  serviceRequestId: state.serviceRequestId.toString(),
                );
          }
          if (state is MapSlidingPanelIsBookmarkedState &&
              state.snackbarNotification != null) {
            showSnackBar(context, state.snackbarNotification!);
          }
          /* if (state is ErrorState) {
            showSnackBar(context, state.errorMessage);
          }*/
        },
        builder: (context, state) {
          if (state is MapSlidingPanelIsBookmarkedState &&
              widget._selectedTagId != Int64(0)) {
            _isBookmarked = state.isBookmarked;
          }
          return SlidingUpPanel(
            renderPanelSheet: true,
            panelSnapping: true,
            defaultPanelState: PanelState.CLOSED,
            backdropEnabled: true,
            collapsed: _CustomCollapsedWidget(
              openedFirstTime: widget._openedFirstTime,
            ),
            minHeight: widget._openedFirstTime
                ? 0
                : MediaQuery.of(context).size.height * 0.04,
            maxHeight: MediaQuery.of(context).size.height * 0.35,
            controller: widget._panelController,
            header: Container(
              margin: EdgeInsets.fromLTRB(size.width / 2 - 30, 10.0, 24.0, 0.0),
              width: 60,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
            panel: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget._openedFirstTime
                      ? []
                      : [
                          GestureDetector(
                            onTap: () {
                              context.router.navigate(
                                  AccountSupplierScreenRoute(
                                      selectedCreatorId:
                                          widget._selectedTagId));
                            },
                            child: TagInfoWidget(
                              currentFilter: widget.currentFilter,
                              tag: Tag(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: BlocConsumer<SelectorBloc, SelectorState>(
                              listener: (context, state) {
                                if (state is FilterKeySelectedState) {
                                  widget.selectedFilterKeys
                                          .contains(state.filterKey)
                                      ? widget.selectedFilterKeys
                                          .remove(state.filterKey)
                                      : widget.selectedFilterKeys
                                          .add(state.filterKey);
                                }
                              },
                              builder: (context, state) {
                                return SelectorAppBar(
                                  allItems: widget.filterKeys,
                                  selectedItems: widget.selectedFilterKeys,
                                  onTap: (FilterKey filterKey) => selectorBloc
                                      .add(SelectFilterKeyEvent(filterKey)),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //TODO implement data
                              children: [
                                const Text(
                                  'Адрес',
                                  style: AppTextTheme.bodyMedium,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'ул.Калиновского д.235/4',
                                  style: AppTextTheme.bodyLarge,
                                ),
                                const SizedBox(height: 12),
                                OutlinedButtonWidget(
                                    text: 'Fake Request',
                                    onPressed: () {
                                      bloc.add(
                                        MapSlidingPanelRequestCreate(
                                          widget._selectedTagId,
                                        ),
                                      );
                                    }),
                                SizedBox(height: 2),
                              ],
                            ),
                          )
                        ],
                ),
              ),
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          );
        },
      ),
    );
  }
}

class _CustomCollapsedWidget extends StatelessWidget {
  final bool _openedFirstTime;

  const _CustomCollapsedWidget({
    required openedFirstTime,
  }) : _openedFirstTime = openedFirstTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Center(
          child:
              Text(AppLocalizations.of(context)!.clickMarkerViewApplication)),
    );
  }
}
