import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/quotes_page/components/quote_bubble.dart';

import '../../../domain/quote/quote.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      QuoteBubble(quote: Quote("Success isn’t found in the eyes of others: buying things you don’t need, with money you don’t have, to impress people you won’t know in 20 years’ time.", "Chapter 1 “Domino your debts”")),
      QuoteBubble(quote: Quote("Success isn’t found in the eyes of others: buying things you don’t need, with money you don’t have, to impress people you won’t know in 20 years’ time.", "Chapter 2 “Domino your debts”")),
      QuoteBubble(quote: Quote("Success isn’t found in the eyes of others: buying things you don’t need, with money you don’t have, to impress people you won’t know in 20 years’ time.", "Chapter 3 “Domino your debts”")),
    ]);
  }
}
