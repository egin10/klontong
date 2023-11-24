import 'package:klontong/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getListProduct();
  Future<Product> createProduct(Product product);
}
