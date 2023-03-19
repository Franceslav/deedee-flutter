import 'package:deedee/constants.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class Calendar {
  Future<String?> showCalendar(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        int selectedIndex = 0;
        return Dialog(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.selectDate,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2200),
                      onDateChanged: (DateTime value) {}),
                  Text(AppLocalizations.of(context)!.selectTime,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 48,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: selectedIndex == index
                                    ? const LinearGradient(colors: [
                                        Color.fromARGB(132, 174, 108, 255),
                                        Color.fromARGB(136, 117, 42, 237)
                                      ])
                                    : const LinearGradient(colors: [
                                        Color.fromARGB(61, 174, 108, 255),
                                        Color.fromARGB(61, 117, 42, 237)
                                      ]),
                                border: Border.all(
                                    width: 1.2,
                                    color: const Color(GRADIENT_COLOR_END))),
                            child: Center(
                              child: Text(
                                DateFormat.jm().format(nearestHalf(
                                    DateTime.now()
                                        .add(Duration(minutes: 30 * index)))),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  DeeDeeButton(
                      title: AppLocalizations.of(context)!.book,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      gradientButton: true),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  DateTime nearestHalf(DateTime val) {
    return DateTime(val.year, val.month, val.day, val.hour,
        [30, 60][(val.minute / 30).floor()]);
  }
}
