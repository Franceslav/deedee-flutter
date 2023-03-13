import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../global_widgets/deedee_appbar.dart';
import 'bloc/bookmarks_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final PanelController _controller = PanelController();
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
      appBar: DeeDeeAppBar(
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: [
          BlocConsumer<BookmarksBloc, BookmarksState>(
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
                              BlocProvider.of<BookmarksBloc>(context).add(
                                DeleteBookmarkEvent(
                                  userId: user.userId,
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
                                  BlocProvider.of<BookmarksBloc>(context).add(
                                      AddBookmarkEvent(
                                          userId: user.userId,
                                          tagId: bookmark.tagId)),
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
