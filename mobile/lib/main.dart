import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/custome_route.dart';
import 'package:sip/layouts/not_found_screen.dart';
import 'package:sip/modules/auth/screens/login_screen.dart';
import 'package:sip/modules/main_menu/view/main_menu_screen.dart';
import 'package:sip/route.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  // await dotenv.load(fileName: ".env.devel");
  await dotenv.load();

  // runApp(MainApp());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
      ),
      BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIP',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(context),
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'main') {
          return CustomRoute<bool>(
            builder: (BuildContext context) => MainMenuScreen(),
          );
        } else if (settings.name == 'login') {
          return CustomRoute<bool>(
            builder: (BuildContext context) => LoginScreen(),
          );
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const NotFoundScreen());
        }
      },
      initialRoute: "login",
    );
  }

  ThemeData getThemeData(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 600) {
      // Web platform
      return ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
    } else {
      // Mobile platform
      return ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFFEFF5F4),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
    }
  }
}
