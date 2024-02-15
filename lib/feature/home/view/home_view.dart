import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/home/view/mixin/home_view_mixin.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// HomeView Page

final class HomeView extends StatefulWidget {
  /// HomeView
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: const Scaffold(
        body: Center(
          child: Text('Boycott List'),
        ),
      ),
    );
  }
}
