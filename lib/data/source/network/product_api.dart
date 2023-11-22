import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../dto/product_dto.dart';

abstract class ProductApi {
  Future<List<ProductDto>> getListProducts();
  Future<ProductDto> getDetailProduct(String productID);
}

class ProductApiImpl implements ProductApi {
  final dio = Dio();

  @override
  Future<List<ProductDto>> getListProducts() async {
    try {
      // Call API
      debugPrint('Call get list Products');
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint(e.response?.data);
        debugPrint('${e.response?.headers}');
        debugPrint('${e.response?.requestOptions}');

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint('${e.requestOptions}');
        debugPrint('${e.message}');
      }
    }

    return [];
  }

  @override
  Future<ProductDto> getDetailProduct(String productID) async {
    try {
      // Call API
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint(e.response?.data);
        debugPrint('${e.response?.headers}');
        debugPrint('${e.response?.requestOptions}');

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return const ProductDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint('${e.requestOptions}');
        debugPrint('${e.message}');
      }
    }

    return const ProductDto();
  }
}
