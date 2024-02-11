import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stoptheblues/main.dart';
import 'info_page.dart';
import 'providers/user_provider.dart';

class PageNavigator extends StatefulWidget {
  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  List<Widget> _buildScreens() {
    return [
      QuizPage(),
      InfoPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: Color(0xFF1185DE),
          icon: Icon(Icons.home),
          inactiveColorPrimary: Color(0xFF1185DE),
          title: ('Quiz'),
          textStyle: Theme.of(context).textTheme.labelMedium
        // activeColorPrimary: CupertinoColors.activeBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          activeColorPrimary: Color(0xFF1185DE),
          icon: Icon(Icons.handshake),
          inactiveColorPrimary: Color(0xFF1185DE),
          title: ('Pomoc'),
          textStyle: Theme.of(context).textTheme.labelMedium
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PersistentTabView(
      resizeToAvoidBottomInset: false,
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFFDDEAF3),
      decoration: NavBarDecoration(boxShadow: [
        BoxShadow(
          spreadRadius: 30,
          blurRadius: 50,
          color: Colors.black12,
        )
      ]),
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}