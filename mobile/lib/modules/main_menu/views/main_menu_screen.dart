import 'package:flutter/material.dart';
import 'package:sip/blocs/product_bloc.dart';
import 'package:sip/constants.dart';
import 'package:sip/models/product_model.dart';
import 'package:sip/modules/main_menu/controllers/main_menu_controller.dart';
import 'package:sip/modules/main_menu/views/search_input.dart';
import 'package:sip/modules/main_menu/views/product_card.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  MainMenuController mainMenuController = MainMenuController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mainMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: paddingLeftGenerale,
            right: paddingRightGenerale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SearchInput(),
              const SizedBox(
                height: 15,
              ),
              Text(
                mainMenuController.title,
                style: const TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold, height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<List<ProductModel>>(
                  stream: mainMenuController.productDataStream,
                  initialData: mainMenuController.productGetData,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductModel>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        List<ProductModel> products = snapshot.data!;
                        return Row(
                          children: products.map(
                            (ProductModel product) {
                              return GestureDetector(
                                onTap: () {
                                  debugPrint('You tapped on ${product.name}');
                                },
                                child: ProductCard(imgUrl: product.imgUrl),
                              );
                            },
                          ).toList(),
                        );
                      } else {
                        return const Text('Tidak ada data');
                      }
                    } else {
                      return const Text(
                        'Tidak ada data',
                      ); // handle the case when there's no data
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
