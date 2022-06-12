import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'appbar_helpers.dart';

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _searchButton = button(
        onPressed: () => print('Search Settings'),
        icon: FontAwesomeIcons.magnifyingGlass);

    List<Widget> iconButtons = [_searchButton];

    String title = 'Settings';

    return AppBar(
      title: Text(title),
      actions: iconButtons,
    );
  }
}
