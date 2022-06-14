import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_drive/domain/book/book.dart';

class BDDescription extends StatelessWidget {
  final Book book;
  const BDDescription({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text(
        book.description ?? '',
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
