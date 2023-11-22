import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    this.id,
    this.categoryId,
    this.categoryName,
    this.sku,
    this.name,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
    this.image,
    this.price,
  });

  final int? id;
  final int? categoryId;
  final String? categoryName;
  final String? sku;
  final String? name;
  final String? description;
  final double? weight;
  final double? width;
  final double? length;
  final double? height;
  final String? image;
  final double? price;

  @override
  List<Object?> get props => [
        id,
        categoryId,
        categoryName,
        sku,
        name,
        description,
        weight,
        width,
        length,
        height,
        image,
        price,
      ];
}
