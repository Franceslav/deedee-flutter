import 'package:auto_route/auto_route.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../generated/deedee/api/model/composite_filter.pb.dart';
import '../../injection.dart';
import '../../repository/composite_filter_repository.dart';
import '../page/favorite_composite_filters/composite_filter_bloc/composite_filter_bloc.dart';
import '../user_bloc/user_bloc.dart';

class DialogWidget extends StatefulWidget {
  final CompositeFilter compositeFilter;

  const DialogWidget({
    super.key,
    required this.compositeFilter,
  });

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final compositeFilterBloc = CompositeFilterBloc(
      locator.get<CompositeFilterRepository>(),
      user,
    );
    final screenHeight = MediaQuery.of(context).size.height;
    final dialogHeight = screenHeight * 0.2;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: dialogHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.saveFilter,
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 38,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                      hintText: AppLocalizations.of(context)!.filterTitle,
                      fillColor: const Color(TEXTFIELD_COLOR),
                      filled: true),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButtonWidget(
                      onPressed: () {
                        compositeFilterBloc.add(
                          CompositeFilterCreateEvent(
                            widget.compositeFilter
                              ..status = CompositeFilter_Status.FAVORITE
                              ..title = _controller.text,
                          ),
                        );
                        context.router.pop();
                        _controller.clear();
                      },
                      text: AppLocalizations.of(context)!.save,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
