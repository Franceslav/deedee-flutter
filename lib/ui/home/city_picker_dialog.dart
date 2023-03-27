import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/ui/home/city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CityPickerDialog extends StatefulWidget {
  final List<Place>? availableCities;
  final User user;
  final void Function(User user, Place city) onSave;

  const CityPickerDialog({
    super.key,
    required this.availableCities,
    required this.user,
    required this.onSave,
  });

  @override
  State<CityPickerDialog> createState() => _CityPickerDialogState();
}

class _CityPickerDialogState extends State<CityPickerDialog> {
  Place? _selectedCity;

  void setCity(Place city) {
    setState(() {
      _selectedCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.black54,
        ),
        Center(
          child: SizedBox(
            width: size.width * 0.7,
            height: size.height * 0.2,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CityPicker(
                    availableCities: widget.availableCities,
                    selectedCity: _selectedCity,
                    onChooseCity: (city) => setCity(city),
                  ),
                  TextButton(
                    onPressed: _selectedCity != null
                        ? () {
                            widget.onSave(widget.user, _selectedCity!);
                          }
                        : null,
                    child: Text(AppLocalizations.of(context)!.safe),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
