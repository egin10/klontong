import 'package:flutter/material.dart';
import 'package:klontong/config/route/app_router.dart';

class KlontongApp extends StatelessWidget {
  KlontongApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Klontong App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}