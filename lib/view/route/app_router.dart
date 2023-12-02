import 'package:auto_route/auto_route.dart';
import 'package:weather_app/view/screens/home_screen.dart';
import 'package:weather_app/view/screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
      ];
}
