import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/domain/quote/quote.dart';
import 'package:test_drive/presentation/pages/quotes_page/components/quote_bubble.dart';

void main() {
  testWidgets('Quote bubble contains information',
          (WidgetTester tester) async {
        final quote = Quote('a quote', 'a source');
        final quoteText = find.text(quote.quote);
        final sourceText = find.text(quote.source);

        await tester.pumpWidget(MaterialApp(home: QuoteBubble(quote: quote,)));

        expect(quoteText, findsOneWidget);
        expect(sourceText, findsOneWidget);
      });
}
