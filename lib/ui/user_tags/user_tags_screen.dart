import 'package:deedee/generated/TagService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/global_widgets/dee_dee_menu_slider.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:deedee/ui/user_tags/bloc/user_tags_bloc.dart';
import 'package:deedee/ui/user_tags/user_tags_list.dart';
import 'package:flutter/material.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserTagsScreen extends StatefulWidget {
  const UserTagsScreen({super.key});

  @override
  State<UserTagsScreen> createState() => _UserTagsScreenState();
}

class _UserTagsScreenState extends State<UserTagsScreen> {
  final PanelController _controller = PanelController();
  final AnimatedButtonController _buttonController = AnimatedButtonController();
  List<Tag> _tags = [];
  late final User _user;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _user = BlocProvider.of<UserBloc>(context).state.user;
    BlocProvider.of<UserTagsBloc>(context)
        .add(LoadTagsEvent(userId: _user.userId));
    _pageController = PageController();
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
          BlocConsumer<UserTagsBloc, UserTagsState>(
            listener: (context, state) {
              if (state is LoadedTagsState) {
                _tags = state.tags;
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
                                onTap: () => setPage(0),
                              ),
                              ButtonBarEntry(
                                child: Text(
                                    AppLocalizations.of(context)!.archiveTags),
                                onTap: () => setPage(1),
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
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (value) =>
                                _buttonController.setIndex(value),
                            children: [
                              UserTagsList(
                                tags: _tags,
                                tagsType: TagsType.actual,
                                onDismissed: (tag, userId, index) =>
                                    deleteTag(tag, userId, index),
                              ),
                              UserTagsList(
                                tags: _tags,
                                tagsType: TagsType.archive,
                                onDismissed: (tag, userId, index) =>
                                    deleteTag(tag, userId, index),
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
    );
  }

  void setPage(int indexPage) {
    _pageController.animateToPage(
      indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void deleteTag(Tag tag, String userId, int index) {
    setState(() {
      _tags.remove(tag);
    });
    BlocProvider.of<UserTagsBloc>(context)
        .add(DeleteTagEvent(tag: tag, userId: userId, index: index));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
