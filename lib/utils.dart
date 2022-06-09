import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/book/book.dart';

Future<File> writeToFile(ByteData data) async {
  final buffer = data.buffer;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  var filePath = tempPath + '/temp.tmp';
  return File(filePath)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

class HiveBoxNames {
  static get bookProgressBox => 'bookProgress';
  static get settingsBox => 'settings';
  static get bookQuotesBox => 'bookQuotes';
}

extension ListBookExtensions on List<Book> {
  List<Book> filterTitle(String searchTerm) {
    return where((book) => book.title.contains(searchTerm)).toList();
  }

  List<Book> filterAuthor(String searchTerm) {
    // TODO: should iterate over authors and check if it contains searchTerm
    return where((book) => book.authors.contains(searchTerm)).toList();
  }

  List<Book> filterBookBySearch(String searchTerm) {
    return filterTitle(searchTerm) + filterAuthor(searchTerm);
  }
}
