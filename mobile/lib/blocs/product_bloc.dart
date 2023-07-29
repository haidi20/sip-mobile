import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:sip/models/product_model.dart';

class ProductBloc {
  String imgUrl =
      "https://images.unsplash.com/photo-1587334207407-deb137a955ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80";

  final List<ProductModel> _data = [
    // ProductModel(id: 1, name: "Sayur", imgUrl: ""),
    // ProductModel(id: 2, name: "Kecambah", imgUrl: ""),
    // ProductModel(id: 3, name: "Bayam", imgUrl: ""),
    // ProductModel(id: 2, name: "Buah", imgUrl: ),
  ];
  final ProductModel _form = ProductModel(id: 1, name: "sayuran", imgUrl: "");
  final VmLoading _loading = VmLoading();

  final _dataStream = BehaviorSubject<List<ProductModel>>();

  Stream<List<ProductModel>> get dataStream => _dataStream.stream;
  List<ProductModel> get getData => _data;
  ProductModel get getForm => _form;

  void dispose() {
    _dataStream.close();
  }
}

class VmLoading {
  final bool data = false;

  // VmLoading({required data});
}
