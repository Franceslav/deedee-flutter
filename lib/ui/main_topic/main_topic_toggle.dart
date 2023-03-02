import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTopicToggle extends StatelessWidget {
  final List<bool> isSelected;
  final void Function(int index)? onPressed;
  const MainTopicToggle({super.key, required this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0X26767680),
              border: Border.all(color: const Color(0X26767680)),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: ToggleButtons(
              isSelected: isSelected,
              selectedColor: Colors.black,
              color: Colors.black,
              fillColor: Colors.white,
              splashColor: const Color(0X0D767680),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              renderBorder: false,
              borderRadius: BorderRadius.circular(7),
              constraints: BoxConstraints.expand(width: constraints.maxWidth / 2 - 1),
              onPressed: onPressed,
              children: [
                Text(
                    AppLocalizations.of(context)!.clientToggle,
                    style: Theme.of(context).textTheme.button
                ),
                Text(
                    AppLocalizations.of(context)!.providerToggle,
                    style: Theme.of(context).textTheme.button
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
