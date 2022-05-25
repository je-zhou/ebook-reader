import 'package:flutter/material.dart';
import 'package:test_drive/domain/book/book.dart';

class BookGridTile extends StatelessWidget {
  const BookGridTile({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: AssetImage(
            book.imageUrl,
          ),
      ),
    );
  }
}
