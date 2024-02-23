import 'package:boycott_list/feature/category/view/category_view.dart';
import 'package:boycott_list/feature/category/view_model/category_view_model.dart';
import 'package:boycott_list/product/state/base/base_state.dart';

///CategoryViewMixin mixin
mixin CategoryViewMixin on BaseState<CategoryView> {
  late final CategoryViewModel _viewModel;

  CategoryViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CategoryViewModel();

    if (widget.categoryList.isNotEmpty) {
      viewModel.state.copyWith(
        categoryList: viewModel.state.categoryList..addAll(widget.categoryList),
      );
    }
  }
}
