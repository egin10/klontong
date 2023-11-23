import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/product.dart';
import '../../../widget/custom_textfield.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:
            Text(product != null ? "Edit ${product!.name}" : "Insert Product"),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: ListView(
          children: [
            CustomTextField(hintText: "Name"),
          ],
        ),
      ),
    );
  }
}
