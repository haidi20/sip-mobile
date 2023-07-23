import 'package:flutter/material.dart';
import 'package:sip/blocs/product_bloc.dart';
import 'package:sip/models/product_model.dart';
import 'package:sip/modules/main_menu/view_models/main_menu_model.dart';
import 'package:sip/modules/main_menu/partials/product_card.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  MainMenuModel mainMenuModel = MainMenuModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mainMenuModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
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
                mainMenuModel.title,
                style: const TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold, height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<List<ProductModel>>(
                  stream: mainMenuModel.productStream,
                  initialData: [],
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductModel>> snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = snapshot.data!;
                      return Row(
                        children: products.map(
                          (ProductModel product) {
                            return ProductCard(imgUrl: product.imgUrl);
                          },
                        ).toList(),
                      );
                    } else {
                      return const Text(
                          'No Data'); // handle the case when there's no data
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
