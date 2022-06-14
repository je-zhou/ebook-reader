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
        Text(book.fileType.substring(1).toUpperCase()),
        const SizedBox(width: 12),
        Text('File Size.mb'),
        const SizedBox(width: 12),
        Text('XXX Pages'),
      ],
    );
  }
}
