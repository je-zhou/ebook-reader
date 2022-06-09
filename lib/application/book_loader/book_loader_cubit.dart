import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/book/book.dart';
import '../../domain/book/book_repository.dart';

part 'book_loader_cubit.freezed.dart';

class BookLoaderCubit extends Cubit<BookLoaderState> {
  BookLoaderCubit(this.bookRepository) : super(const BookLoaderState.initial());
  BookRepository bookRepository;

  getBooks() async {
    emit(const BookLoaderState.loading());

    late List<Book> books;

    try {
      books = await bookRepository.getBooks();
      emit(BookLoaderState.loadSuccess(books));
    } catch (e) {
      emit(BookLoaderState.loadFailure(e.toString()));
    }
  }
}

@freezed
class BookLoaderState with _$BookLoaderState {
  const factory BookLoaderState.initial() = _Initial;
  const factory BookLoaderState.loading() = _Loading;
  const factory BookLoaderState.loadSuccess(List<Book> books) = _LoadSuccess;
  const factory BookLoaderState.loadFailure(String errorMsg) = _LoadFailure;
}
