import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';
import 'package:test_drive/utils.dart';

import '../../../../domain/book/book.dart';

void openBook(BuildContext context, Book book) async {
  String locationChapter = book.lastLocation ?? '';

  void saveToDatabase(String lastLocation) async {
    Hive.openLazyBox(HiveBoxNames.bookLocationBox)
        .then((box) => box.put(book.getBoxName(), lastLocation));
    print('saved location - $lastLocation - for ${book.getBoxName()}');
  }

  final result = await Navigator.push(
    context,
    MaterialPageRoute(
        // the cfi cant be null, but empty string is ok
        // the idref is the path minus the server
        // not sure how to solve
        builder: (context) => EpubScreen.fromPath(
              filePath: book.path,
              location: '{"cfi":"","idref":"$locationChapter"}',
              // CALLBACK FUNCTION IS CALLED WHENEVER A NEW SPINEITEM IS NAVIGATED TO
              callback: saveToDatabase,
            )),
  );
}
