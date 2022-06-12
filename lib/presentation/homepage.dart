import 'package:flutter/material.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:test_drive/presentation/appbar/appbar_wrapper.dart';

import 'menu.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWrapper(),
      body: PageWrapper(),
      bottomNavigationBar: Menu(),
    );
  }
}
