import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_progress_bar.dart';

import 'package:test_drive/presentation/pages/library_page/components/book_details/book_details.dart';
import '../../../../helpers.dart';

void main() {
  setUp(() {});

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: BookDetails(book: exampleBook),
      ),
    );
  }

  group(
    "Test Book Details displays correctly - ",
    () {
      testWidgets('Shows book cover', (WidgetTester tester) async {
        final coverImg =
            find.widgetWithImage(ClipRRect, MemoryImage(exampleBook.img));

        await tester.pumpWidget(createWidgetUnderTest());

        expect(coverImg, findsOneWidget);
      });
      testWidgets('Shows title and author', (WidgetTester tester) async {
        String title = exampleBook.title;
        String authors = exampleBook.authors.join(', ');

        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.text(title), findsOneWidget);
        expect(find.text(authors), findsOneWidget);
      });
      testWidgets('Shows Description', (WidgetTester tester) async {
        String description = exampleBook.description ?? '';

        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.text(description), findsOneWidget);
      });
      testWidgets('Shows Metadata', (WidgetTester tester) async {
        String fileType = exampleBook.fileType.substring(1).toUpperCase();
        String fileSize = exampleBook.getFileSizeString();
        String pages = exampleBook.numOfPages != null
            ? '${exampleBook.numOfPages} pages'
            : '';

        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.text(fileType), findsOneWidget);
        expect(find.text(fileSize), findsOneWidget);
        expect(find.text(pages), findsOneWidget);
      });
      testWidgets('Shows Progress Bar', (WidgetTester tester) async {
        String progressString =
            ((exampleBook.readProgress ?? 0) * 100).toStringAsFixed(2) + ' %';

        final progressBar = find.byType(BDProgressBar);

        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.text(progressString), findsOneWidget);
        expect(progressBar, findsOneWidget);
      });
      testWidgets('View Quotes Button', (WidgetTester tester) async {
        final buttonText = find.text('View Quotes');
        final buttonIcon = find.byIcon(FontAwesomeIcons.clipboard);

        await tester.pumpWidget(createWidgetUnderTest());

        expect(buttonText, findsOneWidget);
        expect(buttonIcon, findsOneWidget);
      });
      testWidgets('Shows Continue/Start Button', (WidgetTester tester) async {
        double progress = exampleBook.readProgress ?? 0;

        String text = progress > 0 ? 'Continue' : 'Start';

        final buttonText = find.text(text);
        final buttonIcon = find.byIcon(FontAwesomeIcons.bookOpen);

        await tester.pumpWidget(createWidgetUnderTest());

        expect(buttonText, findsOneWidget);
        expect(buttonIcon, findsOneWidget);
      });
    },
  );
}
