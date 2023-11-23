import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<ListProductProvider>()
          .navigateToDetail("Product $index"),
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            SizedBox(
              height: double.maxFinite,
              width: 100,
              child: CachedNetworkImage(
                height: double.maxFinite,
                width: double.maxFinite,
                imageUrl: index % 2 == 0
                    ? "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b"
                    : "https://fksfs.co.id/wps/wp-content/uploads/2019/04/TaroNet_Seaweed-36g_Website.png",
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        "Product $index",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // Product Category
                      const Text("Cemilan"),
                      // Product Weight
                      const Text("50g"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Product Price
                      Text(
                        "60.000 IDR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
