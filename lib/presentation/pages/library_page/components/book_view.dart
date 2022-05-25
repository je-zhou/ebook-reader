import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

import '../../../../domain/book/book.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const books = [
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Goodbye Things',
          imageUrl: 'assets/goodbye_things.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Goodbye Things',
          imageUrl: 'assets/goodbye_things.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
      Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
    ];
    return BlocBuilder<BookViewCubit, BookViewState>(
      builder: (context, state) {
        if (state.isGridView) {
          return const BookGrid(books: books);
        } else {
          return const BookList(books: books);
        }
      },
    );
  }
}
