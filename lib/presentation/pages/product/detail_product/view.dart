import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

@RoutePage()
class DetailProductPage extends StatelessWidget {
  final String title;
  const DetailProductPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailProductProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<DetailProductProvider>();
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text("Detail $title"),
      ),
    );
  }
}
