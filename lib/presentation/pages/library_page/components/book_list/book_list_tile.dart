import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../domain/book/book.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(children: [
          Image.memory(book.img),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                // TODO:: Seperate Multiple Authors by , e.g "Jerry Zhou, Alvin Zhao"
                Text(book.authors.first, style: const TextStyle(fontSize: 12)),
              ]),
        ]));
  }
}
