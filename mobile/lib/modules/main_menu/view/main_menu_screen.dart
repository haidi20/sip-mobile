import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/utils/constants.dart';
import 'package:sip/layouts/right_menu.dart';
import 'package:sip/layouts/defaullt_screen.dart';
import 'package:sip/modules/auth/screens/login_screen.dart';
import 'package:sip/modules/home/screens/home_screen.dart';
import 'package:sip/modules/profile/screens/profile_screen.dart';
import 'package:sip/widgets/slide_right_route.dart';

class MainMenuScreen extends StatefulWidget {
  MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  void initState() {
    // debugPrint("initial data");

    BlocProvider.of<ProductBloc>(context).add(
      ProductFectData(),
    );

    super.initState();
  }

  int _selectedNavbar = 0;
  final screens = [
    HomeScreen(),
    const ProfileScreen(),
  ];

  void onGotoLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      ),
    );
  }

  void onGotoDashboard() {
    Navigator.push(context, SlideRightRoute(page: HomeScreen()));
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  void dispose() {
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

    return DefaultScreen(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0, // Set elevation to 0 to remove shadow
          backgroundColor:
              Colors.transparent, // Set transparent background color
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  padding:
                      const EdgeInsets.only(right: paddingRightLeftGenerale),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
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
        endDrawer: RightMenu(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle button press
            debugPrint('Floating Action Button pressed');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
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
