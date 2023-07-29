import 'package:flutter/material.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({super.key});

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
          ListTile(
            title: const Text('Etalase Pangan'),
            onTap: () {
              // Handle the click on 'Etalase Pangan'
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Laporan Harian Harga'),
            onTap: () {
              // Handle the click on 'Laporan Harian Harga'
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Ketersediaan Pangan'),
            onTap: () {
              // Handle the click on 'Ketersediaan Pangan'
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
