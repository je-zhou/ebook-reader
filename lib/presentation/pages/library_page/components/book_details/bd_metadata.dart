import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_drive/domain/book/book.dart';

class BDMetadata extends StatelessWidget {
  final Book book;
  const BDMetadata({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          book.fileType.substring(1).toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(width: 12),
        Text(
          book.getFileSizeString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(width: 12),
        book.numOfPages != null
            ? Text(
                '${book.numOfPages} pages',
                style: Theme.of(context).textTheme.subtitle1,
              )
            : const SizedBox(),
      ],
    );
  }
}
