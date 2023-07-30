import 'package:flutter/material.dart';
import 'package:sip/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: paddingLeftGenerale,
            right: paddingRightGenerale,
          ),
          child: Text("profile"),
        ),
      ],
    );
  }
}
