import 'package:flutter/material.dart';
import 'package:klontong/data/repository/product_repository_impl.dart';
import 'package:klontong/data/source/network/product_api.dart';

import 'state.dart';

class ListProductProvider extends ChangeNotifier {
  final state = ListProductState();

  late ProductRepositoryImpl productRepo;

  ListProductProvider() {
    final productApi = ProductApiImpl();
    productRepo = ProductRepositoryImpl(api: productApi);
  }

  void getListProduct() async {
    state.listProducts = await productRepo.getListProduct();
    notifyListeners();
  }
}
