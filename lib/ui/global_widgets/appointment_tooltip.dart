import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class AppointmentTooltipWidget extends StatefulWidget {
  const AppointmentTooltipWidget({super.key});

  @override
  State<AppointmentTooltipWidget> createState() =>
      _AppointmentTooltipWidgetState();
}

class _AppointmentTooltipWidgetState extends State<AppointmentTooltipWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 5)
                ]),
            width: size,
            height: size - 100,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Appointment is published',
                      style: style,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Waiting for confirmation \n     of you appointment',
                      style: style2,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 200,
                      height: 100,
                      child: const Image(
                        image: AssetImage('assets/images/Group.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // TODO: use BLoC
                        // bloc.add(
                        //   MapSlidingPanelRequestCreate(
                        //     widget._selectedTagId,
                        //   ),
                        // );
                      },
                      style: buttonStyle,
                      child: Text(
                        'Close',
                        style: style3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  fontFamily: 'Roboto',
);
TextStyle style2 = const TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black54,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);
TextStyle style3 = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18,
  color: Color(COLOR_PRIMARY),
  fontWeight: FontWeight.bold,
);

ButtonStyle buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(
    const EdgeInsets.only(
      left: 125,
      right: 125,
      top: 15,
      bottom: 15,
    ),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(
        color: Color(COLOR_PRIMARY),
      ),
    ),
  ),
);
