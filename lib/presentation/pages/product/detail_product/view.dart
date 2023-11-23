import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/product.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

@RoutePage()
class DetailProductPage extends StatelessWidget {
  final Product product;
  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailProductProvider(context, product),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<DetailProductProvider>();
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(state.product.name ?? 'Unknown'),
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () => provider.navigateToFormProduct(),
                child: const Text('Edit'),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Text('Delete'),
              ),
            ],
            icon: const Icon(Icons.more_vert_rounded),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Text("Detail ${state.product.name}"),
      ),
    );
  }
}
