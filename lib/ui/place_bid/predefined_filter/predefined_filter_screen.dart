import 'package:deedee/constants.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/ui/place_bid/place_tag_filter_box/filter_box_bloc.dart';
import 'package:deedee/ui/place_bid/predefined_filter/predefined_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredefinedFilter extends StatefulWidget {
  final User user;
  final String title;

  const PredefinedFilter({Key? key, required this.user, required this.title})
      : super(key: key);

  @override
  _PredefinedFilterState createState() => _PredefinedFilterState();
}

class _PredefinedFilterState extends State<PredefinedFilter>
    with TickerProviderStateMixin {
  final GlobalKey _commonContainerKey =
      GlobalKey(debugLabel: 'PredefinedFilter');

  late AnimationController _controller;
  late Animation<double> _rightPaddingAnimation;
  late Animation<double> _leftPaddingAnimation;
  late Animation<double> _dotHeightAnimation;
  late Animation<double> _closeImageAnimation;
  late Animation<double> _dotLeftPositionAnimation;
  late Animation<double> _dotTopPositionAnimation;
  late Animation<Color?> _textColorAnimation;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _rightPaddingAnimation = Tween(begin: 20.0, end: 40.0).animate(_controller);
    _leftPaddingAnimation = Tween(begin: 40.0, end: 20.0).animate(_controller);
    _dotHeightAnimation = Tween(begin: 20.0, end: 40.0).animate(_controller);
    _closeImageAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _dotLeftPositionAnimation =
        Tween(begin: 10.0, end: 0.0).animate(_controller);
    _dotTopPositionAnimation = Tween(begin: 8.0, end: 0.0).animate(_controller);
    _textColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get filterAnimationStatus {
    var status = _controller.status;
    print("status$status");
    return status == AnimationStatus.completed;
  }

  Animation<double> getDotWidthAnimation() {
    var width = 20.0;
    if (_commonContainerKey.currentContext != null) {
      final RenderBox renderBox =
          _commonContainerKey.currentContext!.findRenderObject() as RenderBox;
      width = renderBox.size.width;
    }
    print("width$width");

    return Tween(begin: 20.0, end: width).animate(_controller);
  }

  Widget getWidgetBuilder(BuildContext context, Widget? _widget) {
    return InkWell(
      onTap: () {
        isChecked = !isChecked;
        if (filterAnimationStatus) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        // widget.filterMap.update(widget.title, (value) => isChecked);
        context
            .read<PredefinedFilterBloc>()
            .add(PredefinedFilterChangedEvent(widget.title, isChecked));
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black26, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Stack(
          key: _commonContainerKey,
          children: <Widget>[
            Positioned(
              left: _dotLeftPositionAnimation.value,
              top: _dotTopPositionAnimation.value,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: _dotHeightAnimation.value,
                  width: getDotWidthAnimation().value,
                  decoration: const BoxDecoration(
                      color: Color(COLOR_PRIMARY),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      shape: BoxShape.rectangle),
                ),
              ),
            ),
            Align(
              widthFactor: 1,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(
                    left: _leftPaddingAnimation.value,
                    right: _rightPaddingAnimation.value),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16.0, color: _textColorAnimation.value),
                ),
              ),
            ),
            Positioned(
              right: 5.0,
              top: 7.0,
              child: ScaleTransition(
                scale: _closeImageAnimation,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.close,
                    size: 20.0,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PredefinedFilterBloc>(
      create: (context) => PredefinedFilterBloc(),
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<PredefinedFilterBloc, PredefinedFilterState>(
                listener: (context, state) {
                  if (state is PredefinedFilterChangedState) {
                    context.read<FilterBoxBloc>().add(
                        FilterBoxChangeEvent(state.title, state.isChecked));
                  }
                },
              ),
              BlocListener<FilterBoxBloc, FilterBoxState>(
                listener: (context, state) {
                  if (state is FilterBoxFilteredTagsReceivedState) {}
                },
              ),
            ],
            child: AnimatedBuilder(
              builder: getWidgetBuilder,
              animation: _controller,
            ),
          );
        },
      ),
    );
  }
}
