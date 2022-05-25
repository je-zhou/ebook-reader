import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid_tile.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

void main() {
  group('Book grid contains book grid tiles', () {
    const imageUrl =
        'assets/hello_habits.jpg'; // prefer if i can use a dummy path :/
    const title = 'title';
    const author = 'author';
    const book = Book(imageUrl: imageUrl, title: title, author: author);
    testWidgets('when no book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookGridTile);

      await tester.pumpWidget(const MaterialApp(home: BookList(books: [])));

      expect(bookListTile, findsNothing);
    });
    testWidgets('when one book', (WidgetTester tester) async {
      final bookListTile = find.byType(BookGridTile);

      await tester.pumpWidget(const MaterialApp(home: BookList(books: [book])));

      expect(bookListTile, findsOneWidget);
    });
    testWidgets('when many books', (WidgetTester tester) async {
      final bookListTile = find.byType(BookListTile);

      await tester.pumpWidget(
          const MaterialApp(home: BookList(books: [book, book, book])));

      expect(bookListTile, findsNWidgets(3));
    });
  });
}
