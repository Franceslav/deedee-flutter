// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartx/dartx.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:deedee/constants.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key});

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime date = DateTime(2000);
  DateTime time = DateTime(2000);
  int duration = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (date == DateTime(2000))
                    ? const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            if (duration != 0) {
                              duration = 0;
                              return;
                            }
                            if (time != DateTime(2000)) {
                              selectedIndex = 0;
                              time = DateTime(2000);
                              return;
                            }
                            if (date != DateTime(2000)) {
                              date = DateTime(2000);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.grey,
                        )),
                (date == DateTime(2000))
                    ? _Text(
                        text: locale.selectDate,
                      )
                    : (time == DateTime(2000))
                        ? _Text(
                            text: locale.selectStartTime,
                          )
                        : (duration == 0)
                            ? _Text(
                                text: locale.selectDuration,
                              )
                            : _Text(
                                text: locale.confirmSelection,
                              ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        date = DateTime(2000);
                        time = DateTime(2000);
                        selectedIndex = 0;
                        duration = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ))
              ],
            ),
            (date == DateTime(2000))
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.43,
                    child: CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2200),
                        onDateChanged: (DateTime value) {
                          setState(() {
                            if (value < DateTime.now()) {
                            } else {
                              date = value;
                            }
                          });
                        }),
                  )
                : (time == DateTime(2000))
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.43,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: 48,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    time = nearestHalf(DateTime.now().add(
                                        Duration(minutes: 30 * selectedIndex)));
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(colors: [
                                              Color.fromARGB(
                                                  132, 174, 108, 255),
                                              Color.fromARGB(136, 117, 42, 237)
                                            ])
                                          : const LinearGradient(colors: [
                                              Color.fromARGB(61, 174, 108, 255),
                                              Color.fromARGB(61, 117, 42, 237)
                                            ]),
                                      border: Border.all(
                                          width: 1.2,
                                          color:
                                              const Color(GRADIENT_COLOR_END))),
                                  child: Center(
                                    child: Text(
                                      DateFormat.Hm().format(nearestHalf(
                                          DateTime.now().add(
                                              Duration(minutes: 30 * index)))),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : (duration == 0)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.43,
                            child: Expanded(
                              child: SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                    size: MediaQuery.of(context).size.height *
                                        0.3,
                                    customColors: CustomSliderColors(
                                        progressBarColors: const [
                                          Color(GRADIENT_COLOR_END),
                                          Color(GRADIENT_COLOR_START)
                                        ]),
                                    infoProperties: InfoProperties(
                                      modifier: (double value) {
                                        String screenDuration =
                                            value.ceil().toInt().toString();
                                        return '$screenDuration ${locale.hoursLabel}';
                                      },
                                    )),
                                min: 0,
                                max: 24,
                                initialValue: 1,
                                onChangeEnd: (double endValue) async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  duration = endValue.ceil().toInt();
                                  setState(() {});
                                },
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                  '${locale.beginning}: ${DateFormat.yMd().format(date)} ${locale.inPreposition} ${DateFormat.Hm().format(time)}'),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015),
                              Text(
                                  '${locale.finish}: ${DateFormat.yMd().format(date.add(Duration(hours: time.hour + duration)))} ${locale.inPreposition} ${DateFormat.Hm().format(time.add(Duration(hours: duration)))}'),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015),
                              Text(
                                  '${locale.duration}: $duration ${locale.hoursLabel}'),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    OutlinedButtonWidget(
                                      text: locale.reset,
                                      onPressed: () {
                                        setState(() {
                                          date = DateTime(2000);
                                          time = DateTime(2000);
                                          selectedIndex = 0;
                                          duration = 0;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 16),
                                    OutlinedButtonWidget(
                                      text: locale.apply,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
          ],
        ),
      ),
    );
  }

  DateTime nearestHalf(DateTime val) {
    return DateTime(val.year, val.month, val.day, val.hour,
        [30, 60][(val.minute / 30).floor()]);
  }
}

class _Text extends StatelessWidget {
  String text;
  _Text({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(text,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
