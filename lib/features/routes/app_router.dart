import 'package:auto_route/auto_route.dart';
import 'package:my_app/features/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardingRoute.page, initial: true), 
        AutoRoute(page: Home.page),          
        AutoRoute(page: CartRoute.page),          
        AutoRoute(page: WishListRoute.page),     
      ];
}
