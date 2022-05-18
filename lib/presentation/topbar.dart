import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/domain/book/book.dart';

import '../application/page_selector/page_selector_cubit.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      builder: (context, pageSelectorState) {
        late String title;
        late List<IconData> icons;

        pageSelectorState.map(library: (_) {
          title = 'Library';
          icons = [
            FontAwesomeIcons.magnifyingGlass,
            FontAwesomeIcons.filter,
            // Grid/List icon added seperately since depends on BookViewState
          ];
        }, quotes: (_) {
          title = 'Quotes';
          icons = [
            FontAwesomeIcons.magnifyingGlass,
            FontAwesomeIcons.filter,
          ];
        }, settings: (_) {
          title = 'Settings';
          icons = [
            FontAwesomeIcons.magnifyingGlass,
          ];
        });

        return BlocBuilder<BookViewCubit, BookViewState>(
          builder: (context, bookViewState) {
            List<Widget> iconButtons = icons
                .map((IconData icon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(icon),
                    ))
                .toList();

            pageSelectorState.mapOrNull(
              library: (_) => iconButtons.add(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    key: const Key('Book View Toggle'),
                    onTap: () => context.read<BookViewCubit>().toggleBookView(),
                    child: Icon(bookViewState.isGridView
                        ? FontAwesomeIcons.list
                        : FontAwesomeIcons.borderAll),
                  ),
                ),
              ),
            );

            return AppBar(
              title: Text(title),
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
