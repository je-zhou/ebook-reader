import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/quotes_page/components/quote_bubble.dart';

import '../../../../domain/book/book.dart';
import '../../../../domain/quote/quote.dart';

class BookQuotes extends StatelessWidget {
  const BookQuotes({Key? key, required this.quotes, required this.book})
      : super(key: key);

  final List<Quote> quotes;
  final Book book;

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.2;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
          child: Container(
              width: cWidth,
              child: Column(
                  children: [BookCover(cover: book.img), Text(book.title)]))),
      Flexible(
          child: Column(
              children:
                  quotes.map((quote) => QuoteBubble(quote: quote)).toList()))
    ]);
  }
}

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.cover,
  }) : super(key: key);

  final Uint8List cover;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(image: MemoryImage(cover), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
