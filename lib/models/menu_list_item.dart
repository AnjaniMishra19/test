import 'package:flutter/material.dart';
import 'package:sahash/models/menu_item.dart';

class MenuListItem {
  static const List<MenuItem> itemFirst = [
    itemSettings,
    itemShare,
  ];

  static const List<MenuItem> itemSecond = [
    itemSignOut,
  ];

  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );

  static const itemShare = MenuItem(
    text: 'Share',
    icon: Icons.share,
  );

  static const itemSignOut = MenuItem(
    text: 'Sign Out',
    icon: Icons.logout,
  );
}
