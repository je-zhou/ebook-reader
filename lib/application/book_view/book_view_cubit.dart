import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_view_cubit.freezed.dart';

class BookViewCubit extends Cubit<BookViewState> {
  BookViewCubit() : super(BookViewState.initial());

  void toggleBookView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void search(String str) {
    emit(state.copyWith(searchBy: str));
  }

  void clearSearch() {
    emit(state.copyWith(searchBy: ""));
  }

  void toggleIsSearch() {
    emit(state.copyWith(searchBy: "Hello", isSearch: !state.isSearch));
  }
}

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
