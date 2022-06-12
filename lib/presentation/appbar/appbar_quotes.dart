import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuotesAppbar extends StatelessWidget {
  const QuotesAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _searchButton = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
            onPressed: () => print("search quotes"),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass)));

    final Widget _filterButton = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
            onPressed: () => print("filter quotes"),
            icon: const Icon(FontAwesomeIcons.filter)));

    List<Widget> iconButtons = [_searchButton, _filterButton];

    String title = 'Quotes';

    return AppBar(
      title: Text(title),
      actions: iconButtons,
    );
  }
}
