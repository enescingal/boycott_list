import 'package:boycott_list/feature/home/view_model/state/home_state.dart';
import 'package:boycott_list/product/state/base/base_cubit.dart';

///HomeViewModel class
final class HomeViewModel extends BaseCubit<HomeState> {
  ///HomeViewModel
  HomeViewModel()
      : super(
          const HomeState(
            selectedFilterIndex: 0,
          ),
        );

  /// FilterList
  List<String> filterList = [
    'All',
    'Car',
    'Charity',
    'Clothing',
    'Coffee',
    'Controctor',
  ];

  /// change selectedFilterIndex
  void changeSelectedIndex(int newIndex) {
    emit(
      state.copyWith(selectedFilterIndex: newIndex),
    );
  }
}
