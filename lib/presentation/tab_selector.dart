import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../application/tab/app_tab.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  const TabSelector({
    Key? key,
    required this.activeTab,
    required this.onTabSelected,
  }) : super(key: key);

  int _tabMap(AppTab appTab) {
    switch (appTab.runtimeType) {
      case Library:
        return 0;
      case Quotes:
        return 1;
      case Settings:
        return 2;
      default:
        return 3;
    }
  }

  AppTab _indexTabMap(int index) {
    switch (index) {
      case 0:
        return Library();
      case 1:
        return Quotes();
      case 2:
        return Settings();
      default:
        return Library();
    }
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      BottomNavigationBarItem(
          label: "Library", icon: Icon(FontAwesomeIcons.bookOpen)),
      BottomNavigationBarItem(
          label: "Quotes", icon: Icon(FontAwesomeIcons.noteSticky)),
      BottomNavigationBarItem(
          label: "Settings", icon: Icon(FontAwesomeIcons.gear))
    ];
    return BottomNavigationBar(
      key: const Key('bottomNavigationBar'),
      items: items,
      currentIndex: _tabMap(activeTab),
      onTap: (index) => onTabSelected(_indexTabMap(index))
    );
  }
}





