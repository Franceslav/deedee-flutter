import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/page/filter/filter_page.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:latlong2/latlong.dart';
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
  final AnimatedButtonController _buttonController = AnimatedButtonController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = BookmarksBloc(locator<TagRepository>(), user.userId);
    return Scaffold(
      appBar: DeeDeeAppBar(
        title: AppLocalizations.of(context)!.bookmarksTitle,
        controller: _controller,
        child: const ProfilePhotoWithBadge(),
      ),
      body: Stack(
        children: <Widget>[
          BlocConsumer<BookmarksBloc, BookmarksState>(
            bloc: bloc,
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
                                  child: Text(AppLocalizations.of(context)!
                                      .actualTags),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.of(context)!.search,
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                              ),
                              onChanged: (value) {
                                bloc.add(SearchBookmarksEvent(value));
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
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
                                          bloc.add(
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
                                        '' /*bookmark.messengerId*/, //TODO:
                                        style: AppTextTheme.bodyLarge,
                                      ),
                                      secondaryText: Text(
                                        bookmark.compositeFilter.topic.title,
                                        style: AppTextTheme.labelMedium,
                                      ),
                                      //     subtitle: Text(bookmark.geolocation.toString()),
                                      onTap: () {
                                        Map<LatLng, TagDTO> tagMap = {
                                          LatLng(
                                              bookmark.geolocation.latitude,
                                              bookmark.geolocation
                                                  .longitude): TagDTO(
                                              bookmark.tagId,
                                              '' /*bookmark.messengerId*/)
                                        };
                                        context.router.push(
                                          MapScreenRoute(
                                            tagDescriptionMap: tagMap,
                                            currentFilter:
                                                CompositeFilter(), //TODO
                                          ),
                                        );
                                      },
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
