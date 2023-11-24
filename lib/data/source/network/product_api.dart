import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/product.dart';
import '../../dto/product_dto.dart';
import '../../endpoint/endpoint_product.dart';
import '../../service/dio_service.dart';

abstract class ProductApi {
  Future<List<ProductDto>> getListProducts();
  Future<ProductDto> createProduct(Product product);
}

class ProductApiImpl implements ProductApi {
  final Dio _dio = DioService.getInstance();

  @override
  Future<List<ProductDto>> getListProducts() async {
    try {
      final Map<String, dynamic> headers = {
        'accept': 'application/json',
      };

      final response = await _dio.get(
        EndpointProduct.products,
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw Exception("Error occurred");
      }
      return List<ProductDto>.from(
        response.data.map(
          (product) => ProductDto.fromMap(product),
        ),
      );
    } on DioError catch (e) {
      catchError(e, []);
    }

    return [];
  }

  @override
  Future<ProductDto> createProduct(Product product) async {
    try {
      final Map<String, dynamic> headers = {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

      // Issue
      final response = await _dio.post(
        EndpointProduct.products,
        options: Options(headers: headers),
        data: ProductDto.fromProduct(product).toMap(),
      );

      print(response);

      if (response.statusCode != 200) {
        throw Exception("Error occurred");
      }

      return ProductDto.fromMap(response.data);
    } on DioError catch (e) {
      catchError(e, const ProductDto());
    }

    return const ProductDto();
  }

  dynamic catchError(dynamic e, dynamic returnValue) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      debugPrint(e.response?.data);
      debugPrint('${e.response?.headers}');
      debugPrint('${e.response?.requestOptions}');

      //  API responds with 404 when reached the end
      if (e.response?.statusCode == 404) return returnValue;
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      debugPrint('${e.requestOptions}');
      debugPrint('${e.message}');
    }
  }
}
