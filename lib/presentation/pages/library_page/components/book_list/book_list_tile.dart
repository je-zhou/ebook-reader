import 'package:flutter/material.dart';

import '../../../../../domain/book/book.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
          children:[
            Row(children:[
              Text(book.title),
            ]),
            Row(children:[
              Text(book.author),
            ]),
            const Image(image: AssetImage('assets/hello_habits.jpg',), width: 100),
          ])
    );
  }
}
