import 'package:flutter/material.dart';

import '../../../../domain/quote/quote.dart';

class QuoteBubble extends StatelessWidget {
  const QuoteBubble({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        quote.quote,
        style: const TextStyle(backgroundColor: Color.fromRGBO(0, 100, 200, 0.7)),
      ),
      Text(quote.source)
    ]);
  }
}
