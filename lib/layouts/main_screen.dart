import 'package:flutter/material.dart';
import 'package:sip/layouts/master.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/dashboard/dashboard_screen.dart';
import 'package:sip/modules/user/user_screen.dart';
import 'package:sip/widgets/slide_right_route.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;
  final screens = [
    const DashboardScreen(),
    const UserScreen(),
  ];

  // _MainScreenState() {
  //   setState(() {
  //     _selectedNavbar = 0;
  //   });
  // }

  void onGotoLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }

  void onGotoDashboard() {
    Navigator.push(context, SlideRightRoute(page: const DashboardScreen()));
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });

    // if (index == 0) {
    //   onGotoDashboard();
    // } else {
    //   onGotoLogin();
    // }
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: onGotoLogin,
            ),
          ],
        ),
      );
    }

    return Master(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Header (20% of the screen height)
              Expanded(
                flex: 1,
                child: appBar(),
              ),

              // Body (60% of the screen height)
              Expanded(
                flex: 6,
                child: screens[_selectedNavbar],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "akun",
            ),
          ],
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
