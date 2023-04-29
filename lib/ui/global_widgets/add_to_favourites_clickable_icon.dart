import 'package:deedee/ui/page/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixnum/fixnum.dart';

class AddToFavouritesClickableIcon extends StatelessWidget {
  final Int64 tagId;
  const AddToFavouritesClickableIcon({Key? key, required this.tagId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BookmarksBloc, BookmarksState>(
      builder: (context, state)
      {
        if (state is TagMarkerOpenedState) {
          return _buildTextButton(context, state.isTagBookmarked);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildTextButton(BuildContext context, bool isTagBookmarked) {
    final bookmarksBloc = BlocProvider.of<BookmarksBloc>(context);
    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    if (isTagBookmarked) {
      return TextButton(
        onPressed: () {
          bookmarksBloc.add(UndoAddBookmarkEvent(tagId: tagId));
        },
        style: buttonStyle,
        child: Image.asset('assets/images/favorite_icon_filled.png'),
      );
    } else {
      return TextButton(
        onPressed: () {
          bookmarksBloc.add(AddBookmarkEvent(tagId: tagId));
        },
        style: buttonStyle,
        child: Image.asset('assets/images/favorite_icon.png'),
      );
    }
  }
}
