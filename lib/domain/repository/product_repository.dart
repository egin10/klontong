import 'package:klontong/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getListProduct();
  Future<Product> getDetailProduct({required String productID});
  Future<Product> updateProduct({required Product product});
  Future<Product> deleteProduct({required String productID});
}
