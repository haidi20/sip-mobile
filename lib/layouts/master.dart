import 'package:flutter/material.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/dashboard/dashboard_screen.dart';
import 'package:sip/modules/user/user_screen.dart';
import 'package:sip/widgets/slide_right_route.dart';

class Master extends StatelessWidget {
  const Master({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        // Mobile layout
        return Center(
          widthFactor: 0.5,
          child: child,
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
    ;
  }
}
