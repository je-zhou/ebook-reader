import 'package:flutter/material.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';

void openBook(BuildContext context, String path) {
  Navigator.push(
    context,
    MaterialPageRoute(
      // the cfi cant be null, but empty string is ok
      // the idref is the path minus the server
      // not sure how to solve
        builder: (context) => EpubScreen.fromPath(filePath: path, location:  '{"cfi":"","idref":"Chapter03"}',)),
  );
}
