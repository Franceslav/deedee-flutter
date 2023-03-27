import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/model/filter_dto.dart';
import 'package:deedee/ui/filter/filter_screen.dart';
import 'package:deedee/ui/filter_dto_bloc/filter_dto_bloc.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableFilterList extends StatefulWidget {
  final List<FilterDTO> filters;

  const SlidableFilterList({super.key, required this.filters});

  @override
  State<SlidableFilterList> createState() => _SlidableFilterListState();
}

class _SlidableFilterListState extends State<SlidableFilterList> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return ListView.builder(
      itemCount: widget.filters.length,
      itemBuilder: ((context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.5,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {
                  FilterDTOBloc()
                      .add(AddFilterDTOSubscription(widget.filters[index]));
                }),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                icon: widget.filters[index].subscribed
                    ? CommunityMaterialIcons.star
                    : CommunityMaterialIcons.star_off,
              ),
              SlidableAction(
                onPressed: ((context) {
                  context.router.replace(FilterPageRoute(
                    topicName: widget.filters[index].topic,
                    currentFilter: CompositeFilter([], []),
                    // index: index
                  ));
                }),
                backgroundColor: const Color(COLOR_PRIMARY),
                foregroundColor: Colors.white,
                icon: Icons.edit,
              ),
              SlidableAction(
                onPressed: ((context) {
                  setState(() {
                    widget.filters.removeAt(index);
                  });
                  FilterDTOBloc().add(
                      RemoveFilterEvent(filters: widget.filters, index: index));
                }),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              context.router.replace(
                MapScreenRoute(
                  // добавить сюда фильтры для меток
                  tagDescriptionMap: {},
                  user: user,
                  topicName: '',
                  currentFilter: CompositeFilter([], []),
                ),
              );
              FilterDTOBloc().add(PushSavedFiltersEvent(
                accountType: user.accountType,
                filterKeys: widget.filters[index].filterKeys,
                topic: widget.filters[index].subtopic,
              ));
            },
            child: Card(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    height: 80,
                    width: MediaQuery.of(context).size.width / 3,
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
                        widget.filters[index].topic,
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
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Тема: ${widget.filters[index].subtopic}',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                          ),
                          const Text('Ключевые слова:'),
                          Text(widget.filters[index].filterKeys.toString())
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
    );
  }
}
