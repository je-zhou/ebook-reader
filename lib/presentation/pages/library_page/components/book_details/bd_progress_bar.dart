import 'package:flutter/material.dart';
import 'package:test_drive/domain/book/book.dart';

class BDProgressBar extends StatelessWidget {
  final Book book;
  final double width;
  const BDProgressBar({Key? key, required this.book, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = book.readProgress ?? 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 6,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              height: 6,
              width: width * progress,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
        const SizedBox(width: 8),
        Text(
          '${(progress * 100).toStringAsFixed(2)} %',
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
