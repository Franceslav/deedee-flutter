import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double loginAlign = -1;
const double signInAlign = 1;

class _ToggleButtonState extends State<CustomToggleButton> {
  late double xAlign;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const style = TextStyle(
      fontFamily: 'Roboto',
      color: Color(0XFF1A1A1B),
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    return Container(
      height: 32,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0X26767680),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlignWidget(
            xAlign: xAlign,
            width: width,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = loginAlign;
              });
            },
            child: LeftAlignWidget(
              style: style,
              width: width,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = signInAlign;
              });
            },
            child: RightAlighWidget(
              style: style,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}

class RightAlighWidget extends StatelessWidget {
  const RightAlighWidget({
    super.key,
    required this.style,
    required this.width,
  });

  final TextStyle style;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(1, 0),
      child: Container(
        width: width / 4,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.providerToggle,
          style: style,
        ),
      ),
    );
  }
}

class LeftAlignWidget extends StatelessWidget {
  const LeftAlignWidget({
    super.key,
    required this.style,
    required this.width,
  });

  final TextStyle style;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: Row(
        children: [
          Container(
            width: width / 4,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.clientToggle,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedAlignWidget extends StatelessWidget {
  const AnimatedAlignWidget({
    super.key,
    required this.xAlign,
    required this.width,
  });

  final double xAlign;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedAlign(
        alignment: Alignment(xAlign, 0),
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: width / 3.5,
          height: 28,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
              border: Border.all(
                  width: 0.5,
                  color: Colors.black.withOpacity(0.04),
                  strokeAlign: BorderSide.strokeAlignOutside)),
        ),
      ),
    );
  }
}
