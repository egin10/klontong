import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

@RoutePage()
class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashscreenProvider(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    context.read<SplashscreenProvider>();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store,
              size: 120.h,
              color: Colors.white,
            ),
            Text(
              "KLONTONG",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
