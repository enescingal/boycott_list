import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/category/view/category_view.dart';
import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:gen/gen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoryRoute.page),
      ];
}
