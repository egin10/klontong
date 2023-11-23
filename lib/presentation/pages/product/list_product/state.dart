import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/product.dart';

class ListProductState {
  List<Product> listProducts = [];
  int currentPage = 0;

  final TextEditingController searchController = TextEditingController();
}
