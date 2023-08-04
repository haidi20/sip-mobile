import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/constants.dart';
import 'package:sip/models/product.dart';
import 'package:sip/modules/home/services/home_service.dart';
import 'package:sip/modules/home/widgets/product_card.dart';
import 'package:sip/modules/main_menu/widgets/search_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeService homeService = HomeService();
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    productBloc = BlocProvider.of(context);
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
                child: StreamBuilder(
                  stream: productBloc.stream,
                  builder: (context, snapshot) {
                    bool? isLoading = snapshot.data?.loading ?? false;
                    if (isLoading) {
                      return const Text("Loading...");
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      List<Product>? products = snapshot.data?.data ?? [];
                      if (products.isNotEmpty) {
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
                        return Text("data kosong");
                      }
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
