part of 'products_bloc.dart';

class ProductState extends Equatable {
  final String message;
  final List<Product> data;
  final String price;
  final Product form;
  final bool loading;

  const ProductState({
    required this.message,
    required this.price,
    required this.data,
    required this.form,
    required this.loading,
  });

  // Create an initial state with default values
  factory ProductState.init() {
    return ProductState(
      message: "",
      price: "",
      data: [],
      form: Product(id: 0, name: "", imgUrl: "", price: ""),
      loading: false,
    );
  }

  ProductState copyWith({
    String? message,
    String? price,
    List<Product>? data,
    Product? form,
    bool? loading,
  }) {
    return ProductState(
      message: message ?? this.message,
      price: message ?? this.price,
      data: data ?? this.data,
      form: form ?? this.form,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [message, price, data, form, loading];

  @override
  bool get stringify => true;
}
