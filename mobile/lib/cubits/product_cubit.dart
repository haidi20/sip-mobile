import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/products/products_bloc.dart';
import 'package:sip/models/product.dart';
import 'package:sip/repositories/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  // Constructor to initialize the cubit with the initial state
  ProductCubit() : super(ProductState.init());

  // Method to get the current data from the state
  List<Product> get products => state.data;

  // Method to get the loading state from the state
  bool get isLoading => state.loading;

  // Method to get the error message from the state
  String get errorMessage => state.message;
}
