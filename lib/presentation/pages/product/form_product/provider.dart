import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../data/repository/product_repository_impl.dart';
import '../../../../data/source/network/product_api.dart';
import '../../../../domain/entity/product.dart';
import 'state.dart';

class FormProductProvider extends ChangeNotifier {
  final state = FormProductState();

  late ProductRepositoryImpl productRepo;
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

    final productApi = ProductApiImpl();
    productRepo = ProductRepositoryImpl(api: productApi);
    _context = context;
  }

  void submit(bool isUpdate, String? id) async {
    state.isBusy = true;
    notifyListeners();

    // Set New Product
    final product = Product(
      id: id,
      name: state.nameController.text,
      categoryId: 1,
      categoryName: state.categoryController.text,
      image: state.imageController.text,
      sku: state.skuController.text,
      width: double.tryParse(state.widthController.text),
      height: double.tryParse(state.heightController.text),
      length: double.tryParse(state.lengthController.text),
      weight: double.tryParse(state.weightController.text),
      price: double.tryParse(state.priceController.text),
      description: state.descriptionController.text,
    );

    if (isUpdate) {
      debugPrint("UPDATED");
      _context.router.pop();
      return;
    }

    // INSERT NEW PRODUCT
    final createdProduct = await productRepo.createProduct(product);
    print(createdProduct);
    
    state.isBusy = false;
    notifyListeners();
    // _context.router.pop<bool>(true);
  }
}
