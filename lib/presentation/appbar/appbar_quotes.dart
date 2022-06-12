import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/presentation/appbar/appbar_helpers.dart';

class QuotesAppbar extends StatelessWidget {
  const QuotesAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _searchButton = button(
        onPressed: () => print('Search Quotes'),
        icon: FontAwesomeIcons.magnifyingGlass);

    final Widget _filterButton = button(
        onPressed: () => print("filter pressed"),
        icon: FontAwesomeIcons.filter);

    List<Widget> iconButtons = [_searchButton, _filterButton];

    String title = 'Quotes';

    return AppBar(
      title: Text(title),
      actions: iconButtons,
    );
  }
}
