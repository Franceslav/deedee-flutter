import 'package:deedee/model/filter_dto.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/global_widgets/slidable_filter_list.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SubscribedFiltersPage extends StatefulWidget {
  const SubscribedFiltersPage({super.key});

  @override
  State<SubscribedFiltersPage> createState() => _SubscribedFiltersPageState();
}

class _SubscribedFiltersPageState extends State<SubscribedFiltersPage> {
  bool _isInit = true;
  final PanelController _controller = PanelController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      context.read<FilterDTOBloc>().add(GetFilterDTOSubscription(userId));
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
    List<FilterDTO> subscribedFilters =
        filterDTOList.where((element) => element.subscribed == true).toList();

    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.subscription,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          filterDTOList.isEmpty
              ? const Center(
                  child: Text('You have no subscription'),
                )
              : SlidableFilterList(filters: subscribedFilters),
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
