import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/route/app_router.dart';
import '../../../../data/repository/product_repository_impl.dart';
import '../../../../data/source/network/product_api.dart';
import '../../../../domain/entity/product.dart';
import 'state.dart';

class ListProductProvider extends ChangeNotifier {
  final state = ListProductState();

  late ProductRepositoryImpl productRepo;
  late BuildContext _context;

  ListProductProvider(BuildContext context) {
    final productApi = ProductApiImpl();
    productRepo = ProductRepositoryImpl(api: productApi);
    _context = context;

    getListProduct();
  }

  List<Product> loadProducts() {
    return state.listProducts;
  }

  void getListProduct() async {
    state.isBusy = true;
    notifyListeners();

    state.listProducts = await productRepo.getListProduct();
    state.isBusy = false;
    notifyListeners();
  }

  void next() {
    if (state.currentPage < state.listProducts.length) {
      debugPrint("Next");
      state.currentPage++;
      notifyListeners();
    }
  }

  void preview() {
    debugPrint("Preview");
  }

  void navigateToDetail(Product product) async {
    state.searchController.text = '';

    final detail =
        await _context.router.push(DetailProductRoute(product: product));
    if (detail != null && detail as bool) {
      getListProduct();
    }
  }

  void navigateToFormProduct() async {
    state.searchController.text = '';

    final created = await _context.router.push(FormProductRoute());
    if (created != null && created as bool) {
      getListProduct();
    }
  }
}
