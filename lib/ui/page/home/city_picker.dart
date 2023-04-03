import 'package:deedee/generated/LocationService.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CityPicker extends StatefulWidget {
  final Place? selectedCity;
  final List<Place>? availableCities;
  final User? user;
  final Function(Place place)? onChooseCity;
  final void Function(User user, Place city)? onChangeCity;

  const CityPicker({
    super.key,
    this.selectedCity,
    this.availableCities,
    this.onChooseCity,
    this.onChangeCity,
    this.user,
  });

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  Place? _selectedCity;

  @override
  void initState() {
    super.initState();
    _selectedCity = widget.selectedCity;
  }

  void _handleCityChange(String? pickedCity) {
    final city =
        widget.availableCities!.firstWhere((city) => city.title == pickedCity);
    if (widget.onChooseCity != null) {
      widget.onChooseCity!(city);
    }
    if (widget.onChangeCity != null && widget.user != null) {
      widget.onChangeCity!(widget.user!, city);
    }
    setState(() {
      _selectedCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.availableCities == null) {
      return const Text('No cities are available');
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
          items: widget.availableCities!
              .map((item) => DropdownMenuItem<String>(
                    value: item.title,
                    child: Text(
                      item.title,
                    ),
                  ))
              .toList(),
          value: _selectedCity?.title,
          onChanged: _handleCityChange,
        ),
      );
    }
  }
}
