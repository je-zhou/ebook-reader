import 'package:flutter/material.dart';

import '../../../../../domain/book/book.dart';
import '../book_view_helpers.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    // List Tiles will be 1/7 of screen height
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => showBookDetails(context, book),
      child: Container(
        height: screenHeight / 7,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.memory(book.img),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.authors.join(", "),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          value: book.readProgress ?? 0,
                          backgroundColor: Colors.grey,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${((book.readProgress ?? 0) * 100).toStringAsFixed(2)}%',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        book.fileType.substring(1).toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${book.numOfChapters} Chapters',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
