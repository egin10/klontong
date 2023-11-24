import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/product.dart';
import '../../../utils/currency_format.dart';
import '../../../widget/loading.dart';
import 'provider.dart';
import 'widget/product_image_and_dimentions.dart';

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
    final provider = context.watch<DetailProductProvider>();
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => provider.navigateBack(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () => provider.navigateToFormProduct(),
                child: const Text('Edit'),
              ),
              PopupMenuItem(
                onTap: () => provider.delete(context),
                child: const Text('Delete'),
              ),
            ],
            icon: const Icon(Icons.more_vert_rounded),
            color: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Name
                      Text(
                        product.categoryName != null
                            ? product.categoryName!.toUpperCase()
                            : '-',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14.sp,
                        ),
                      ),

                      // Product Name
                      Text(
                        product.name ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Product Image & Dimensions
                      ProductImageAndDimentions(product: product),
                    ],
                  ),
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(product.description ?? 'No Description.'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 26.h, top: 10.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Price : ${CurrencyFormat.convertToIdr(product.price ?? 0, 0)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // When loading/busy
          state.isBusy ? const Loading() : Container(),
        ],
      ),
    );
  }
}
