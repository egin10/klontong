import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entity/product.dart';
import 'dimentions_item.dart';

class ProductImageAndDimentions extends StatelessWidget {
  final Product product;
  const ProductImageAndDimentions({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          height: 150.h,
          width: 150.h,
          margin: EdgeInsets.only(right: 16.w),
          child: CachedNetworkImage(
            imageUrl: product.image ?? '',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
            fit: BoxFit.cover,
          ),
        ),
        // Dimentions
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dimensions",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6.h),
              DimentionsItem(
                title: "Width",
                value: '${product.width ?? 0} cm',
              ),
              DimentionsItem(
                title: "Length",
                value: '${product.length ?? 0} cm',
              ),
              DimentionsItem(
                title: "Height",
                value: '${product.height ?? 0} cm',
              ),
              DimentionsItem(
                title: "Weight",
                value: '${product.weight ?? 0} g',
              ),
              DimentionsItem(
                title: "SKU",
                value: product.sku ?? '',
              ),
            ],
          ),
        )
      ],
    );
  }
}
