import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list_tile.dart';

void main() {
  testWidgets('Book list tile contains information',
      (WidgetTester tester) async {
    const imageUrl =
        'assets/hello_habits.jpg'; // prefer if i can use a dummy path :/
    const title = 'title';
    const author = 'author';
    const book = Book(imageUrl: imageUrl, title: title, author: author);

    final titleText = find.text(title);
    final authorText = find.text(author);
    final image = find.image(const AssetImage(imageUrl));

    await tester.pumpWidget(const MaterialApp(home: BookListTile(book: book)));

    expect(titleText, findsOneWidget);
    expect(authorText, findsOneWidget);
    expect(image, findsOneWidget);
  });
}
