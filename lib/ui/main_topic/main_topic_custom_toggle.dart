import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key, required this.padding});

  final double padding;

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

    return Center(
      child: Container(
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0X26767680),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: AnimatedAlign(
                alignment: Alignment(xAlign, 0),
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: width * 0.5 - widget.padding,
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
                        Radius.circular(7.0),
                      ),
                      border: Border.all(
                          width: 0.5,
                          color: Colors.black.withOpacity(0.04),
                          strokeAlign: BorderSide.strokeAlignOutside)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = loginAlign;
                });
              },
              child: Align(
                alignment: const Alignment(-1, 0),
                child: Container(
                  width: width * 0.5 - widget.padding,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.clientToggle,
                    style: style,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = signInAlign;
                });
              },
              child: Align(
                alignment: const Alignment(1, 0),
                child: Container(
                  width: width * 0.5 - widget.padding,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.providerToggle,
                    style: style,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
