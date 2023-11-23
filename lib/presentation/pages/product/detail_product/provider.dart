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

  void delete() {
    debugPrint("DELETE");
  }

  void navigateToFormProduct() =>
      _context.router.navigate(FormProductRoute(product: state.product));
}
