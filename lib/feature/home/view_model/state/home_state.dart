import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

///HomeState class
final class HomeState extends Equatable {
  ///HomeState
  HomeState({
    required this.isLoading,
    required this.categoryList,
    required this.companyList,
    required this.searchText,
    required this.selectedCategory,
  });

  /// isLoading
  final bool isLoading;

  /// filterList index
  final CategoryModel selectedCategory;

  /// searchText
  final String searchText;

  /// categoryList
  List<CategoryModel> categoryList;

  /// CompanyModel
  List<CompanyModel> companyList;

  @override
  List<Object?> get props => [
        isLoading,
        selectedCategory,
        categoryList,
        companyList,
        searchText,
      ];

  /// copyWith
  HomeState copyWith({
    bool? isLoading,
    CategoryModel? selectedCategory,
    String? searchText,
    List<CategoryModel>? categoryList,
    List<CompanyModel>? companyList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchText: searchText ?? this.searchText,
      categoryList: categoryList ?? this.categoryList,
      companyList: companyList ?? this.companyList,
    );
  }
}
