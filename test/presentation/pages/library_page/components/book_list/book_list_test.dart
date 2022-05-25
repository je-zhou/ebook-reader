import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../helpers.dart';

class BookListTestCase {
  String testName;
  List<Book> books;
  Matcher findsN;

  BookListTestCase(this.testName, this.books, this.findsN);
}

void main() {
  group('Book list contains book list tiles', () {
    List<BookListTestCase> bookListTestCases = [
      BookListTestCase("when no books", [], findsNothing),
      BookListTestCase("when one book", [exampleBook], findsOneWidget),
      BookListTestCase("when many books", List.filled(3, exampleBook), findsNWidgets(3))
    ];

    for (var testCase in bookListTestCases) {
      testWidgets(testCase.testName, (WidgetTester tester) async {
        final bookListTile = find.byType(BookListTile);

        await tester.pumpWidget(MaterialApp(home: BookList(books: testCase.books)));

        expect(bookListTile, testCase.findsN);
      });
    }
  });
}
