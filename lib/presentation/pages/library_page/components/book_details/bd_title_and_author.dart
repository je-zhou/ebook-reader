import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_drive/domain/book/book.dart';

class BDTitleAndAuthor extends StatelessWidget {
  final Book book;
  const BDTitleAndAuthor({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          book.authors.join(', '),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
