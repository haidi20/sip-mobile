import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context); // Close the drawer
              },
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
