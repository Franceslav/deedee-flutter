import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/search_field/search_field.dart';
import 'package:deedee/ui/search_field/search_spec.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:deedee/ui/user_tags/user_tags_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../repository/tag_repository.dart';
import 'tag_card_widget.dart';

class UserTagsScreen extends StatefulWidget {
  const UserTagsScreen({super.key});

  @override
  State<UserTagsScreen> createState() => _UserTagsScreenState();
}

class _UserTagsScreenState extends State<UserTagsScreen> {
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();
  final _tags = <Tag>[];
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = UserTagsBloc(locator.get<TagRepository>(), user);
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: AppLocalizations.of(context)!.userTagsTitle,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: Stack(
          children: [
            BlocConsumer<UserTagsBloc, UserTagsState>(
              listener: (context, state) {
                if (state is LoadedTagsState) {
                  _tags.addAll(state.tags.filter((element) =>
                      element.status == Tag_Status.PLACED &&
                      element.createdBy == user.email));
                }
                if (state is DeletedSuccessfulState) {
                  showSnackBar(
                    context,
                    AppLocalizations.of(context)!.tagRemovedMessage,
                  );
                }
                if (state is DeletedErrorState) {
                  _tags.insert(state.index, state.tag);
                  showSnackBar(
                    context,
                    AppLocalizations.of(context)!.tagNotRemovedMessage,
                  );
                }
                if (state is ErrorState) {
                  showSnackBar(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                return state is InitialState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
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
                                  onTap: () => setPage(0),
                                ),
                                ButtonBarEntry(
                                  child: Text(AppLocalizations.of(context)!
                                      .archiveTags),
                                  onTap: () => setPage(1),
                                ),
                              ],
                            ),
                          ),
                          SearchField(
                            SearchSpec(
                              searchValueBuilder: (i) =>
                                  _tags[i].compositeFilter.topic.title,
                              length: _tags.length,
                              itemBuilder: (context, i) {
                                return TagCardWidget(
                                  onDismissed: () =>
                                      deleteTag(bloc, _tags[i], i),
                                  tag: _tags[i],
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (value) =>
                                  _buttonController.setIndex(value),
                              children: [
                                UserTagsList(
                                  tags: _tags,
                                  tagsType: TagsType.actual,
                                  onDismissed: (tag, userId, index) =>
                                      deleteTag(bloc, tag, index),
                                ),
                                UserTagsList(
                                  tags: _tags,
                                  tagsType: TagsType.archive,
                                  onDismissed: (tag, userId, index) =>
                                      deleteTag(bloc, tag, index),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
              },
            ),
            DeeDeeMenuSlider(
              context,
              controller: _controller,
              user: user,
            ),
          ],
        ),
      ),
    );
  }

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void deleteTag(UserTagsBloc bloc, Tag tag, int index) {
    final user = BlocProvider.of<UserBloc>(context).state.user;
    bloc.add(DeleteTagEvent(tag: tag, userId: user.email, index: index));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
