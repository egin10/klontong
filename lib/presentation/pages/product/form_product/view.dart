import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/product.dart';
import 'provider.dart';

@RoutePage()
class FormProductPage extends StatelessWidget {
  final Product? product;

  const FormProductPage({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FormProductProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<FormProductProvider>();
    final state = provider.state;

    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
