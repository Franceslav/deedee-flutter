import 'package:deedee/injection.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:deedee/ui/page/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

class AddToFavouritesClickableIcon extends StatefulWidget {
  final Int64 tagId;
  const AddToFavouritesClickableIcon({Key? key, required this.tagId}) : super(key: key);

  @override
  State<AddToFavouritesClickableIcon> createState() => _AddToFavouritesClickableIconState();
}

class _AddToFavouritesClickableIconState extends State<AddToFavouritesClickableIcon> {
  bool _wasTapped = false;

  void invertState() {
    setState(() { _wasTapped = !_wasTapped; });
  }

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/images/favorite_icon.png';
    if (_wasTapped) {
      assetName = 'assets/images/favorite_icon_filled.png';
    }

    return TextButton(
      onPressed: onTextButtonPress,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      child: Image.asset(assetName),
    );
  }

  void asyncInit() async {
    final TagRepository tagRepository = locator.get<TagRepository>();
    final user = BlocProvider.of<UserBloc>(context).state.user;
    final favouriteTags = await tagRepository.getFavoriteTags(user.userId);
    final tag = favouriteTags.firstWhereOrNull((tag) => tag.tagId == widget.tagId);
    setState(() {
      _wasTapped = tag != null;
    });
  }

  void onTextButtonPress() {
    final bookmarksBloc = BlocProvider.of<BookmarksBloc>(context);

    if (_wasTapped) {
      bookmarksBloc.add(UndoAddBookmarkEvent(tagId: widget.tagId));
    } else {
      bookmarksBloc.add(AddBookmarkEvent(tagId: widget.tagId));
    }

    invertState();
  }
}
