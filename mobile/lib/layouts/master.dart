import 'package:flutter/material.dart';

class Master extends StatelessWidget {
  const Master({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return child;
        } else {
          // Larger screen layout
          return LargeScreenLayout(child: child);
        }
      },
    );
  }
}

class LargeScreenLayout extends StatelessWidget {
  const LargeScreenLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 40,
          child: Container(
              // Add any additional widgets or effects you want for the left part
              // color: Colors.blue,
              ),
        ),
        Expanded(
          flex: 40,
          child: child,
        ),
        Expanded(
          flex: 40,
          child: Container(
              // Add any additional widgets or effects you want for the right part
              // color: Colors.blue,
              ),
        ),
      ],
    );
  }
}
