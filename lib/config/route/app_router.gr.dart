// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DetailProductPage(),
      );
    },
    FormProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FormProductPage(),
      );
    },
    ListProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListProductPage(),
      );
    },
    SplashscreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashscreenPage(),
      );
    },
  };
}

/// generated route for
/// [DetailProductPage]
class DetailProductRoute extends PageRouteInfo<void> {
  const DetailProductRoute({List<PageRouteInfo>? children})
      : super(
          DetailProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FormProductPage]
class FormProductRoute extends PageRouteInfo<void> {
  const FormProductRoute({List<PageRouteInfo>? children})
      : super(
          FormProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListProductPage]
class ListProductRoute extends PageRouteInfo<void> {
  const ListProductRoute({List<PageRouteInfo>? children})
      : super(
          ListProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashscreenPage]
class SplashscreenRoute extends PageRouteInfo<void> {
  const SplashscreenRoute({List<PageRouteInfo>? children})
      : super(
          SplashscreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashscreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
