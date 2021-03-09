library floating_navbar;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingNavBar extends StatefulWidget {
  /// FloatingNavBar
  ///
  /// [FloatingNavbar] is a simple navigation bar that floats on top of pages at the bottom
  int index;
  List<Widget> pages;
  List<Icon> icons;
  Color color;

  FloatingNavBar(
      {Key key,
      this.index = 0,
      @required this.pages,
      @required this.color,
      @required this.icons});

  @override
  _FloatingNavBarState createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  @override

  /// Returns a scaffold widget that will contain the pages and the navigation bar
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            widget.pages[widget.index],
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 15.0,
                    color: widget.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _widgetsBuilder(widget.icons),
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
  Widget _floatingNavBarItem(Icon icon, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _changePage(index),
          child: icon,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.index == index ? Colors.white : Colors.transparent,
          ),
        ),
      ],
    );
  }

  /// [_widgetsBuilder] adds widgets from [_floatingNavBarItem] into a List<Widget> and returns the list
  List<Widget> _widgetsBuilder(List<Icon> icons) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < icons.length; i++) {
      Widget item = this._floatingNavBarItem(icons[i], i);
      _floatingNavBarItems.add(item);
    }
    return _floatingNavBarItems;
  }

  /// [_changePage] changes selected page index so as to change the page being currently viewed by the user
  _changePage(index) {
    setState(() {
      widget.index = index;
    });
  }
}
