import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/TagService.pb.dart';

import 'package:deedee/services/helper.dart';

import 'package:deedee/ui/global%20widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';

import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global widgets/app_bar_button.dart';

class SavedFiltersScreen extends StatefulWidget {
  const SavedFiltersScreen({super.key});

  @override
  State<SavedFiltersScreen> createState() => _SavedFiltersScreenState();
}

class _SavedFiltersScreenState extends State<SavedFiltersScreen> {
  final PanelController _controller = PanelController();

  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Сохраненные фильтры'),
        actions: [AppBarButton(controller: _controller)],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // AppLocalizations.of(context)!.noBookamarks,
                  'У вас пока нет сохраненных фильтров',
                  style: Theme.of(context).textTheme.headline1,
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
