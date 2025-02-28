// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:my_app/features/cart/ui/CartPage.dart' as _i1;
import 'package:my_app/features/onBoarding/onBoarding.dart' as _i2;
import 'package:my_app/features/wishlist/ui/WishListPage.dart' as _i3;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i4.PageRouteInfo<void> {
  const CartRoute({List<_i4.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [Home]
class Home extends _i4.PageRouteInfo<void> {
  const Home({List<_i4.PageRouteInfo>? children})
    : super(Home.name, initialChildren: children);

  static const String name = 'Home';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const Home();
    },
  );
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingRoute extends _i4.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i4.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i3.WishListPage]
class WishListRoute extends _i4.PageRouteInfo<void> {
  const WishListRoute({List<_i4.PageRouteInfo>? children})
    : super(WishListRoute.name, initialChildren: children);

  static const String name = 'WishListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.WishListPage();
    },
  );
}
