import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:path_provider/path_provider.dart' as provider;

import 'topbar.dart';
import 'menu.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Directory dir;
    if (Theme.of(context).platform == TargetPlatform.android) {
      dir = Directory('/storage/emulated/0/EbookReader');
    } else {
      dir = Directory('/storage/emulated/0/EbookReader');
    }

    provider.getApplicationDocumentsDirectory().then((value) => print(value));

    readDirectory() {
      if (Directory(dir.path).existsSync()) {
        print(dir.existsSync());
        var list = dir
            .listSync(followLinks: true, recursive: true)
            .map((e) => e)
            .toList();
        print(list);
      } else {
        print("no directory found");
      }
    }

    readDirectory();

    return const Scaffold(
      appBar: Topbar(),
      body: PageWrapper(),
      bottomNavigationBar: Menu(),
    );
  }
}
