import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/domain/book/book.dart';

class BDViewQuotesButton extends StatelessWidget {
  final Book book;
  const BDViewQuotesButton({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(FontAwesomeIcons.clipboard), Text('View Quotes')],
    );
  }
}
