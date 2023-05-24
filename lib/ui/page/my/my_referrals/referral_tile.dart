import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/ui/page/my/my_referrals/referral_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReferralTile extends StatelessWidget {
  const ReferralTile({required this.referral, super.key});
  final Referral referral;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane:
          ActionPane(extentRatio: 0.2, motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: ((context) {
            context.read<ReferralCubit>().removeReferral(referral.referralId);
          }),
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          icon: Icons.delete,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(
                referral.email + (kDebugMode ? ' ${referral.referralId}' : '')),
            trailing: const Icon(Icons.chevron_right)),
      ),
    );
  }
}
