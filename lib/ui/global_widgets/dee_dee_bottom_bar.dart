import 'package:deedee/ui/page/filter/filter_page.dart';
import 'package:deedee/ui/page/home/home_screen.dart';
import 'package:deedee/ui/user_tags/user_tags_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DeeDeeBottomBar extends StatelessWidget {
  DeeDeeBottomBar({super.key});
  List<String> listIcon = [
    // TODO: only single accepted, otherwise error
    'serch_icon_.png',
  ];
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 84,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
            ]),
        child: listIcon.length == 1
            ? Center(
                child: Stack(
                children: [
                  Container(
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(189, 135, 255, 0.2),
                          blurRadius: 15,
                          spreadRadius: 6)
                    ]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/search_icon_.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ))
            : PersistentTabView(
                context,
                controller: _controller,
                screens: const [HomeScreen(), UserTagsScreen()],
                items: [
                  PersistentBottomNavBarItem(
                    icon: Image.asset(
                      'assets/images/search_icon_.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  PersistentBottomNavBarItem(
                    icon: Image.asset(
                      'assets/images/search_icon_.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
                confineInSafeArea: true,
                backgroundColor: Colors.white,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                hideNavigationBarWhenKeyboardShows: true,
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  colorBehindNavBar: Colors.white,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style1,
              ));
  }
}
