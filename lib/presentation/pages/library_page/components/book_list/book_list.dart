import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../domain/book/book.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookListTile(
      book: Book(
          author: 'Fumio Sasaki',
          title: 'Hello Habits',
          imageUrl: 'assets/hello_habits.jpg'),
    );
  }
}
