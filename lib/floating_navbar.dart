library floating_navbar;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FloatingNavBar extends StatefulWidget {
  /// FloatingNavBar
  ///
  /// [FloatingNavbar] is a simple navigation bar that floats on top of pages at the bottom
  int index;
  List<Widget> pages;
  List<Widget> icons;
  Color color;
  Color iconColor;
  double horizontalPadding;
  bool hapticFeedback;
  double borderRadius;
  double cardWidth;

  FloatingNavBar({
    Key key,
    this.index = 0,
    this.borderRadius,
    this.cardWidth,
    @required this.horizontalPadding,
    @required this.pages,
    @required this.color,
    @required this.icons,
    @required this.iconColor,
    @required this.hapticFeedback,
  });

  @override
  _FloatingNavBarState createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  PageController _pageController = PageController();

  /// Returns a scaffold widget that will contain the pages and the navigation bar
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: widget.pages,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: widget.horizontalPadding,
                ),
                child: Container(
                  height: 70,
                  width: widget.cardWidth ?? MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 15.0,
                    color: widget.color,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _widgetsBuilder(widget.icons, widget.iconColor,
                          widget.hapticFeedback),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [_floatingNavBarItem] will build and return a [FloatingNavBar] item widget
  Widget _floatingNavBarItem(
      Widget icon, int index, Color color, bool hapticFeedback) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (hapticFeedback == true) {
              HapticFeedback.mediumImpact();
            }
            _changePage(index);
          },
          child: Container(
            padding: EdgeInsets.all(6),
            width: 50,
            child: icon,
          ),
        ),
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.index == index ? color : Colors.transparent,
          ),
        ),
      ],
    );
  }

  /// [_widgetsBuilder] adds widgets from [_floatingNavBarItem] into a List<Widget> and returns the list
  List<Widget> _widgetsBuilder(
      List<Widget> icons, Color color, bool hapticFeedback) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < icons.length; i++) {
      Widget item =
          this._floatingNavBarItem(icons[i], i, color, hapticFeedback);
      _floatingNavBarItems.add(item);
    }
    return _floatingNavBarItems;
  }

  /// [_changePage] changes selected page index so as to change the page being currently viewed by the user
  _changePage(index) {
    _pageController.jumpToPage(index);
    setState(() {
      widget.index = index;
    });
  }
}
