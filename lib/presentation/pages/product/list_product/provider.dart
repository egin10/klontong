import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/product.dart';

import '../../../../config/route/app_router.dart';
import '../../../../data/repository/product_repository_impl.dart';
import '../../../../data/source/network/product_api.dart';
import 'state.dart';

class ListProductProvider extends ChangeNotifier {
  final state = ListProductState();

  late ProductRepositoryImpl productRepo;
  late BuildContext _context;

  ListProductProvider(BuildContext context) {
    final productApi = ProductApiImpl();
    productRepo = ProductRepositoryImpl(api: productApi);
    _context = context;
  }

  void getListProduct() async {
    state.listProducts = await productRepo.getListProduct();
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

  void navigateToDetail(Product product) =>
      _context.router.navigate(DetailProductRoute(product: product));

  void navigateToFormProduct() => _context.router.navigate(FormProductRoute());
}
