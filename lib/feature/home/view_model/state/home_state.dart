import 'package:equatable/equatable.dart';

///HomeState class
final class HomeState extends Equatable {
  ///HomeState
  const HomeState({
    required this.selectedFilterIndex,
  });

  /// filterList index
  final int selectedFilterIndex;

  @override
  List<Object?> get props => [selectedFilterIndex];

  /// copyWith
  HomeState copyWith({int? selectedFilterIndex}) {
    return HomeState(
      selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
    );
  }
}
