import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/menu.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

void main() {
  testWidgets('Book list tile contains information',
      (WidgetTester tester) async {
    const imageUrl = 'imageUrl';
    const title = 'title';
    const author = 'author';
    const book = Book(imageUrl: imageUrl, title: title, author: author);

    // find
    final titleText = find.text(title);
    final authorText = find.text(author);

    // test
    await tester.pumpWidget(const MaterialApp(home: BookListTile(book: book)));

    // expect
    expect(titleText, findsOneWidget);
    expect(authorText, findsOneWidget);
  });
}
