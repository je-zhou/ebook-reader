part of 'book_view_cubit.dart';

@freezed
class BookViewState with _$BookViewState {
  const factory BookViewState({
    required bool isGridView,
    required String searchBy,
    required bool isSearch,
    //TODO:: Create a filter settings class
    //required FilterSettings filterSettings,
  }) = _BookViewState;

  factory BookViewState.initial() =>
      const BookViewState(isGridView: false, searchBy: "", isSearch: false);
}
