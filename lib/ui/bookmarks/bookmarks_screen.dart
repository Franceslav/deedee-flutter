import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/drawer/deedee_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/bookmarks_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  final User user;

  const BookmarksScreen({super.key, required this.user});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final _bloc = BookmarksBloc();
  List<Tag> _bookmarks = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _bloc.add(LoadBookmarksEvent(widget.user.userID));
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.bookmarksTitle),
      ),
      drawer: DeeDeeDrawer(user: widget.user),
      body: BlocConsumer<BookmarksBloc, BookmarksState>(
        bloc: _bloc,
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
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: ((context, index) {
                      final bookmark = _bookmarks[index];
                      return Dismissible(
                        key: ValueKey(bookmark.tagId),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Theme.of(context).errorColor,
                          alignment: Alignment.centerRight,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            _bookmarks.remove(bookmark);
                          });
                          _bloc.add(
                            DeleteBookmarkEvent(
                              userId: widget.user.userID,
                              bookmark: bookmark,
                              bookmarkIndex: index,
                            ),
                          );
                        },
                        child: ListTile(
                          //Should add more values to Tag model
                          leading: Text(bookmark.messengerId),
                          title: Text(bookmark.topicId),
                          subtitle: Text(bookmark.geoLocation.toString()),
                          onTap: () =>
                              _bloc.add(TapBookmarkEvent(bookmark.tagId)),
                        ),
                      );
                    }),
                    itemCount: _bookmarks.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                  ),
      ),
    );
  }
}
