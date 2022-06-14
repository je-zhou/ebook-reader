import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mno_shared/publication.dart';
import 'package:mno_streamer/parser.dart';
import 'package:test_drive/utils.dart';
import 'package:universal_io/io.dart';
import 'package:path/path.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const Book._();

  factory Book({
    String? id,
    String? href,
    String? description,
    int? numOfChapters,
    String? lastLocation,
    double? readProgress,
    required int fileSizeInBytes,
    required String fileType,
    required String path,
    required String title,
    required List<String> authors,
    required Uint8List img,
  }) = _Book;

  static Future<Book> bookFromSupportedFile(FileSystemEntity file) async {
    EpubParser parser = EpubParser();

    late PubBox? pubBox;
    await parser.parse(file.path).then((value) => pubBox = value);
    Publication pub = pubBox!.publication;

    pub.metadata.authors.map((a) => a.name).toList();

    String title = pub.metadata.title;
    List<String> authors = pub.metadata.authors.map((a) => a.name).toList();

    // Getting the img
    late Uint8List img;

    await pub.fetcher
        .get(pub.coverLink!)
        .read()
        .then((value) => img = value.getOrNull()!.buffer.asUint8List());

    // Last Location
    var bookProgressBox = await Hive.openLazyBox(HiveBoxNames.bookProgressBox);

    Map? bookProgress =
        await bookProgressBox.get('$title - ${authors.join(',')}');

    String? lastLocationId;
    double? readProgress;

    if (bookProgress != null) {
      lastLocationId = bookProgress['lastLocation'];
      readProgress = bookProgress['progress'];
    }

    return Book(
        authors: authors,
        title: title,
        description: pub.metadata.description,
        numOfChapters: pub.manifest.tableOfContents.length,
        path: file.path,
        fileSizeInBytes: file is File ? file.lengthSync() : 0,
        lastLocation: lastLocationId,
        readProgress: readProgress,
        img: img,
        fileType: extension(file.path));
  }

  String getBoxName() => '$title - ${authors.join(',')}';

  String getFileSizeString() {
    // KB
    if (fileSizeInBytes > 1000) {
      return '${fileSizeInBytes / 1000}KB';
    }
    // MB
    else if (fileSizeInBytes > 1000000) {
      return '${fileSizeInBytes / 1000000}MB';
    }
    return '${fileSizeInBytes}B';
  }
}
