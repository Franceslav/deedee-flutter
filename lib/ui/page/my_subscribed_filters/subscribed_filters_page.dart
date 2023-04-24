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

class SubscribedFiltersPage extends StatefulWidget {
  const SubscribedFiltersPage({super.key});

  @override
  State<SubscribedFiltersPage> createState() => _SubscribedFiltersPageState();
}

class _SubscribedFiltersPageState extends State<SubscribedFiltersPage> {
  bool _isInit = true;
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      context.read<CompositeFilterBloc>().add(GetFilterSubscription(userId));
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
    List<CompositeFilter> subscribedFilters = compositeFilterList
        .where((element) => element.status == CompositeFilter_Status.SUBSCRIBED)
        .toList();

    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.subscription,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          compositeFilterList.isEmpty
              ? const Center(
                  child: Text('You have no subscription'),
                )
              : Column(
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
                            child:
                                Text(AppLocalizations.of(context)!.actualTags),
                            onTap: () {},
                          ),
                          ButtonBarEntry(
                            child:
                                Text(AppLocalizations.of(context)!.archiveTags),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.black,
                      height: 0,
                    ),
                    Expanded(
                        child: SlidableFilterList(filters: subscribedFilters)),
                  ],
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
