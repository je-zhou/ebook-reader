import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

import '../../../../utils.dart';

import 'dart:typed_data';

import 'book.dart';

class BookRepository {
  TargetPlatform platform;
  BookRepository(this.platform);

  Future<List<Book>> getBookList() async {
    return [];
  }

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

  //   getStoragePermission().then((_) => getExternalStoragePermission());
  // Directory dir = getEbookDirectory(Theme.of(context).platform);

  Future<List<Book>> readDirectory(String directoryPath) async {
    await getStoragePermission();
    await getExternalStoragePermission();

    // if (Directory(directoryPath).existsSync()) {
    //   List<FileSystemEntity> list = dir
    //       .listSync()
    //       .where((element) => element.path.endsWith('.epub'))
    //       .toList();

    // TODO:: Implement logic into a bloc
    // List<Book> books = list.map((file) {
    //   late Book book;
    //   Book.bookFromSupportedFile(file).then((value) => book = value);
    //   return book;
    // }).toList();

    //   return [];
    // } else {
    //   print("no directory found");
    // }
    return [];
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
