import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../test_doubles/mock_path_provider_platform.dart';

// TODO:: Alvin have a go at creating a mock File with the test.epub asset
// I keep getting errors im not sure sry.
void main() {
  group('', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setUpAll(() async {
      PathProviderPlatform.instance = MockPathProviderPlatform();
    });

    test('Book class creates correctly from supported file', () async {
      ByteData data = await rootBundle.load('assets/test/test.epub');
      final buffer = data.buffer;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + '/temp.epub';
      File file = await File(filePath).writeAsBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

      print(file);

      // print(data);
      // print(testFile.existsSync());
      //   Book book = await Book.bookFromSupportedFile(testFile);

      //   expect(book.authors, ['James Patterson']);
      //   expect(
      //       book.title,
      //       'Hacking: Beginner to Expert Guide to Computer Hacking,'
      //       'Basic Security, and Penetration Testing');
      //   expect(book.description, 'James Patterson');

      //   expect(book.authors, ['James Patterson']);
      //   expect(book.authors, ['James Patterson']);
    });
  });
}
