import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/constants.dart';
import 'package:sip/layouts/right_menu.dart';
import 'package:sip/layouts/master.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/home/view/home_screen.dart';
import 'package:sip/modules/profile/view/profile_screen.dart';
import 'package:sip/widgets/slide_right_route.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    debugPrint("initial data");

    BlocProvider.of<ProductBloc>(context).add(
      ProductFectData(),
    );

    super.initState();
  }

  int _selectedNavbar = 0;
  final screens = [
    const HomeScreen(),
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
    Navigator.push(context, SlideRightRoute(page: const HomeScreen()));
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  void dispose() {
    productBloc.close();
    super.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: screens[_selectedNavbar],
              ),
            ],
          ),
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