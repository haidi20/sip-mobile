import 'package:flutter/material.dart';
import 'package:sip/custome_route.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/dashboard/dashboard_screen.dart';
import 'package:sip/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'dashboard') {
          return MyHomePage<bool>(
              builder: (BuildContext context) => const Dashboard());
        } else {
          return MyHomePage<bool>(
              builder: (BuildContext context) => const LoginScreen());
        }
      },
      initialRoute: "dashboard",
    );
  }
}

class MyHomePage<T> extends MaterialPageRoute<T> {
  MyHomePage({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        // Mobile layout
        return Column(
          children: [
            MainScreen(
              child: child,
            ),
          ],
        );
      } else {
        // Larger screen layout
        return Row(
          children: [
            Expanded(
              flex: 12,
              child: Container(
                // color: Colors.blue,
                child: null,
              ),
            ),
            Expanded(
              flex: 12,
              child: MainScreen(
                child: child,
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                // color: Colors.blue,
                child: null,
              ),
            ),
          ],
        );
      }
    });
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final rowHeightTop = screenHeight * 0.2; // Adjust the percentage as needed
    // final rowHeightMiddle =
    //     screenHeight * 0.6; // Adjust the percentage as needed
    // final rowHeightBootom =
    //     screenHeight * 0.2; // Adjust the percentage as needed

    Widget appBar() {
      return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const RotatedBox(
              quarterTurns: 4,
              child: Text("icon"),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff8f8f8),
                        blurRadius: 10,
                        spreadRadius: 10),
                  ],
                ),
                child: const Text("icon user"),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
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
              child: child,
            ),

            // Footer (20% of the screen height)
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
