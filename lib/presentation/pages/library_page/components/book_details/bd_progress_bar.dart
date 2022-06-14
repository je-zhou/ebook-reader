import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_drive/domain/book/book.dart';

class BDProgressBar extends StatelessWidget {
  final Book book;
  final double width;
  const BDProgressBar({Key? key, required this.book, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white38, borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          height: 6,
          width: width * book.readProgress!,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(8)),
        )
      ],
    );
  }
}
