import 'package:flutter/material.dart';
import 'package:test_drive/domain/book/book.dart';

import 'book_grid_tile.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    var aspectRatio = 0.655 ;
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: aspectRatio,
      ),
      children: books
          .map((book) => BookGridTile(
            book: book,
          ))
          .toList(),
    );
  }
}
