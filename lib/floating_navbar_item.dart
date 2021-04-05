import 'package:flutter/material.dart';

/// FloatingNavBarItem
///
/// [FloatingNavbarItem] Base class for the bottom navigation bar items
class FloatingNavBarItem {
  /// IconData to display on the navbar e.g. Icons.home
  IconData iconData;

  /// Title can used instead of the dot indicator
  String title;

  /// The page that corresponds to this item
  Widget page;
  FloatingNavBarItem({
    required this.iconData,
    required this.title,
    required this.page,
  });
}
