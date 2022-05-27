
import 'dart:typed_data';

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

        const List<int> kTransparentImage = <int>[
          0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49,
          0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x08, 0x06,
          0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00, 0x06, 0x62, 0x4B,
          0x47, 0x44, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0xA0, 0xBD, 0xA7, 0x93, 0x00,
          0x00, 0x00, 0x09, 0x70, 0x48, 0x59, 0x73, 0x00, 0x00, 0x0B, 0x13, 0x00, 0x00,
          0x0B, 0x13, 0x01, 0x00, 0x9A, 0x9C, 0x18, 0x00, 0x00, 0x00, 0x07, 0x74, 0x49,
          0x4D, 0x45, 0x07, 0xE6, 0x03, 0x10, 0x17, 0x07, 0x1D, 0x2E, 0x5E, 0x30, 0x9B,
          0x00, 0x00, 0x00, 0x0B, 0x49, 0x44, 0x41, 0x54, 0x08, 0xD7, 0x63, 0x60, 0x00,
          0x02, 0x00, 0x00, 0x05, 0x00, 0x01, 0xE2, 0x26, 0x05, 0x9B, 0x00, 0x00, 0x00,
          0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
        ];
        return [Book(path: '', title: 'title', authors: ['a'], img: Uint8List.fromList(kTransparentImage))];
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
