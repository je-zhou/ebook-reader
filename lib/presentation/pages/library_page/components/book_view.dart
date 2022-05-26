import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

import '../../../../domain/book/book.dart';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const books = [
      // Book(
      //     author: 'Fumio Sasaki',
      //     title: 'Hello Habits',
      //     imageUrl: 'assets/hello_habits.jpg'),
      // Book(
      //     author: 'Fumio Sasaki',
      //     title: 'Goodbye Things',
      //     imageUrl: 'assets/goodbye_things.jpg'),
      // Book(
      //     author: 'Fumio Sasaki',
      //     title: 'Hello Habits',
      //     imageUrl: 'assets/hello_habits.jpg'),
    ];

    ////////////////////////////////////////////////////////////
    getStoragePermission() async {
      var status = await Permission.storage.status;

      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }

    getExternalStoragePermission() async {
      var status = await Permission.manageExternalStorage.status;

      if (!status.isGranted) {
        await Permission.manageExternalStorage.request();
      }
    }

    getStoragePermission().then((_) => getExternalStoragePermission());

    late Directory dir;
    if (Theme.of(context).platform == TargetPlatform.android) {
      dir = Directory('/storage/emulated/0/EBookReader/');
    } else {
      dir = Directory(
          '/Users/jerryzhou/Library/Developer/CoreSimulator/Devices/'
          '688D1945-027C-4343-8568-341670644870/data/Containers/Shared/AppGroup/'
          '4CE5E07A-5141-4CE9-8A06-8BA52344DD4F/File Provider Storage/EbookReader');
    }

    Future<List<Book>> readDirectory() async {
      if (Directory(dir.path).existsSync()) {
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

    ////////////////////////////////////////////////////////////

    return FutureBuilder(
        future: readDirectory(),
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
