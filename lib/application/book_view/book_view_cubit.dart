import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_view_state.dart';
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
    emit(state.copyWith(isSearch: !state.isSearch));
  }
}
