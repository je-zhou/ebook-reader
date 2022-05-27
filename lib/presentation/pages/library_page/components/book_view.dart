
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

import '../../../../domain/book/book.dart';

import 'dart:io';

import 'package:universal_io/io.dart';

import '../../../../utils.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStoragePermission().then((_) => getExternalStoragePermission());
    Directory dir = getEbookDirectory(Theme.of(context).platform);

    Future<List<Book>> readDirectory(String directoryPath) async {
      if (Directory(directoryPath).existsSync()) {
        List<FileSystemEntity> list = dir
            .listSync()
            .where((element) => element.path.endsWith('.epub'))
            .toList();

        // TODO:: Implement logic into a bloc
        // List<Book> books = list.map((file) {
        //   late Book book;
        //   Book.bookFromSupportedFile(file).then((value) => book = value);
        //   return book;
        // }).toList();

        return [];
      } else {
        print("no directory found");
      }
      return [];
    }

    return FutureBuilder(
        future: readDirectory(dir.path),
        builder: ((context, snapshot) =>
            BlocBuilder<BookViewCubit, BookViewState>(
              builder: (context, state) {
                if (snapshot.hasData) {
                  if (state.isGridView) {
                    return BookGrid(books: snapshot.data as List<Book>);
                  } else {
                    return BookList(books: snapshot.data as List<Book>);
                  }
                }
                return const CircularProgressIndicator();
              },
            )));
  }
}
