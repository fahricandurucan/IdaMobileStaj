import 'package:auto_route/auto_route.dart';
import 'package:auto_route_test/pages/home_page.dart';
import 'package:auto_route_test/pages/profile_page.dart';
import 'package:auto_route_test/pages/settings_page.dart';
import 'package:auto_route_test/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route') // HomePage => HomeRoute
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page, children: [
          AutoRoute(page: SettingsRoute.page, path: "settings", initial: true),
          AutoRoute(page: ProfileRoute.page, path: "profile"),
        ]),

        /// routes go here
      ];
}

final router = AppRouter();
