import 'package:flutter/material.dart';

import '../../../../domain/quote/quote.dart';

class QuoteBubble extends StatelessWidget {
  const QuoteBubble({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
        child: Column(children: [
          DecoratedBox(
              decoration: const BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    quote.quote,
                    style: const TextStyle(
                        backgroundColor: Colors.lightBlueAccent),
                  ))),
          Align(
            child: Padding(
              child: Text(quote.source),
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
            alignment: Alignment.topRight,
          )
        ]));
  }
}
