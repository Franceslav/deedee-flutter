import 'package:badges/badges.dart' as badges;
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/helper.dart';
import '../user_bloc/user_bloc.dart';

class ProfilePhotoWithBadge extends StatelessWidget {
  const ProfilePhotoWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    if (user.profilePictureURL == '') {
      return _addBadge(
        user,
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade400,
          child: ClipOval(
            child: Image.asset(
              'assets/images/placeholder.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return _addBadge(
        user,
        displayCircleImage(user.profilePictureURL ?? '', 80, false),
      );
    }
  }

  Widget _addBadge(User user, Widget child) {
    return badges.Badge(
      badgeContent: ((user.emailVerification ==
                      EmailVerificationStatus.unverified &&
                  user.docVerification == DocVerificationStatus.unverified) ||
              (user.emailVerification == EmailVerificationStatus.verified &&
                  user.docVerification == DocVerificationStatus.unverified) ||
              (user.emailVerification == EmailVerificationStatus.unverified &&
                  user.docVerification == DocVerificationStatus.verified))
          ? const Icon(
              CommunityMaterialIcons.help_circle,
              color: Colors.grey,
            )
          : user.emailVerification == EmailVerificationStatus.verified &&
                  user.docVerification == DocVerificationStatus.verified &&
                  user.premiumStatus == PremiumStatus.notPremium
              ? const Icon(
                  CommunityMaterialIcons.check_circle,
                  color: Colors.grey,
                )
              : user.emailVerification == EmailVerificationStatus.verified &&
                      user.docVerification == DocVerificationStatus.verified &&
                      user.premiumStatus == PremiumStatus.isPremium
                  ? const Icon(
                      CommunityMaterialIcons.star_circle_outline,
                      color: Colors.amber,
                    )
                  : null,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      position: badges.BadgePosition.custom(end: 0, bottom: 0),
      child: child,
    );
  }
}
