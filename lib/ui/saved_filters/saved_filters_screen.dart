import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/model/filtrer_dto.dart';

import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:deedee/ui/global%20widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';

import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../global widgets/deedee_appbar.dart';
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
                            // AppLocalizations.of(context)!.noBookamarks,
                            'У вас пока нет сохраненных фильтров',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: ListView.builder(
                      itemCount: _filters.length,
                      itemBuilder: ((context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.4,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: ((context) {}),
                                backgroundColor: const Color(COLOR_PRIMARY),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                              ),
                              SlidableAction(
                                onPressed: ((context) {
                                  // setState(() {
                                  //   _filters.removeAt(index);
                                  // });
                                  FilterDTOBloc().add(RemoveFilterEvent(
                                      filters: _filters, index: index));
                                }),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.router.replace(MapScreenRoute(
                                // добавить сюда фильтры для меток
                                tagDescriptionMap: {},
                                user: user,
                              ));
                              FilterDTOBloc().add(PushSavedFiltersEvent(
                                  accountType: user.accountType,
                                  filterKeys: _filters[index].filterKeys,
                                  topic: _filters[index].subtopic));
                            },
                            child: Card(
                              color: Colors.grey[200],
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 8),
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.deepPurple,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        _filters[index].topic,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Тема: ${_filters[index].subtopic}',
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          const Text('Ключевые слова:'),
                                          Text(_filters[index]
                                              .filterKeys
                                              .toString())
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    )),
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
