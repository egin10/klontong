import 'package:klontong/data/dto/product_dto.dart';
import 'package:klontong/data/source/network/product_api.dart';
import 'package:klontong/domain/entity/product.dart';
import 'package:klontong/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _api;

  ProductRepositoryImpl({required ProductApi api}) : _api = api;

  @override
  Future<Product> deleteProduct({required String productID}) async {
    final detele = await _api.delteProduct(productID);
    return detele;
  }

  @override
  Future<Product> getDetailProduct({required String productID}) async {
    final detail = await _api.getDetailProduct(productID);
    return detail;
  }

  @override
  Future<List<Product>> getListProduct() async {
    final listProducts = await _api.getListProducts();
    return listProducts;
  }

  @override
  Future<Product> updateProduct({required Product product}) async {
    final update = await _api.updateProduct(product as ProductDto);
    return update;
  }
}
