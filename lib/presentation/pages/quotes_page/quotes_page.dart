import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/quotes_page/components/quote_bubble.dart';

import '../../../domain/quote/quote.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      QuoteBubble(quote: Quote("Hell", "wolrd")),
      QuoteBubble(quote: Quote("More Qutoes", "wolrd")),
      QuoteBubble(quote: Quote("Something", "wolrd")),
    ]);
  }
}
