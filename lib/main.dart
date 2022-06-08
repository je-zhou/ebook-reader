import 'package:flutter/material.dart';
import 'package:test_drive/presentation/wrapper.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  // Initialising database
  Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}
