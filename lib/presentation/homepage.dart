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
    final Directory _photoDir = Directory('/storage/emulated/0/EbookReader');

    readDirectory() {
      print(_photoDir.existsSync());
      var list = _photoDir.listSync().map((e) => e).toList();
      print(list);
    }

    readDirectory();

    return const Scaffold(
      appBar: Topbar(),
      body: PageWrapper(),
      bottomNavigationBar: Menu(),
    );
  }
}
