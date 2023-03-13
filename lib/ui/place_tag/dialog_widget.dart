import 'package:deedee/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogWidget extends StatefulWidget {

  const DialogWidget({super.key});

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
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final dialogHeight = screenHeight * 0.21;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 176,
          minWidth: 289,
        ),
        child: SizedBox(
          height: dialogHeight,
          width: dialogHeight * 1.642,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    AppLocalizations.of(context)!.saveFilter,
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
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1.0,
                                  color: Color(BASIC_GREY_COLOR),
                                  strokeAlign: BorderSide.strokeAlignInside),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                            _controller.clear();
                          },
                          child: Text(
                              AppLocalizations.of(context)!.cancel,
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(BASIC_GREY_COLOR))
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(GRADIENT_COLOR_START), Color(GRADIENT_COLOR_END)]),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 0,
                                color: Color(BASIC_GREY_COLOR),
                              ),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          onPressed: () {},
                          child: Text(
                              AppLocalizations.of(context)!.save,
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)
                              ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
