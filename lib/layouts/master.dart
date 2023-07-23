import 'package:flutter/material.dart';

class Master extends StatelessWidget {
  const Master({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        // Mobile layout
        // return Center(
        //   widthFactor: 0.5,
        //   child: child,
        // );
        return child;
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
              child: child,
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
