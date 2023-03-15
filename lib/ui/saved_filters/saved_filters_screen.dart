import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/filter_dto.dart';

import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';

import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/global_widgets/slidable_filter_list.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';

import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../global_widgets/deedee_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SavedFiltersScreen extends StatefulWidget {
  const SavedFiltersScreen({super.key});

  @override
  State<SavedFiltersScreen> createState() => _SavedFiltersScreenState();
}

class _SavedFiltersScreenState extends State<SavedFiltersScreen> {
  final PanelController _controller = PanelController();
  List<FilterDTO> _filters = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      BlocProvider.of<FilterDTOBloc>(context).add(LoadFiltersEvent(userId));
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
    final filterDTOList =
        context.select((FilterDTOBloc bloc) => bloc.state.filterDTOList);
    _filters = filterDTOList;
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.safe,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          filterDTOList == null
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
                      child: SlidableFilterList(
                        filters: _filters,
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
