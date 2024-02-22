import 'package:equatable/equatable.dart';

///HomeState class
final class HomeState extends Equatable {
  ///HomeState
  const HomeState({
    required this.searchText,
    required this.selectedFilterIndex,
  });

  /// filterList index
  final int selectedFilterIndex;

  /// searchText
  final String searchText;

  @override
  List<Object?> get props => [selectedFilterIndex, searchText];

  /// copyWith
  HomeState copyWith({int? selectedFilterIndex, String? searchText}) {
    return HomeState(
      selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
      searchText: searchText ?? this.searchText,
    );
  }
}
