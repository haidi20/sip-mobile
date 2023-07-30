import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/constants.dart';
import 'package:sip/cubits/product_cubit.dart';
import 'package:sip/models/product.dart';
import 'package:sip/modules/home/service/home_service.dart';
import 'package:sip/modules/home/view/product_card.dart';
import 'package:sip/modules/main_menu/view/search_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeService homeService = HomeService();
  // ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // productBloc.close();
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
                homeService.title,
                style: const TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold, height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    bool isLoading = state.loading;
                    List<Product>? products = state.data;
                    if (isLoading) {
                      return const Text("Loading...");
                    } else if (products.isNotEmpty) {
                      return Row(
                        children: products.map(
                          (Product product) {
                            return GestureDetector(
                              onTap: () {
                                debugPrint('You tapped on ${product.name}');
                              },
                              child: ProductCard(
                                imgUrl: product.imgUrl,
                                name: product.name,
                              ),
                            );
                          },
                        ).toList(),
                      );
                    } else {
                      return const Text("data kosong");
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
