import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_view_state.dart';
part 'book_view_cubit.freezed.dart';

class BookViewCubit extends Cubit<BookViewState> {
  BookViewCubit() : super(BookViewState.initial());
}
