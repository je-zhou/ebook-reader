import 'package:flutter/material.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view_helpers.dart';

class BookGridTile extends StatelessWidget {
  const BookGridTile({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openBook(context, book),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              key: const Key("Book Cover"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: MemoryImage(book.img), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black12,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
