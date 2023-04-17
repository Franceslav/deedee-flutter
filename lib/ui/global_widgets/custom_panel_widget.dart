import 'package:flutter/material.dart';

import '../page/account/account_info_widget.dart';
import '../page/map_cubit/map_screen.dart';
import 'adress_info_widget.dart';
import 'contacts_widget.dart';

class CustomPanelWidget extends StatefulWidget {
  final String selectedMessengerId;
  final bool openedFirstTime;

  const CustomPanelWidget({
    super.key,
    required String selectedMessengerId,
    required bool openedFirstTime,
  })  : selectedMessengerId = selectedMessengerId,
        openedFirstTime = openedFirstTime;

  @override
  State<CustomPanelWidget> createState() => _CustomPanelWidgetState();
}

class _CustomPanelWidgetState extends State<CustomPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.openedFirstTime
              ? []
              : [
                  const AccountInfoWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: ContactsWidget(widget: widget),
                  ),
                  const AddressInfoWidget(),
                ],
        ),
      ),
    );
  }
}
