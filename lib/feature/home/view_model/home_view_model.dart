import 'package:boycott_list/feature/home/view_model/state/home_state.dart';
import 'package:boycott_list/product/service/interface/category_operation.dart';
import 'package:boycott_list/product/service/interface/company_operation.dart';
import 'package:boycott_list/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

///HomeViewModel class
final class HomeViewModel extends BaseCubit<HomeState> {
  ///HomeViewModel
  HomeViewModel({
    required CategoryOperation categoryOperation,
    required CompanyOperation companyOperation,
  })  : _categoryOperation = categoryOperation,
        _companyOperation = companyOperation,
        super(
          HomeState(
            categoryId: 'All',
            searchText: '',
            // ignore: prefer_const_literals_to_create_immutables
            companyList: [],
            // ignore: prefer_const_literals_to_create_immutables
            categoryList: [], isLoading: false,
          ),
        );

  /// categoryService
  final CategoryOperation _categoryOperation;

  /// companyService
  final CompanyOperation _companyOperation;

  /// pageIndex
  int pageIndex = 1;

  /// endOfFile
  bool endOfFile = false;

  /// barcode scan
  Future<void> scanBarcode(String newSearch) async {
    clearFilter();
    emit(
      state.copyWith(searchText: newSearch),
    );
    await getCompanyList();
  }

  /// change selectedFilterIndex
  Future<void> changeSelectedId(CategoryModel selectedCategory) async {
    clearFilter(clearSearch: true);
    emit(
      state.copyWith(categoryId: selectedCategory.id),
    );
    await getCompanyList();
  }

  /// changeLoading
  void changeLoading(bool newLoading) {
    emit(state.copyWith(isLoading: newLoading));
  }

  /// getCategoryList
  Future<void> getCategoryList() async {
    changeLoading(true);
    final categoryList = await _categoryOperation.getCategory();
    changeLoading(false);
    if (categoryList.ext.isNotNullOrEmpty) {
      emit(
        state.copyWith(
          categoryList: state.categoryList
            ..addAll(
              categoryList,
            ),
        ),
      );
    }
  }

  /// getCompanyList
  Future<void> getCompanyList({
    bool isLoad = false,
  }) async {
    if (isLoad) {
      if (endOfFile) return;
      pageIndex++;
    }
    if (!endOfFile) {
      changeLoading(true);
      final companyList = await _companyOperation.getCompany(
        categoryId: state.categoryId,
        search: state.searchText,
        page: pageIndex,
        limit: 10,
      );
      changeLoading(false);
      if (companyList.data.ext.isNotNullOrEmpty) {
        emit(
          state.copyWith(
            companyList: state.companyList
              ..addAll(
                companyList.data ?? [],
              ),
          ),
        );
        checkEndOfFile(modelLength: companyList.data?.length ?? 0);
      }
    }
  }

  /// endOfFileCheck
  void checkEndOfFile({required int modelLength}) {
    if (modelLength == 10) {
      endOfFile = false;
    } else {
      endOfFile = true;
    }
  }

  /// filterClear
  void clearFilter({
    bool clearList = true,
    bool clearSearch = false,
    bool clearCategory = false,
    bool clearPageIndex = true,
  }) {
    if (clearList) emit(state.copyWith(companyList: []));
    if (clearSearch) emit(state.copyWith(searchText: ''));
    if (clearCategory) emit(state.copyWith(categoryId: ''));
    if (clearPageIndex) pageIndex = 1;
  }

  /// viewModelInitState
  Future<void> viewModelInitState() async {
    await getCompanyList();
    await getCategoryList();
    return Future.value();
  }
}
