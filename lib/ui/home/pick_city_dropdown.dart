import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import '../../services/shared.dart';
import '../user_bloc/user_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickCityDropDown extends StatefulWidget {
  const PickCityDropDown({super.key});

  @override
  State<PickCityDropDown> createState() => _PickCityDropDownState();
}

class _PickCityDropDownState extends State<PickCityDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return FutureBuilder(
        future: locator.get<SharedUtils>().getUserPlace(),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            selectedValue = snapshot.data;
          }
          return user.availablePlaces == null
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 5),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.homeChooseCity,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: user.availablePlaces!
                        .map((item) => DropdownMenuItem<String>(
                              value: item.title,
                              child: Text(
                                item.title,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                      //TODO DEEMOB-94
                      locator.get<SharedUtils>().saveUserPlace(value as String);
                    },
                  ),
                );
        });
  }
}
