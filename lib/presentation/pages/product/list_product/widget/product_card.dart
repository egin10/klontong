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
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
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
            const SizedBox(height: 8),
            const Text(
              "60.000 IDR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // Product Name
            Text("Product $index"),
            // Product Weight
            const Text("500g"),
          ],
        ),
      ),
    );
  }
}
