import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = [
      BottomNavigationBarItem(label: "Library", icon: Icon(FontAwesomeIcons.bookOpen)),
      BottomNavigationBarItem(label: "Quotes", icon: Icon(FontAwesomeIcons.noteSticky)),
      BottomNavigationBarItem(label: "Settings", icon: Icon(FontAwesomeIcons.gear))
    ];
    return BottomNavigationBar(items: items, key: const Key('bottomNavigationBar'));
  }
}
