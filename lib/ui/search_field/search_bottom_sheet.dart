import 'package:deedee/ui/search_field/search_bloc/search_bloc.dart';
import 'package:deedee/ui/search_field/search_bloc/search_event.dart';
import 'package:deedee/ui/search_field/search_bloc/search_state.dart';
import 'package:deedee/ui/search_field/search_spec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<int?> showSearchBottomSheet<int>(
  BuildContext context, {
  required SearchSpec spec,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    useSafeArea: true,
    isScrollControlled: true,
    builder: (_) => DraggableScrollableSheet(
      initialChildSize: 1,
      expand: false,
      builder: (_, controller) => SearchBottomSheet(spec, controller),
    ),
  );
}

class SearchBottomSheet extends StatefulWidget {
  final SearchSpec spec;
  final ScrollController controller;

  const SearchBottomSheet(
    this.spec,
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  late final _controller = TextEditingController(text: widget.spec.initQuery);

  @override
  Widget build(BuildContext context) {
    final spec = widget.spec;

    return BlocProvider(
      create: (_) => SearchBloc(
        initQuery: spec.initQuery,
        itemsLength: spec.length,
        searchValueBuilder: spec.searchValueBuilder,
      ),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchStateSelected) {
            Navigator.pop(context, [
              state.selectedIndex,
              state.query,
            ]);
            spec.onSelected!(state.selectedIndex);
          }
        },
        builder: (context, SearchState state) {
          if (state is SearchStateLoading) {
            return const CircularProgressIndicator.adaptive();
          }

          final indexes = state.displayedIndexes;
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                controller: _controller,
                onChanged: (query) {
                  context.read<SearchBloc>().add(SearchEventNewQuery(query));
                },
              ),
            ),
            Flexible(
              child: ListView.separated(
                controller: widget.controller,
                itemCount: indexes.length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, i) {
                  var item = spec.itemBuilder(context, indexes[i]);

                  if (spec.onSelected != null) {
                    item = GestureDetector(
                      child: item,
                      onTap: () => context
                          .read<SearchBloc>()
                          .add(SearchEventSelected(indexes[i])),
                    );
                  }

                  return item;
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
