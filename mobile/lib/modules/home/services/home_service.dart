import 'package:sip/blocs/products/products_bloc.dart';

class HomeService {
  // Add this line to create a single instance of ProductBloc
  final ProductBloc productBloc = ProductBloc();
  final String title = "Etalase Pangan";

  void dispose() {
    productBloc.close();
  }
}
