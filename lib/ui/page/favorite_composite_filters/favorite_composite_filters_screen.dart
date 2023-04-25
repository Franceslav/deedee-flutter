import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';

import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/repository/composite_filter_repository.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../../injection.dart';
import '../../../services/helper.dart';
import '../../global_widgets/dee_dee_devider_widget.dart';
import '../../global_widgets/dee_dee_row_info_widget.dart';
import '../../routes/app_router.gr.dart';
import '../../theme/app_text_theme.dart';
import 'composite_filter_bloc/composite_filter_bloc.dart';

class FavoriteCompositeFiltersScreen extends StatefulWidget {
  const FavoriteCompositeFiltersScreen({super.key});

  @override
  State<FavoriteCompositeFiltersScreen> createState() =>
      _FavoriteCompositeFiltersScreenState();
}

class _FavoriteCompositeFiltersScreenState
    extends State<FavoriteCompositeFiltersScreen> {
  final PanelController _controller = PanelController();
  List<CompositeFilter> _filters = [];

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    var bloc =
        CompositeFilterBloc(locator.get<CompositeFilterRepository>(), user);
    return BlocProvider<CompositeFilterBloc>(
      create: (context) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.safe,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<CompositeFilterBloc, CompositeFilterState>(
              listener: (context, state) {
                if (state is CompositeFilterLoadState) {
                  _filters = state.compositeFilterList;
                }
                if (state is CompositeFilterDeleteSuccessfulState) {
                  showSnackBar(context, 'filter deleted');
                }
                if (state is CompositeFilterDeleteErrorState) {
                  _filters.insert(state.index, state.compositeFilter);
                  showSnackBar(context, 'filter was not deleted');
                }
                if (state is ErrorState) {
                  showSnackBar(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is CompositeFilterLoadState) {
                  _filters = state.compositeFilterList;
                }
                return _filters.isEmpty
                    ? const Center(
                        child: Text('Нou don\'t have favorite filters'))
                    : Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: _filters.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const DeeDeeDeviderWidget();
                                },
                                itemBuilder: ((context, index) {
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.2,
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: ((context) {
                                            bloc.add(
                                              CompositeFilterDeleteEvent(
                                                compositeFilter:
                                                    _filters[index],
                                                index: index,
                                              ),
                                            );
                                          }),
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 8.0),
                                      child: DeeDeeRowInfoWidget(
                                        icon: Image.asset(
                                            'assets/images/bookmark_icon.png'),
                                        mainText: Text(
                                          _filters[index].title,
                                          style: AppTextTheme.bodyLarge,
                                        ),
                                        secondaryText: Text(
                                          '${_filters[index].topic.title}: ${_selectedSubtopic(_filters[index])}',
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: AppTextTheme.bodyMedium,
                                        ),
                                        onTap: () {
                                          context.router.push(
                                            FilterPageRoute(
                                              currentFilter: _filters[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ),
      ),
    );
  }

  String _selectedSubtopic(CompositeFilter compositeFilter) {
    var selectedSubtopic = compositeFilter.filterMap.filter(
        (entry) => entry.value.filterKeys.any((element) => element.selected));
    return selectedSubtopic.keys.join(', ');
  }
}
