import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/splash/view/splash_view.dart';
import 'package:boycott_list/feature/splash/view_model/splash_view_model.dart';
import 'package:boycott_list/product/navigation/app_router.dart';
import 'package:boycott_list/product/state/base/base_state.dart';

///SplashViewMixin mixin
mixin SplashViewMixin on BaseState<SplashView> {
  late final SplashViewModel _viewModel;

  SplashViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SplashViewModel();

    _initRoute();
  }

  Future<void> _initRoute() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) context.router.replace(const HomeRoute());
    });
  }
}
