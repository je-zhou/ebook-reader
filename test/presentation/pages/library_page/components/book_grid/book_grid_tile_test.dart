import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid_tile.dart';

import '../../../../../helpers.dart';

void main() {
  testWidgets('Book grid tile shows cover',
      (WidgetTester tester) async {
    final image = find.byType(Image);

    await tester.pumpWidget(MaterialApp(home: BookGridTile(book: exampleBook)));

    expect(image, findsOneWidget);
  });
}
