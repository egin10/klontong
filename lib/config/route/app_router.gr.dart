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
      final args = routeData.argsAs<DetailProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailProductPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    FormProductRoute.name: (routeData) {
      final args = routeData.argsAs<FormProductRouteArgs>(
          orElse: () => const FormProductRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FormProductPage(
          key: args.key,
          product: args.product,
        ),
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
class DetailProductRoute extends PageRouteInfo<DetailProductRouteArgs> {
  DetailProductRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          DetailProductRoute.name,
          args: DetailProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailProductRoute';

  static const PageInfo<DetailProductRouteArgs> page =
      PageInfo<DetailProductRouteArgs>(name);
}

class DetailProductRouteArgs {
  const DetailProductRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'DetailProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [FormProductPage]
class FormProductRoute extends PageRouteInfo<FormProductRouteArgs> {
  FormProductRoute({
    Key? key,
    Product? product,
    List<PageRouteInfo>? children,
  }) : super(
          FormProductRoute.name,
          args: FormProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'FormProductRoute';

  static const PageInfo<FormProductRouteArgs> page =
      PageInfo<FormProductRouteArgs>(name);
}

class FormProductRouteArgs {
  const FormProductRouteArgs({
    this.key,
    this.product,
  });

  final Key? key;

  final Product? product;

  @override
  String toString() {
    return 'FormProductRouteArgs{key: $key, product: $product}';
  }
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
