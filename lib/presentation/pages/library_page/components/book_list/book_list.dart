import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../domain/book/book.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
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
