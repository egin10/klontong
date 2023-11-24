import 'dart:convert';

import '../../domain/entity/product.dart';

class ProductDto extends Product {
  const ProductDto({
    super.id,
    super.categoryId,
    super.categoryName,
    super.sku,
    super.name,
    super.description,
    super.weight,
    super.width,
    super.length,
    super.height,
    super.image,
    super.price,
  });

  // JSON
  factory ProductDto.fromRawJson(String str) =>
      ProductDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory ProductDto.fromMap(Map<String, dynamic> json) => ProductDto(
        id: json['_id'],
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        sku: json['sku'],
        name: json['name'],
        description: json['description'],
        weight: double.tryParse('${json['weight']}'),
        width: double.tryParse('${json['width']}'),
        length: double.tryParse('${json['length']}'),
        height: double.tryParse('${json['height']}'),
        image: json['image'],
        price: double.tryParse('${json['price']}'),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "price": price,
      };

  // Domain
  static ProductDto fromProduct(Product product) {
    return ProductDto(
      id: product.id,
      categoryId: product.categoryId,
      categoryName: product.categoryName,
      sku: product.sku,
      name: product.name,
      description: product.description,
      weight: product.weight,
      width: product.width,
      length: product.length,
      height: product.height,
      image: product.image,
      price: product.price,
    );
  }

  Product toProduct() {
    return Product(
      id: id,
      categoryId: categoryId,
      categoryName: categoryName,
      sku: sku,
      name: name,
      description: description,
      weight: weight,
      width: width,
      length: length,
      height: height,
      image: image,
      price: price,
    );
  }
}
