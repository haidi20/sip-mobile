import 'package:flutter/material.dart';
import 'package:sip/blocs/product_bloc.dart';
import 'package:sip/models/product_model.dart';

class MainMenuController {
  final ProductBloc productBloc = ProductBloc();

  Stream<List<ProductModel>> get productDataStream => productBloc.dataStream;
  List<ProductModel> get productGetData => productBloc.getData;
  ProductModel get getForm => productBloc.getForm;

  final String title = "Etalase Pangan";

  void onChangeWelcome(value) {
    debugPrint(value);
  }

  void dispose() {
    productBloc.dispose();
  }
}
