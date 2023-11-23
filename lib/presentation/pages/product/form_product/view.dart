import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/product.dart';
import 'widget/custom_textfield.dart';
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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  FormTextField(
                    hintText: "Name",
                    controller: state.nameController,
                  ),
                  FormTextField(
                    hintText: "Category",
                    readOnly: true,
                    controller: state.categoryController,
                  ),
                  FormTextField(
                    hintText: "Image (Url)",
                    controller: state.imageController,
                  ),
                  FormTextField(
                    hintText: "SKU",
                    controller: state.skuController,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Expanded(
                          child: FormTextField(
                            hintText: "Width",
                            controller: state.widthController,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: FormTextField(
                            hintText: "Height",
                            controller: state.heightController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormTextField(
                          hintText: "Length",
                          controller: state.lengthController,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: FormTextField(
                          hintText: "Weight",
                          controller: state.weightController,
                        ),
                      ),
                    ],
                  ),
                  FormTextField(
                    hintText: "Price",
                    controller: state.priceController,
                  ),
                  FormTextField(
                    hintText: "Description",
                    height: 160,
                    textInputType: TextInputType.multiline,
                    minLines: 10,
                    maxLines: 10,
                    controller: state.descriptionController,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              width: double.maxFinite,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () => provider.submit(product != null),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Text(
                  product != null ? "UPDATE" : "INSERT",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
