import 'package:flutter/material.dart';

class RightMenu extends StatelessWidget {
  RightMenu({super.key});

  List<Map<String, String?>> listMenu = [
    {
      "name": 'Etalase Pangan',
      "nameRoute": null,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...listMenu.map(
            (menu) => ListTile(
              title: Text(menu['name']!),
              onTap: () {
                // Handle the click on 'Etalase Pangan'
                Navigator.pop(context); // Close the drawer
              },
            ),
          ),
        ],
      ),
    );
  }
}
