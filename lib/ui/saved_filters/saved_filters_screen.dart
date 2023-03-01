import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user_personal_filter.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/loading_cubit.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/saved_filters/bloc/saved_filters_bloc.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:latlong2/latlong.dart';

class SavedFiltersScreen extends StatefulWidget {
  const SavedFiltersScreen({super.key});

  @override
  State<SavedFiltersScreen> createState() => _SavedFiltersScreenState();
}

class _SavedFiltersScreenState extends State<SavedFiltersScreen> {
  List<Filter> _filters = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      BlocProvider.of<SavedFiltersBloc>(context).add(LoadFiltersEvent(userId));
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
        // title: Text(AppLocalizations.of(context)!.bookmarksTitle),
        title: Text('Сохраненные фильтры'),
      ),
      drawer: const DeeDeeDrawer(),
      body: BlocConsumer<SavedFiltersBloc, SavedFiltersState>(
          listener: (context, state) {
            if (state is ErrorState) {
              showSnackBar(context, state.errorMessage);
            }

            // if (state is UserSavedFiltersDoneState || state is ErrorState) {
            //   context.read<LoadingCubit>().hideLoading();
            //   if (state is ErrorState) {
            //     showSnackBar(context, state.errorMessage);
            //   }
            //   if (state is UserSavedFiltersDoneState) {
            //     Map<LatLng, String> tagMap = {
            //       for (var tag in state.topic.tags)
            //         LatLng(tag.geoLocation.latitude, tag.geoLocation.longitude):
            //             tag.messengerId
            //     };
            //     context.router.replace(MapScreenRoute(
            //       tagDescriptionMap: tagMap,
            //       user: user,
            //     ));
            //   }
            // }
          },
          // builder: (context, state) => state is InitialState
          builder: (context, state) => state is InitialState
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
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // _filters = [
                                  //   'Клининг',
                                  //   'маникюр',
                                  //   'японский',
                                  //   'я',
                                  //   'ф',
                                  // ];
                                  _filters = [
                                    Filter(
                                      userId: user.userId,
                                      filterId: '1',
                                      topic: 'Клининг',
                                      subtopic: 'маникюр',
                                      filterKeys: ['японский', 'я', 'ф'],
                                      bookmarked: false,
                                      subscribed: true,
                                    )
                                  ];
                                });
                              },
                              child: Text('add Filter')),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  BlocProvider.of<SavedFiltersBloc>(context)
                                      .add(LoadFiltersEvent('1'));
                                  // print(user);
                                });
                              },
                              child: Text('print'))
                        ],
                      ),
                    )
                  : Center(
                      child: ListView.builder(
                        // itemCount: state.length,
                        itemCount: _filters.length,
                        itemBuilder: ((context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.4,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((context) {
                                    print('Редактировать фильтр');
                                  }),
                                  backgroundColor: const Color(COLOR_PRIMARY),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                ),
                                // SlidableAction(
                                //   onPressed: ((context) {
                                //     print('${user.savedFilters}');
                                //     print('devider');
                                //     print(_filters);
                                //   }),
                                //   backgroundColor: Colors.green,
                                //   foregroundColor: Colors.white,
                                //   icon: Icons.person,
                                // ),
                                SlidableAction(
                                  onPressed: ((context) {
                                    print('Удалить фильтр');
                                    setState(() {
                                      print(_filters[index].filterId);
                                      _filters.removeAt(index);
                                    });
                                  }),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                SavedFiltersBloc().add(PushSavedFiltersEvent(
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
                                      height: 120,
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
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                color: Colors.amber,
                                                shape: BoxShape.circle),
                                          ),
                                          const Spacer(),
                                          Text(
                                            _filters[index].topic,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                      ),
                    )),
    );
  }
}
