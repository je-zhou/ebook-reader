import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/domain/book/book_repository.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

import '../../../../domain/book/book.dart';
import '../../../../domain/quote/quote.dart';

class QuoteBubble extends StatelessWidget {
  const QuoteBubble({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(children: [
          Text(quote.quote, style: const TextStyle(backgroundColor: Color.fromRGBO(0, 0, 255, 1)),),
          Text(quote.source)
        ]));
  }
}
