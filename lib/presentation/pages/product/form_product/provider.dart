import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/product.dart';

import 'state.dart';

class FormProductProvider extends ChangeNotifier {
  final state = FormProductState();
  late BuildContext _context;

  FormProductProvider(BuildContext context, Product? product) {
    if (product != null) {
      state.nameController.text = product.name!;
      state.categoryController.text = product.categoryName!;
      state.imageController.text = product.image!;
      state.skuController.text = product.sku!;
      state.widthController.text = '${product.width ?? 0}';
      state.heightController.text = '${product.height ?? 0}';
      state.lengthController.text = '${product.length ?? 0}';
      state.weightController.text = '${product.weight ?? 0}';
      state.priceController.text = '${product.price ?? 0}';
      state.descriptionController.text = '${product.description ?? 0}';
    }

    _context = context;
  }

  void submit(bool isUpdate) {
    state.isBusy = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () {
      if (isUpdate) {
        debugPrint("UPDATED");
        _context.router.pop();
        return;
      }

      debugPrint("INSERT");
      _context.router.pop();
    });
  }
}
