import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global widgets/deedee_appbar.dart';
import '../user_bloc/user_bloc.dart';

class SubscribedFiltersPage extends StatefulWidget {
  const SubscribedFiltersPage({super.key});

  @override
  State<SubscribedFiltersPage> createState() => _SubscribedFiltersPageState();
}

class _SubscribedFiltersPageState extends State<SubscribedFiltersPage> {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final userPersonalFilters =
        context.select((FilterDTOBloc bloc) => bloc.state.filterDTOList);
    Future.delayed(Duration.zero, () {
      context.read<FilterDTOBloc>().add(GetFilterDTOSubscription(user.userId));
    });
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.subscription,
        controller: _controller,
      ),
      drawer: const DeeDeeDrawer(),
      body: userPersonalFilters.isEmpty
          ? const Center(
              child: Text('You have no subscription'),
            )
          : ListView.builder(
              itemCount: userPersonalFilters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    userPersonalFilters[index].topic,
                  ),
                );
              },
            ),
    );
  }
}
