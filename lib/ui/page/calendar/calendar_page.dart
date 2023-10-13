import 'package:deedee/constants.dart';
import 'package:deedee/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../global_widgets/calendar_dialog.dart';
import '../../global_widgets/custom_drawer_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Select date and time'),
        shadowColor: Colors.grey.shade300,
        elevation: 3,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 70,
                    spreadRadius: 30)
              ]),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Center(
                    child: Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: dateTimeStyle,
                    ),
                  ),
                  Text(
                    'Timezone: Europe/Minsk +03 +03:00',
                    style: timeZoneStyle,
                  ),
                  const Divider(
                    color: Colors.black,
                    indent: 25,
                    endIndent: 25,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'No slots available',
                    style: slotStyle,
                  ),
                ],
              ),
            ),
          ),
          const CalendarDialog(),
          Positioned(
            bottom: 30,
            child: ElevatedButton(
              style: button,
              onPressed: () {},
              child: Text(
                'Next',
                style: dbuttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle dateTimeStyle = const TextStyle(
  fontSize: 22,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);
TextStyle slotStyle = const TextStyle(
  fontSize: 16,
  fontFamily: 'Roboto',
  color: Colors.grey,
);

TextStyle timeZoneStyle = const TextStyle(
  fontSize: 13,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
);
TextStyle dbuttonStyle = const TextStyle(
  fontSize: 18,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
ButtonStyle button = ButtonStyle(
  padding: MaterialStateProperty.all(
      const EdgeInsets.only(left: 150, right: 150, top: 15, bottom: 15)),
  backgroundColor:
      const MaterialStatePropertyAll(Color.fromRGBO(207, 181, 249, 1)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);
