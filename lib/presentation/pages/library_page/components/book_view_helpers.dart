import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';
import 'package:test_drive/application/book_loader/book_loader_cubit.dart';
import 'package:test_drive/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/book/book.dart';

void openBook(BuildContext context, Book book) async {
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
              location: book.lastLocation,
              // CALLBACK FUNCTION IS CALLED WHENEVER A NEW SPINEITEM IS NAVIGATED TO
              callback: saveToDatabase,
            )),
  );

  saveToDatabase(result['locator']);
  context.read<BookLoaderCubit>().getBooks();
}
