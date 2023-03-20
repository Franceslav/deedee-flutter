// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:deedee/constants.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Button(
                    text: AppLocalizations.of(context)!.save,
                    onPress: () {
                      context.router.pop();
                      _controller.clear();
                    },
                  ),
                  _Button(
                    text: AppLocalizations.of(context)!.saveAndSubscribe,
                    onPress: () {
                      context.router.pop();
                      _controller.clear();
                    },
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

class _Button extends StatelessWidget {
  String text;
  void Function() onPress;
  _Button({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.045,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(GRADIENT_COLOR_START), Color(GRADIENT_COLOR_END)]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            text,
            style: AppTextTheme.labelLarge.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
