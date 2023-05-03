import 'package:auto_route/auto_route.dart';
import 'package:deedee/ui/routes/app_router.gr.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

import '../page/account/account_info_widget.dart';
import '../page/map_cubit/map_screen.dart';

class CustomPanelWidget extends StatefulWidget {
  final String selectedMessengerId;
  final Int64 selectedTagId;
  final bool _openedFirstTime;
  final Int64 selectedCreatorId;

  const CustomPanelWidget({
    super.key,
    required String selectedMessengerId,
    required Int64 selectedTagId,
    required bool openedFirstTime,
    required this.selectedCreatorId,
  })  : selectedMessengerId = selectedMessengerId,
        selectedTagId = selectedTagId,
        _openedFirstTime = openedFirstTime;

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
          children: widget._openedFirstTime
              ? []
              : [
                  GestureDetector(
                    onTap: () {
                      context.router.popAndPush(AccountSupplierScreenRoute(
                          selectedCreatorId: widget.selectedCreatorId));
                    },
                    child: const AccountInfoWidget(),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 24),
                  //   child: ContactsWidget(
                  //       widget: widget,
                  //       tagId: widget.selectedTagId,
                  //       userId: widget.selectedMessengerId),
                  // ),
                  // AddressInfoWidget(
                  //   selectedTagId: widget.selectedTagId,
                  // ),
                ],
        ),
      ),
    );
  }
}
