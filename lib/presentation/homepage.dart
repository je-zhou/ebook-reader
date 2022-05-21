import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:path_provider/path_provider.dart' as provider;
import 'package:epub_viewer/epub_viewer.dart';

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
      dir = Directory(
          '/Users/jerryzhou/Library/Developer/CoreSimulator/Devices/'
          '688D1945-027C-4343-8568-341670644870/data/Containers/Shared/AppGroup/'
          '4CE5E07A-5141-4CE9-8A06-8BA52344DD4F/File Provider Storage/EbookReader');
    }

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

    runEpubViewer() {
      EpubViewer.setConfig(
          themeColor: Theme.of(context).primaryColor,
          identifier: "iosBook",
          scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
          allowSharing: true,
          enableTts: true,
          nightMode: true);

      EpubViewer.open(
        "${dir.path}/Fumio Sasaki - Hello, Habits-W. W. Norton & Company (2020).epub",
      );
    }

    // runEpubViewer()

    return const Scaffold(
      appBar: Topbar(),
      body: PageWrapper(),
      bottomNavigationBar: Menu(),
    );
  }
}
