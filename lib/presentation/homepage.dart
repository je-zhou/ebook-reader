import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/presentation/tab_selector.dart';

import '../application/tab/app_tab.dart';
import '../application/tab/tab_bloc.dart';
import '../application/tab/tab_event.dart';
import 'topbar.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);

    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        appBar: Topbar(
          title: activeTab.toString().replaceAll('()', '')
        ),
        body: const Center(),
        bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.add(UpdateTab(tab))
        ),
      );
    });
  }
}
