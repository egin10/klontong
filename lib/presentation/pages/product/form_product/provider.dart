import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/product.dart';

import 'state.dart';

class FormProductProvider extends ChangeNotifier {
  final state = FormProductState();

  FormProductProvider(Product? product) {
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
  }

  void submit(bool isUpdate) {
    if (isUpdate) {
      debugPrint("UPDATED");
    }

    debugPrint("INSERT");
  }
}
