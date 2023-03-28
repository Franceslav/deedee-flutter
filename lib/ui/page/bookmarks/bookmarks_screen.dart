import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bloc/bookmarks_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final PanelController _controller = PanelController();
  List<Tag> _bookmarks = [];
  late final User _user;
  final AnimatedButtonController _buttonController = AnimatedButtonController();

  @override
  void initState() {
    super.initState();
    _user = BlocProvider.of<UserBloc>(context).state.user;
    BlocProvider.of<BookmarksBloc>(context)
        .add(LoadBookmarksEvent(userId: _user.userId));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.bookmarksTitle,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: <Widget>[
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
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: AnimatedButtonBar(
                              invertedSelection: true,
                              radius: 25,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              controller: _buttonController,
                              children: [
                                ButtonBarEntry(
                                  child: Text(
                                      AppLocalizations.of(context)!.actualTags),
                                  onTap: () {},
                                ),
                                ButtonBarEntry(
                                  child: Text(AppLocalizations.of(context)!
                                      .archiveTags),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Colors.black,
                            height: 0,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: ((context, index) {
                                final bookmark = _bookmarks[index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.5,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: ((context) {}),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.orange,
                                        icon: CommunityMaterialIcons.star,
                                      ),
                                      SlidableAction(
                                        onPressed: ((context) {}),
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color(COLOR_PRIMARY),
                                        icon: Icons.edit,
                                      ),
                                      SlidableAction(
                                        onPressed: ((context) {
                                          setState(() {
                                            _bookmarks.remove(bookmark);
                                          });
                                          BlocProvider.of<BookmarksBloc>(
                                                  context)
                                              .add(
                                            DeleteBookmarkEvent(
                                              userId: user.userId,
                                              bookmark: bookmark,
                                              bookmarkIndex: index,
                                            ),
                                          );
                                        }),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.red,
                                        icon: Icons.delete,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: DeeDeeRowInfoWidget(
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
                                  ),
                                );
                                // );
                              }),
                              itemCount: _bookmarks.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const DeeDeeDeviderWidget();
                              },
                            ),
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
