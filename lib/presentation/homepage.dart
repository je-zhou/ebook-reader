import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:path_provider/path_provider.dart' as provider;
import 'package:epub_viewer/epub_viewer.dart';

import 'topbar.dart';
import 'menu.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    readDirectory() {
      if (Directory(dir.path).existsSync()) {
        print(dir.existsSync());
        var list =
            dir.listSync().where((element) => element.path.endsWith('.epub'));

        if (list.isNotEmpty) {
          print(list.first);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EpubScreen.fromPath(filePath: list.first.path)));
        }
      } else {
        print("no directory found");
      }
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // add your code here.
      readDirectory();
    });

    // runEpubViewer()

    return const Scaffold(
      appBar: Topbar(),
      body: PageWrapper(),
      bottomNavigationBar: Menu(),
    );
  }
}
