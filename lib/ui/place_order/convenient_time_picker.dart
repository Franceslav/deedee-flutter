import 'package:deedee/model/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConvenientTimePicker extends StatefulWidget {
  final Order order;

  const ConvenientTimePicker({super.key, required this.order});

  @override
  State<ConvenientTimePicker> createState() => _ConvenientTimePickerState();
}

class _ConvenientTimePickerState extends State<ConvenientTimePicker> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    selectedValue = 'Daily';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.day,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(242, 242, 242, 1),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            value: selectedValue,
            items: widget.order.convenientTime!.keys
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            }),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.convenientTime,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pickTimeField(context, '08:00', (value) {
              widget.order.convenientTime![selectedValue]!.first = value!;
            }),
            const Text('—', style: TextStyle(fontSize: 25)),
            pickTimeField(context, '20:00', (value) {
              widget.order.convenientTime![selectedValue]!.last = value!;
            }),
          ],
        ),
      ],
    );
  }

  Widget pickTimeField(
    BuildContext context,
    String hint,
    void Function(String?)? onChanged,
  ) =>
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.40,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color.fromRGBO(242, 242, 242, 1),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      );
}
