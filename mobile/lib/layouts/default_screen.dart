import 'package:flutter/material.dart';
import 'package:sip/constants.dart';
import 'package:sip/layouts/right_menu.dart';
import 'package:sip/layouts/master.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/main_menu/views/main_menu_screen.dart';
import 'package:sip/modules/profile/profile_screen.dart';
import 'package:sip/widgets/slide_right_route.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedNavbar = 0;
  final screens = [
    const MainMenuScreen(),
    const ProfileScreen(),
  ];

  void onGotoLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }

  void onGotoDashboard() {
    Navigator.push(context, SlideRightRoute(page: const MainMenuScreen()));
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 27,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.only(top: 8),
          child: const Icon(
            Icons.person,
            size: 27,
          ),
        ),
        label: "Profile",
      ),
    ];

    return Master(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0, // Set elevation to 0 to remove shadow
          backgroundColor:
              Colors.transparent, // Set transparent background color
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  padding: const EdgeInsets.only(right: paddingRightGenerale),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ],
          // title: const Text('Your App Name'),
        ),
        endDrawer: const RightMenu(),
        body: SafeArea(
          child: screens[_selectedNavbar],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: _selectedNavbar,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _changeSelectedNavBar,
        ),
      ),
    );
  }
}
