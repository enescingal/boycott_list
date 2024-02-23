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
    required this.categoryId,
  });

  /// isLoading
  final bool isLoading;

  /// filterList index
  final String categoryId;

  /// searchText
  final String searchText;

  /// categoryList
  List<CategoryModel> categoryList;

  /// CompanyModel
  List<CompanyModel> companyList;

  @override
  List<Object?> get props => [
        isLoading,
        categoryId,
        categoryList,
        companyList,
        searchText,
      ];

  /// copyWith
  HomeState copyWith({
    bool? isLoading,
    String? categoryId,
    String? searchText,
    List<CategoryModel>? categoryList,
    List<CompanyModel>? companyList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      categoryId: categoryId ?? this.categoryId,
      searchText: searchText ?? this.searchText,
      categoryList: categoryList ?? this.categoryList,
      companyList: companyList ?? this.companyList,
    );
  }
}
