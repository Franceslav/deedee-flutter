import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../services/helper.dart';

class ProfilePhotoWithBadge extends StatelessWidget {
  final User user;

  const ProfilePhotoWithBadge({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    if (user.profilePictureURL == '') {
      return addBadge(
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
      return addBadge(
        displayCircleImage(user.profilePictureURL, 80, false),
      );
    }
  }

  badges.Badge addBadge(Widget child) {
    return badges.Badge(
        badgeContent: !user.isVerified && !user.isPremium
            ? const Icon(
                CommunityMaterialIcons.help_circle,
                color: Colors.grey,
              )
            : user.isVerified && !user.isPremium
                ? const Icon(
                    CommunityMaterialIcons.check_circle,
                    color: Colors.grey,
                  )
                : user.isVerified && user.isPremium
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
        child: child);
  }
}
