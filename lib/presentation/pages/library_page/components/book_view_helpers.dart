import 'package:flutter/material.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';

void openBook(BuildContext context, String path) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => EpubScreen.fromPath(filePath: path)),
  );
}
