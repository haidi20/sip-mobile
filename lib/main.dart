import 'package:flutter/material.dart';
import 'package:sip/custome_route.dart';
import 'package:sip/layouts/main_screen.dart';
import 'package:sip/layouts/not_found_screen.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const DashboardScreen(),
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'main') {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const MainScreen());
        } else if (settings.name == 'login') {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const LoginScreen());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const NotFoundScreen());
        }
      },
      initialRoute: "main",
    );
  }
}
