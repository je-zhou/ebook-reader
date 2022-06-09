import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/domain/book/book_repository.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/utils.dart';

import '../../../../domain/book/book.dart';


class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookRepository bookRepository = BookRepository(Theme.of(context).platform);
    return FutureBuilder(
        future: bookRepository.getBooks(),
        builder: ((context, snapshot) =>
            BlocBuilder<BookViewCubit, BookViewState>(
              builder: (context, state) {
                if (snapshot.hasData) {
                  var books = snapshot.data as List<Book>;
                  if (state.isSearch) {
                    books = books.filterBookBySearch(state.searchBy);
                  }
                  if (state.isGridView) {
                    return BookGrid(books: books);
                  } else {
                    return BookList(books: books);
                  }
                }
                return const CircularProgressIndicator();
              },
            )));
  }
}
