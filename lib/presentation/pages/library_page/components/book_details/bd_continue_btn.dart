import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view_helpers.dart';

class BDContinueButton extends StatelessWidget {
  final Book book;
  const BDContinueButton({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => openBook(context, book),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(FontAwesomeIcons.bookOpen),
          SizedBox(width: 12),
          Text('Continue')
        ],
      ),
    );
  }
}
