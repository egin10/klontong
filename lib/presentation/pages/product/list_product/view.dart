import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/product.dart';
import 'provider.dart';
import 'widget/product_card.dart';
import 'widget/search_textfield.dart';

@RoutePage()
class ListProductPage extends StatelessWidget {
  const ListProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ListProductProvider(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ListProductProvider>();
    // final state = provider.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "KLONTONG",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        leading: const Icon(
          Icons.store,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () => provider.navigateToFormProduct(),
            icon: const Icon(
              Icons.note_add_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            // Search
            const SearchTextField(),

            // List Products
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return ProductCard(
                    product: Product(
                      name: "Product ${index + 1}",
                      categoryName: "Cemilan",
                      weight: 20,
                      height: 10,
                      length: 10,
                      width: 10,
                      price: 20000,
                      description:
                          "Product ${index + 1} very nice and delicious. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      id: index,
                      sku: "AKSDJ",
                      image: index % 2 == 0
                          ? "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b"
                          : "https://fksfs.co.id/wps/wp-content/uploads/2019/04/TaroNet_Seaweed-36g_Website.png",
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 4.w),

            // Pagination [Preview, Next]
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => provider.preview(),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 36.h,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () => provider.next(),
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 36.h,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
