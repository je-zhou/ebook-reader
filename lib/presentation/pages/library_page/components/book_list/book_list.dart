import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../domain/book/book.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

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
          imageUrl: 'assets/goodbye_things.jpg')
    ];
    return Column(
      children: books
          .map((book) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: BookListTile(
                book: book,
              )))
          .toList(),
    );
  }
}
