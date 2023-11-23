import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
                  return ProductCard(index: index);
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
