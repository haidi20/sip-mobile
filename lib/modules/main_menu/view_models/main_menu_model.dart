import 'package:flutter/material.dart';
import 'package:sip/blocs/product_bloc.dart';
import 'package:sip/models/product_model.dart';

class MainMenuModel {
  final ProductBloc productBloc = ProductBloc();

  Stream<List<ProductModel>> get productStream => productBloc.productStream;
  List<ProductModel> get getData => productBloc.getData;
  ProductModel get getForm => productBloc.getForm;

  final String title = "Etalase Pangan";

  void onChangeWelcome(value) {
    debugPrint(value);
  }

  void dispose() {
    productBloc.dispose();
  }
}
