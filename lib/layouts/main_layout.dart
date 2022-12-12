import 'package:book_app/helpers/app_colors.dart';
import 'package:book_app/helpers/app_sizes.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:book_app/screens/discover_screen.dart';
import 'package:book_app/screens/genrnes_screen.dart';
import 'package:book_app/screens/me_screen.dart';
import 'package:book_app/screens/rating_screen.dart';
import 'package:book_app/screens/testdata_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentScreen = 0;
  List<Widget> childScreens = const <Widget>[
    DiscoverScreen(),
    RatingScreen(),
    GernesScreen(),
    MeScreen(),
    TestScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
          // backgroundColor: Colors.white,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          tabMargin: genEdgeInsets([5, 5, 3]),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: _currentScreen == 1
              ? Colors.yellow[100]!
              : _currentScreen == 3
                  ? Colors.blue[100]!
                  : AppColors.primary!,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.book,
              text: 'Khám phá',
            ),
            GButton(
              icon: LineIcons.star,
              text: 'Xếp hạng',
            ),
            GButton(
              icon: LineIcons.typo3,
              text: 'Thể loại',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Tôi',
            ),
            // GButton(
            //   icon: LineIcons.democrat,
            //   text: 'test',
            // ),
          ],
          selectedIndex: _currentScreen,
          onTabChange: (index) {
            setState(() {
              _currentScreen = index;
            });
          },
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: AppColors.primary,
        //   selectedItemColor: Colors.white,
        //   currentIndex: _currentScreen,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (int index) {
        //     setState(() {
        //       _currentScreen = index;
        //     });
        //   },
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.book_sharp), label: "Disvocer"),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.library_books),
        //       label: "Genres",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.account_box),
        //       label: "My account",
        //     ),
        //   ],
        // ),
        // body: Stack(
        //   children: List<Widget>.generate(initWidget.length, (int index) {
        //     return Navigator(onGenerateRoute: (settings) {
        //       return MaterialPageRoute(builder: (_) => initWidget[index]);
        //     });
        //   }),
        // ),
        body: SizedBox(
          // color: Colors.red,
          width: AppSizes.deviceSize(context).width,
          child: childScreens[_currentScreen],
        ));
  }
}
