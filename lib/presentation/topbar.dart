import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const libraryIcons = [
      FontAwesomeIcons.magnifyingGlass,
      FontAwesomeIcons.filter,
      FontAwesomeIcons.borderAll
    ];

    List<Widget> iconButtons = libraryIcons.map((IconData icon) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icon),
    )).toList();

    return AppBar(
      title: Text("Library"),
      actions: iconButtons,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
