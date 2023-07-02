import 'package:flutter/material.dart';
import 'package:sip/modules/auth/loginScreen.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // functions

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        // Mobile layout
        return Column(
          children: [
            Container(
              // color: Colors.green,
              child: mainScreen(),
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
              child: Container(
                // color: Colors.green,
                child: mainScreen(),
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

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final rowHeightTop = screenHeight * 0.2; // Adjust the percentage as needed
    final rowHeightMiddle =
        screenHeight * 0.6; // Adjust the percentage as needed
    final rowHeightBootom =
        screenHeight * 0.2; // Adjust the percentage as needed

    return Container(
      // Your login screen UI implementation goes here
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: rowHeightTop,
                  // color: Colors.red,
                  child: const Center(
                    child: Text(
                      'header',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        decorationColor: Colors.blue,
                        decorationStyle: TextDecorationStyle.double,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: rowHeightMiddle,
                  // color: Colors.blue,
                  child: LoginScreen(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: rowHeightBootom,
                  // color: Colors.green,
                  child: const Center(
                    child: Text(
                      'bottom',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        decorationColor: Colors.blue,
                        decorationStyle: TextDecorationStyle.double,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
