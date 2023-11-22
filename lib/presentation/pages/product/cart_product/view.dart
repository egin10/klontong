import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';
import 'widget/item_product.dart';

@RoutePage()
class CartProductPage extends StatelessWidget {
  const CartProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProductProvider(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<CartProductProvider>();
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          "MY CART",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => provider.removeAll(),
                  child: const Text(
                    "Remove All",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ItemProduct(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
