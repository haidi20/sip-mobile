import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sip/custome_route.dart';
import 'package:sip/layouts/default_screen.dart';
import 'package:sip/layouts/not_found_screen.dart';
import 'package:sip/route.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  await dotenv.load(fileName: ".env");

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
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFFEFF5F4),
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
              builder: (BuildContext context) => const DefaultScreen());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const NotFoundScreen());
        }
      },
      initialRoute: "main",
    );
  }
}
