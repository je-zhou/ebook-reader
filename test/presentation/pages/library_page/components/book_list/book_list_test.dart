import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../helpers.dart';

void main() {
  group('Book list contains book list tiles', () {
    testWidgets('when no book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookListTile);

      await tester.pumpWidget(const MaterialApp(home: BookList(books: [])));

      expect(bookListTile, findsNothing);
    });
    testWidgets('when one book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookListTile);

      await tester.pumpWidget(const MaterialApp(home: BookList(books: [exampleBook])));

      expect(bookListTile, findsOneWidget);
    });
    testWidgets('when many books', (WidgetTester tester) async {
      final bookListTile = find.byType(BookListTile);

      await tester.pumpWidget(
          MaterialApp(home: BookList(books: List.filled(3, exampleBook))));

      expect(bookListTile, findsNWidgets(3));
    });
  });
}
