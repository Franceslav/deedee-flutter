import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class SelectorItem extends StatefulWidget {
  final String title;
  final void Function(String title) onTap;
  final bool isSelected;

  const SelectorItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<SelectorItem> createState() => _SelectorItemState();
}

class _SelectorItemState extends State<SelectorItem>
    with TickerProviderStateMixin {
  final GlobalKey _commonContainerKey = GlobalKey(debugLabel: 'SelectorItem');

  late AnimationController _controller;
  late Animation<double> _rightPaddingAnimation;
  late Animation<double> _leftPaddingAnimation;
  late Animation<double> _dotHeightAnimation;
  late Animation<double> _closeImageAnimation;
  late Animation<double> _dotLeftPositionAnimation;
  late Animation<double> _dotTopPositionAnimation;
  late Animation<Color?> _textColorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              widget.onTap(widget.title);
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
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
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400),
                        child: const Icon(
                          Icons.close,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      animation: _controller,
    );
  }

  @override
  void initState() {
    super.initState();
    //
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

  @override
  void didUpdateWidget(covariant SelectorItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (filterAnimationStatus) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  bool get filterAnimationStatus {
    var status = _controller.status;
    return status == AnimationStatus.completed;
  }

  Animation<double> getDotWidthAnimation() {
    var width = 20.0;
    if (_commonContainerKey.currentContext != null) {
      final RenderBox renderBox =
          _commonContainerKey.currentContext!.findRenderObject() as RenderBox;
      width = renderBox.size.width;
    }
    return Tween(begin: 20.0, end: width).animate(_controller);
  }
}
