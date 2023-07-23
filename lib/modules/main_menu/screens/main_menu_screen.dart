import 'package:flutter/material.dart';
import 'package:sip/modules/main_menu/view_models/main_menu_model.dart';
import 'package:sip/modules/main_menu/partials/product_card.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  // final Main viewModel = CounterViewModel();
  final MainMenuModdel mainMenuModel = MainMenuModdel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return StreamBuilder<String>(
      stream: mainMenuModel.welcomeStream,
      initialData: mainMenuModel.currentWelcome,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                    ),
                    onChanged: (text) => {
                      debugPrint(text),
                      mainMenuModel.onChangeWelcome(text),
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    mainMenuModel.currentWelcome,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold, height: 1.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        // WalkGroupCard()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
