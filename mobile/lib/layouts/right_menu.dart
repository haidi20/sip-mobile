import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RightMenu extends StatelessWidget {
  RightMenu({super.key});

  List<Map<String, String?>> listMenu = [
    {
      "name": 'Etalase Pangan',
      "nameRoute": null,
    },
    {
      "name": 'Laporan Harian Harga',
      "nameRoute": null,
    },
    {
      "name": 'Ketersediaan Pangan',
      "nameRoute": null,
    },
    {
      "name": 'Keluar',
      "nameRoute": "login",
    },
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
                AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
                // Handle the click on 'Etalase Pangan'
                Navigator.pop(context); // Close the drawer

                if (menu['nameRoute'] != null) {
                  if (menu['nameRoute'] == 'login') {
                    authBloc.add(
                      AuthLogout(),
                    );
                  }

                  Navigator.pushNamed(context, menu['nameRoute']!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
