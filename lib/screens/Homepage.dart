import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/screens/Mainpage.dart';
import 'package:navira/screens/Quailist.dart';
import 'package:navira/screens/Map.dart';
import 'package:navira/utils/myBehavior.dart';

class Homepage extends StatefulWidget {
  final int currentIndex;
  const Homepage({super.key, required this.currentIndex});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // current Page
  late int currentPageIndex;
  bool isShownBottomBar = true;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    // list of pages
    List<Widget> _pages = <Widget>[Mainpage(), Quailist(), Settings()];

    return ScrollConfiguration(
      behavior: BehaviorOfScroll(),
      child: Scaffold(
        drawer: Drawer(
          child: Center(child: Text('drawer')),
        ),
        backgroundColor: CustomColors.bgColor,
        body: _pages[currentPageIndex],
        bottomNavigationBar: Visibility(
          visible: isShownBottomBar,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.grey,
                width: 2.4,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.5),
                topRight: Radius.circular(24.5),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              child: SizedBox(
                height: 60,
                child: BottomNavigationBar(
                  backgroundColor: CustomColors.bgColor,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentPageIndex,
                  selectedItemColor: CustomColors.textPrimary,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.home_filled,
                        size: 22,
                        color: CustomColors.textPrimary,
                      ),
                      icon: Icon(
                        Icons.home_outlined,
                        size: 20,
                        color: CustomColors.textGrey,
                      ),
                      label: 'Home'
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.menu_rounded,
                        size: 22,
                        color: CustomColors.textPrimary,
                      ),
                      icon: Icon(Icons.menu_outlined,
                          size: 20, color: CustomColors.textGrey),
                      label: 'Menu'
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.map_rounded,
                          size: 22, color: CustomColors.textPrimary),
                      icon: Icon(Icons.map_outlined,
                          size: 20, color: CustomColors.textGrey),
                      label: 'Map'
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
