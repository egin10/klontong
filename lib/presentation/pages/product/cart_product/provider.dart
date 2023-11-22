import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/route/app_router.dart';
import 'state.dart';

class CartProductProvider extends ChangeNotifier {
  final state = CartProductState();
  late BuildContext _context;

  CartProductProvider(BuildContext context) {
    _context = context;
  }

  void decrease() {
    debugPrint('Decrease');
  }

  void increase() {
    debugPrint('Increase');
  }

  void remove() {
    debugPrint('Remove');
  }

  void removeAll() {
    debugPrint('Remove All');
  }

  void navigateToDetail(String title) =>
      _context.router.navigate(DetailProductRoute(title: title));
}
