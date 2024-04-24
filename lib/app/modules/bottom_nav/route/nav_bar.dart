import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeGreen,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.heart),
                title: ("favorite"),
                activeColorPrimary: CupertinoColors.activeGreen,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.cart),
                title: ("Cart"),
                activeColorPrimary: CupertinoColors.activeGreen,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                title: ("Profile"),
                activeColorPrimary: CupertinoColors.activeGreen,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }