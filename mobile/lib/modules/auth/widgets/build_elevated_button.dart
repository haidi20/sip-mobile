import 'package:flutter/material.dart';

Widget buildElevatedButton({
  required bool isLoading,
  required Widget child,
  required Function onPressed,
}) {
  double borderRadius = 8.0; // Default border radius is 8.0

  final ButtonStyle activeButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.blue, // Set the background color to blue for active state
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(borderRadius), // Set the border radius
    ),
  );

  final ButtonStyle disabledButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.grey, // Set the background color to grey for disabled state
    onPrimary: Colors.black, // Set the text color to black for disabled state
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(borderRadius), // Set the border radius
    ),
  );

  return ElevatedButton(
    child: child,
    onPressed: () {
      // debugPrint("print internal");
      onPressed();
    },
    style: isLoading ? disabledButtonStyle : activeButtonStyle,
  );
}
