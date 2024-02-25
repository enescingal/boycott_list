import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/splash/view/view_mixin/splash_view_mixin.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

@RoutePage()

/// SplashView Page

final class SplashView extends StatefulWidget {
  /// SplashView
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: ColorName.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.boycott.image(
                package: 'gen',
                width: context.sized.highValue * 3,
              ),
              Text(
                LocaleKeys.home_appbarTitle.tr(),
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: ColorName.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
