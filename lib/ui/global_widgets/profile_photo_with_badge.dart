import 'package:badges/badges.dart' as badges;
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final emailVerified =
        user.emailVerification == EmailVerificationStatus.verified;
    final docsVerified = user.docVerification == DocVerificationStatus.verified;
    final premiumStatus = user.premiumStatus == PremiumStatus.isPremium;

    const badgeStyle = badges.BadgeStyle(
      badgeColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
    );

    return Builder(
      builder: (context) {
        return switch ((emailVerified, docsVerified, premiumStatus)) {
          (true, true, true) => badges.Badge(
              badgeContent: const Icon(
                CommunityMaterialIcons.star_circle,
                color: Colors.amber,
              ),
              badgeStyle: badgeStyle,
              position: badges.BadgePosition.custom(end: 0, bottom: 0),
              child: child,
            ),
          (true, true, false) => badges.Badge(
              badgeContent: const Icon(
                CommunityMaterialIcons.check_circle,
                color: Colors.green,
              ),
              badgeStyle: badgeStyle,
              position: badges.BadgePosition.custom(end: 0, bottom: 0),
              child: child,
            ),
          (_, _, _) => badges.Badge(
              badgeContent: const Icon(
                CommunityMaterialIcons.help_circle,
                color: Colors.grey,
              ),
              badgeStyle: badgeStyle,
              position: badges.BadgePosition.custom(end: 0, bottom: 0),
              child: child,
            )
        };
      },
    );
  }
}
