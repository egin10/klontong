import '../../domain/entity/product.dart';
import '../../domain/repository/product_repository.dart';
import '../source/network/product_api.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _api;

  ProductRepositoryImpl({required ProductApi api}) : _api = api;

  @override
  Future<List<Product>> getListProduct() async {
    final listProducts = await _api.getListProducts();
    return listProducts;
  }
}
