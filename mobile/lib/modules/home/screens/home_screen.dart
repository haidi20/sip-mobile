import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/blocs.dart';
import 'package:sip/constants.dart';
import 'package:sip/models/product.dart';
import 'package:sip/modules/home/services/home_service.dart';
import 'package:sip/modules/home/widgets/product_card.dart';
import 'package:sip/modules/home/widgets/search_input.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
    Size size = MediaQuery.of(context).size;
    double paddingRight = size.width * paddingRightLeftGenerale;
    double paddingLeft = size.width * paddingRightLeftGenerale;
    // var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SearchInput(),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
          ),
          child: Center(
            child: Text(
              homeService.title,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ),
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
                          debugPrint('click ${product.name}');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0), // Add desired right padding
                          child: ProductCard(
                            imgUrl: product.imgUrl ?? "",
                            name: product.name ?? "",
                            price: product.price ?? "",
                          ),
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
    );
  }
}
