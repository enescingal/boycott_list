import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

///CategoryState class
final class CategoryState extends Equatable {
  ///CategoryState
  CategoryState({
    required this.categoryList,
  });

  /// categoryList
  List<CategoryModel> categoryList;

  @override
  List<Object?> get props => [categoryList];

  /// copyWith
  CategoryState copyWith({List<CategoryModel>? categoryList}) {
    return CategoryState(categoryList: categoryList ?? this.categoryList);
  }
}
