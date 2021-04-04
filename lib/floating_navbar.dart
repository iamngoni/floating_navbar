library floating_navbar;

import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FloatingNavBar extends StatefulWidget {
  /// FloatingNavBar
  ///
  /// [FloatingNavbar] is a simple and clean bottom navigation bar
  int index;
  List<FloatingNavBarItem> items;
  Color color;
  Color unselectedIconColor;
  Color selectedIconColor;
  double horizontalPadding;
  bool hapticFeedback;
  double borderRadius;
  double cardWidth;
  bool showTitle;
  // bool hideOnScroll;
  // ScrollController scrollController;

  FloatingNavBar({
    Key key,
    this.index = 0,
    this.borderRadius,
    this.cardWidth,
    // this.hideOnScroll = false,
    // this.scrollController,
    this.showTitle = false,
    this.selectedIconColor = Colors.white,
    this.unselectedIconColor = Colors.white,
    @required this.horizontalPadding,
    @required this.items,
    @required this.color,
    @required this.hapticFeedback,
  });

  @override
  _FloatingNavBarState createState() {
    // if (this.hideOnScroll && this.scrollController == null) {
    //   throw Exception('Hide On Scroll Set To True: Missing scroll controller!');
    // }
    return _FloatingNavBarState();
  }
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  PageController _pageController = PageController();

  // @override
  // initState() {
  //   super.initState();
  //   if (widget.hideOnScroll) {
  //     widget.scrollController
  //       ..addListener(() {
  //         print(widget.scrollController.position);
  //       });
  //   }
  // }

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
              children: widget.items.map((item) => item.page).toList(),
              onPageChanged: (index) => this._changePage(index),
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
                      children:
                          _widgetsBuilder(widget.items, widget.hapticFeedback),
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
      FloatingNavBarItem item, int index, bool hapticFeedback) {
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
            child: Icon(
              item.iconData,
              color: widget.index == index
                  ? widget.selectedIconColor
                  : widget.unselectedIconColor,
            ),
          ),
        ),
        widget.showTitle
            ? AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                child: widget.index == index
                    ? Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 15,
                          color: widget.index == index
                              ? widget.selectedIconColor
                              : Colors.transparent,
                        ),
                      )
                    : SizedBox.shrink(),
              )
            : Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.index == index
                      ? widget.selectedIconColor
                      : Colors.transparent,
                ),
              ),
      ],
    );
  }

  /// [_widgetsBuilder] adds widgets from [_floatingNavBarItem] into a List<Widget> and returns the list
  List<Widget> _widgetsBuilder(
      List<FloatingNavBarItem> items, bool hapticFeedback) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = this._floatingNavBarItem(items[i], i, hapticFeedback);
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
