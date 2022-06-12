import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';

class LibraryAppbar extends StatelessWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

        final Widget _searchButton = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
                onPressed: () => context.read<BookViewCubit>().toggleIsSearch(),
                icon: const Icon(FontAwesomeIcons.magnifyingGlass)));

        final Widget _filterButton = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
                onPressed: () => print("filter pressed"),
                icon: const Icon(FontAwesomeIcons.filter)));

        List<Widget> iconButtons = [
          _searchButton,
          _filterButton,
          _gridOrListButton
        ];

        String title = 'Library';

        return AppBar(
          title: bookViewState.isSearch
              ? TextField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (s) => context.read<BookViewCubit>().search(s),
                )
              : Text(title),
          actions: iconButtons,
        );
      },
    );
  }
}
