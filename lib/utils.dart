import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

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

Directory getEbookDirectory(TargetPlatform platform) =>
    platform == TargetPlatform.android ?
    Directory('/storage/emulated/0/EBookReader/') :
    Directory(
        '/Users/jerryzhou/Library/Developer/CoreSimulator/Devices/'
            '688D1945-027C-4343-8568-341670644870/data/Containers/Shared/AppGroup/'
            '4CE5E07A-5141-4CE9-8A06-8BA52344DD4F/File Provider Storage/EbookReader');
