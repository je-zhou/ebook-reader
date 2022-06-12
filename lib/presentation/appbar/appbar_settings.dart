import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _searchButton = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
            onPressed: () => print("search settings"),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass)));

    List<Widget> iconButtons = [_searchButton];

    String title = 'Settings';

    return AppBar(
      title: Text(title),
      actions: iconButtons,
    );
  }
}
