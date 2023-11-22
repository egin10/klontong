import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import 'button_action.dart';

class ItemProduct extends StatelessWidget {
  final int index;

  const ItemProduct({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<CartProductProvider>()
          .navigateToDetail("Product $index"),
      child: Container(
        width: double.maxFinite,
        height: 160,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              height: double.maxFinite,
              width: 120,
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Info
                  const Text(
                    "60.000 IDR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Product Name
                  Text(
                    "Product $index",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  // Product Weight
                  const Text(
                    "500g",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const ButtonAction(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
