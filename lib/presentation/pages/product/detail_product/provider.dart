import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/route/app_router.dart';
import '../../../../domain/entity/product.dart';
import 'state.dart';

class DetailProductProvider extends ChangeNotifier {
  final state = DetailProductState();

  late BuildContext _context;

  DetailProductProvider(BuildContext context, Product product) {
    _context = context;
    state.product = product;
  }

  void delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: Text("Are you sure delete ${state.product.name}?"),
            actions: [
              TextButton(
                onPressed: () {
                  deleteProduct();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context.router.pop(),
                child: const Text(
                  "CANCEL",
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void deleteProduct() {
    state.isBusy = true;
    notifyListeners();

    _context.router.pop();

    Future.delayed(const Duration(seconds: 3), () {
      debugPrint("DELETE");
      _context.router.replaceAll([const ListProductRoute()]);
    });
  }

  void navigateToFormProduct() =>
      _context.router.navigate(FormProductRoute(product: state.product));
}
