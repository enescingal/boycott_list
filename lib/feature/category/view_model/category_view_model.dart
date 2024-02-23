import 'package:boycott_list/feature/category/view_model/state/category_state.dart';
import 'package:boycott_list/product/state/base/base_cubit.dart';

///CategoryViewModel class
final class CategoryViewModel extends BaseCubit<CategoryState> {
  ///CategoryViewModel
  CategoryViewModel()
      : super(
          CategoryState(
            // ignore: prefer_const_literals_to_create_immutables
            categoryList: [],
          ),
        );
}
