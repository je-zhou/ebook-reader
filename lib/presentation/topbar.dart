import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';

import '../application/page_selector/page_selector_cubit.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      builder: (context, pageSelectorState) {
        return BlocBuilder<BookViewCubit, BookViewState>(
          builder: (context, bookViewState) {
            final Widget _gridOrListButton = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                onPressed: () => context.read<BookViewCubit>().toggleBookView(),
                icon: Icon(bookViewState.isGridView
                    ? FontAwesomeIcons.list
                    : FontAwesomeIcons.borderAll),
              ),
            );

            var searchController = TextEditingController();
            final Widget _searchButton = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                    onPressed: () =>
                        context.read<BookViewCubit>().toggleIsSearch(searchController.text),
                    icon: const Icon(FontAwesomeIcons.magnifyingGlass)));

            final Widget _filterButton = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                    onPressed: () =>
                        print("filter pressed"),
                    icon: const Icon(FontAwesomeIcons.filter)));

            List<Widget> iconButtons = pageSelectorState.map(
              library: (_) => [_searchButton, _filterButton, _gridOrListButton],
              quotes: (_) => [_searchButton, _filterButton],
              settings: (_) => [_searchButton]
            );

            // lol
            String title = pageSelectorState.toString().split('.').last.replaceAll('()', '');
            title = title.substring(0, 1).toUpperCase() + title.substring(1);

            return AppBar(
              //TODO: whenever onchange it bugs uf the textfield (ideally use onchanged)
              title: bookViewState.isSearch ? TextField(controller: searchController, onEditingComplete: () => context.read<BookViewCubit>().search(searchController.text),) : Text(title),
              actions: iconButtons,
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
