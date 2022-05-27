import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

import '../../../../../helpers.dart';

void main() {
  testWidgets('Book list tile contains information',
      (WidgetTester tester) async {
    final titleText = find.text(exampleBook.title);
    final authorText = find.text(exampleBook.authors.first);
    final image = find.byType(Image);

    await tester.pumpWidget(MaterialApp(home: BookListTile(book: exampleBook)));

    expect(titleText, findsOneWidget);
    expect(authorText, findsOneWidget);
    expect(image, findsOneWidget);
  });
}
