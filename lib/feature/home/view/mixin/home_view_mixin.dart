import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/product/state/base/base_state.dart';

///HomeViewMixin mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;

  HomeViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }
}
