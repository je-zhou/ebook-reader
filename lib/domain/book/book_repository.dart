import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';
import 'book.dart';

class BookRepository {
  TargetPlatform platform;
  BookRepository(this.platform);

  List<Directory> getDirectories() {
    List<Directory> androidDir = [
      Directory('/storage/emulated/0/EBookReader/'),
      Directory('/storage/emulated/0/Download/'),
      Directory('/storage/emulated/0/Document/'),
    ];
    List<Directory> iOSDir = [
      Directory('/Users/jerryzhou/Library/Developer/CoreSimulator/Devices/'
          '688D1945-027C-4343-8568-341670644870/data/Containers/Shared/AppGroup/'
          '4CE5E07A-5141-4CE9-8A06-8BA52344DD4F/File Provider Storage/EbookReader')
    ];
    return platform == TargetPlatform.android ? androidDir : iOSDir;
  }

  Future<List<Book>> getBooks() async {
    await getStoragePermission();
    await getExternalStoragePermission();

    List<Directory> directories = getDirectories();
    List<FileSystemEntity> files = [];

    for (var i = 0; i < directories.length; i++) {
      Directory dir = directories[i];

      if (!dir.existsSync()) continue;

      Iterable<FileSystemEntity> dirFiles =
          dir.listSync().where((file) => file.path.endsWith('.epub'));

      files.addAll(dirFiles);
    }

    List<Book> books = await Stream.fromIterable(files).asyncMap((file) =>
        Book.bookFromSupportedFile(file)
    ).toList();

    return books;
  }

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
}
