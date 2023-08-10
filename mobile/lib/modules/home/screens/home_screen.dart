import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/blocs.dart';
import 'package:sip/utils/app_lifectyle_observer.dart';
import 'package:sip/utils/constants.dart';
import 'package:sip/models/product.dart';
import 'package:sip/modules/home/services/home_service.dart';
import 'package:sip/modules/home/widgets/product_card.dart';
import 'package:sip/modules/home/widgets/search_input.dart';
import 'package:sip/widgets/shimmer_loading.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeService homeService = HomeService();
  // ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(AppLifecycleObserver());
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
        SearchInput(),
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
        Container(
          color: Colors.white, // Set the background color to white
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                bool isLoading = state.loading;
                List<Product>? products = state.data;
                if (isLoading) {
                  return Row(
                    children: List.generate(
                      3, // Display up to 4 loading widgets
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: paddingLeft,
                          ),
                          child: const ShimmerLoading(),
                        );
                      },
                    ),
                  );
                } else if (products.isNotEmpty) {
                  return Row(
                    children: products.map(
                      (Product product) {
                        return GestureDetector(
                          onTap: () {
                            debugPrint('click ${product.name}');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: paddingLeft), // Add desired right padding
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
        ),
      ],
    );
  }
}
