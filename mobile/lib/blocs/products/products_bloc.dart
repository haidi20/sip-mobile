import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/models/product.dart';
import 'package:sip/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late final StreamSubscription<ProductState> productStateSubscription;
  final ProductRepository _productRepository;

  ProductBloc({
    ProductRepository? productRepository,
  })  : _productRepository = ProductRepository(),
        super(ProductState.init()) {
    on<ProductInitialize>(onInitialize);
    on<ProductFectData>(onProductFetchData);

    productStateSubscription = stream.listen(_onProductStateChange);
  }

  Future<void> onInitialize(
    ProductInitialize event,
    Emitter<ProductState> emit,
  ) async {
    //
  }

  // Method to handle state changes
  void _onProductStateChange(ProductState state) {
    // Handle the state change here, update UI or perform actions based on the state
    // debugPrint("ProductBloc State Change: $state");
  }

  Future<void> onProductFetchData(
    ProductFectData event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(data: [], loading: true),
    );
    // Update product data
    List<Product>? newData = await _productRepository.fetchData();

    // Emit the updated state with the new product data
    emit(
      state.copyWith(data: newData, loading: false),
    );
  }

  @override
  Future<void> close() async {
    await productStateSubscription.cancel();
    await super.close();
  }
}
