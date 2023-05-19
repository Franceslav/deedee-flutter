import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/page/my_referrals/referral_tile.dart';
import 'package:flutter/material.dart';

class ReferralListWidget extends StatelessWidget {
  const ReferralListWidget(
      {required this.referrals, required this.refType, super.key});

  final List<Referral> referrals;
  final Referral_Status refType;

  @override
  Widget build(BuildContext context) {
    var filteredRefs = referrals.where((element) => true).toList();
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) =>
          ReferralTile(referral: filteredRefs[index]),
      itemCount: filteredRefs.length,
      separatorBuilder: (_, __) => const DeeDeeDeviderWidget(),
    );
  }
}
