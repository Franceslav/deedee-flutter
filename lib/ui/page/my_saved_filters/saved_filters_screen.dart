import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/global_widgets/slidable_filter_list.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../generated/filter_service.pb.dart';
import '../../composite_filter_bloc/composite_filter_bloc.dart';

class SavedFiltersScreen extends StatefulWidget {
  const SavedFiltersScreen({super.key});

  @override
  State<SavedFiltersScreen> createState() => _SavedFiltersScreenState();
}

class _SavedFiltersScreenState extends State<SavedFiltersScreen> {
  final PanelController _controller = PanelController();
  List<CompositeFilter> _filters = [];
  bool _isInit = true;
  final AnimatedButtonController _buttonController = AnimatedButtonController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      BlocProvider.of<CompositeFilterBloc>(context)
          .add(LoadFiltersEvent(userId));
      _isInit = false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final compositeFilterList = context
        .select((CompositeFilterBloc bloc) => bloc.state.compositeFilterList);
    _filters = compositeFilterList;
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.safe,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          compositeFilterList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _filters.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'У вас пока нет сохраненных фильтров',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: AnimatedButtonBar(
                              invertedSelection: true,
                              radius: 25,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              controller: _buttonController,
                              children: [
                                ButtonBarEntry(
                                  child: Text(
                                      AppLocalizations.of(context)!.actualTags),
                                  onTap: () {},
                                ),
                                ButtonBarEntry(
                                  child: Text(AppLocalizations.of(context)!
                                      .archiveTags),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                        ),
                        onChanged: (value) {
                          BlocProvider.of<CompositeFilterBloc>(context)
                              .add(SearchSavedFiltersEvent(value));
                        },
                      ),
                    ),
                          Expanded(
                            child: SlidableFilterList(
                              filters: _filters,
                            ),
                          ),
                        ],
                      ),
                    ),
          DeeDeeMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }
}
