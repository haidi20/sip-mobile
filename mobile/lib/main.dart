import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/custome_route.dart';
import 'package:sip/layouts/not_found_screen.dart';
import 'package:sip/modules/main_menu/view/main_menu.dart';
import 'package:sip/route.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  await dotenv.load(fileName: ".env.devel");

  // runApp(MainApp());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
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
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'main') {
          return CustomRoute<bool>(
            builder: (BuildContext context) => const MainMenu(),
          );
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const NotFoundScreen());
        }
      },
      initialRoute: "main",
    );
  }
}
