import 'package:flutter/cupertino.dart';

import 'search_bottom_sheet.dart';
import 'search_spec.dart';

class SearchField extends StatefulWidget {
  final SearchSpec spec;

  const SearchField(
    this.spec, {
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final _controller = TextEditingController(text: widget.spec.initQuery);
  final _textFocus = FocusNode();

  @override
  void didUpdateWidget(covariant SearchField oldWidget) {
    _controller.text = widget.spec.initQuery;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CupertinoSearchTextField(
        controller: _controller,
        focusNode: _textFocus,
        onChanged: (query) async {
          final result = await showSearchBottomSheet(
            context,
            spec: widget.spec.copyWith(initQuery: query),
          );
          _refreshField(result);
        },
        onTap: () async {
          _textFocus.unfocus();
          final result =
              await showSearchBottomSheet(context, spec: widget.spec);
          _refreshField(result);
        },
      ),
    );
  }

  void _refreshField(result) {
    if (result == null) return;
    _controller.text = result[1];
  }
}
