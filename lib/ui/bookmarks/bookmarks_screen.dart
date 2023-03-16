import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/bookmarks_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Tag> _bookmarks = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userId = BlocProvider.of<UserBloc>(context).state.user.userId;
      BlocProvider.of<BookmarksBloc>(context).add(LoadBookmarksEvent(userId));
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
        title: Text(AppLocalizations.of(context)!.bookmarksTitle),
      ),
      drawer: const DeeDeeDrawer(),
      body: BlocConsumer<BookmarksBloc, BookmarksState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showSnackBar(context, state.errorMessage);
          }
          if (state is LoadedBookmarksState) {
            _bookmarks = state.bookmarks;
          }
          if (state is DeletedSuccessfulState) {
            showSnackBar(
              context,
              AppLocalizations.of(context)!.bookmarkRemovedMessage,
            );
          }
          if (state is DeletedErrorState) {
            _bookmarks.insert(state.bookmarkIndex, state.bookmark);
            showSnackBar(
              context,
              AppLocalizations.of(context)!.bookmarkNotRemovedMessage,
            );
          }
        },
        builder: (context, state) => state is InitialState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _bookmarks.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.noBookamarks,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: ((context, index) {
                      final bookmark = _bookmarks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Dismissible(
                          key: ValueKey(bookmark.tagId),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                //    color: Theme.of(context).colorScheme.error,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              _bookmarks.remove(bookmark);
                            });
                            BlocProvider.of<BookmarksBloc>(context).add(
                              DeleteBookmarkEvent(
                                userId: user.userId,
                                bookmark: bookmark,
                                bookmarkIndex: index,
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              DeeDeeRowInfoWidget(
                                icon: Image.asset(
                                    'assets/images/bookmark_icon.png'),
                                mainText: Text(
                                  bookmark.messengerId,
                                  style: AppTextTheme.bodyLarge,
                                ),
                                secondaryText: Text(
                                  bookmark.topicId,
                                  style: AppTextTheme.labelMedium,
                                ),
                                //     subtitle: Text(bookmark.geoLocation.toString()),
                                onTap: () {},
                              ),
                              const DeeDeeDeviderWidget(),
                            ],
                          ),
                        ),
                      );
                    }),
                    itemCount: _bookmarks.length,
                  ),
      ),
    );
  }
}
