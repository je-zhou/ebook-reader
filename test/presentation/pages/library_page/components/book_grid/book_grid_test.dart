import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid_tile.dart';

import '../../../../../helpers.dart';

void main() {
  group('Book grid contains book grid tiles', () {
    testWidgets('when no book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookGridTile);

      await tester.pumpWidget(const MaterialApp(home: BookGrid(books: [])));

      expect(bookListTile, findsNothing);
    });
    testWidgets('when one book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookGridTile);

      await tester
          .pumpWidget(const MaterialApp(home: BookGrid(books: [exampleBook])));

      expect(bookListTile, findsOneWidget);
    });
    testWidgets('when many books', (WidgetTester tester) async {
      final bookListTile = find.byType(BookGridTile);

      await tester.pumpWidget(
          MaterialApp(home: BookGrid(books: List.filled(3, exampleBook))));

      expect(bookListTile, findsNWidgets(3));
    });
  });
}
