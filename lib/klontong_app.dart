import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/route/app_router.dart';

class KlontongApp extends StatelessWidget {
  KlontongApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Klontong App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
