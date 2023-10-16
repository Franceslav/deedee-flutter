import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../services/helper.dart';
import '../routes/app_router.gr.dart';
import '../user_bloc/user_bloc.dart';

class ProfilePhotoWithBadge extends StatelessWidget {
  ProfilePhotoWithBadge(
      {super.key,
      required this.canChangePhoto,
      required this.radius,
      required this.fontSize});
  final bool canChangePhoto;
  final double radius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    if (user.profilePictureURL == '') {
      return _addBadge(
          user,
          InkWell(
            onTap: () {
              context.router.navigate(const AccountScreenRoute());
            },
            child: ProfilePicture(
              radius: radius,
              fontsize: fontSize,
              name: user.firstName,
            ),
          ));
    } else {
      return _addBadge(
        user,
        displayCircleImage(user.profilePictureURL ?? '', 80, false),
      );
    }
  }

  Widget _addBadge(
    User user,
    Widget child,
  ) {
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
              badgeContent: canChangePhoto
                  ? CircleAvatar(
                      backgroundColor: Color.fromRGBO(113, 113, 132, 1),
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16.5,
                        child: SvgPicture.asset(
                          'assets/images/svg_images/camera.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              badgeStyle: badgeStyle,
              position: badges.BadgePosition.custom(end: 0, bottom: 0),
              child: child,
            )
        };
      },
    );
  }
}
