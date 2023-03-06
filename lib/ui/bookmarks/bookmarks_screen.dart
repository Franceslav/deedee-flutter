import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
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
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              //Should add more values to Tag model
                              leading: Text(
                                bookmark.messengerId,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(bookmark.topicId),
                              subtitle: Text(bookmark.geoLocation.toString()),
                            ),
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
