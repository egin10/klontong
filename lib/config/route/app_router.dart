import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/product.dart';
import '../../presentation/pages/product/detail_product/view.dart';
import '../../presentation/pages/product/form_product/view.dart';
import '../../presentation/pages/product/list_product/view.dart';
import '../../presentation/pages/splashscreen/view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashscreenRoute.page, initial: true),
        AutoRoute(page: ListProductRoute.page),
        AutoRoute(page: FormProductRoute.page),
        AutoRoute(page: DetailProductRoute.page),
      ];
}
