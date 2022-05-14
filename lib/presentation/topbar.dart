import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/menu/menu_cubit.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const libraryIcons = [
      FontAwesomeIcons.magnifyingGlass,
      FontAwesomeIcons.filter,
      FontAwesomeIcons.borderAll
    ];

    List<Widget> iconButtons = libraryIcons
        .map((IconData icon) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(icon),
            ))
        .toList();

    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        late String title;

        state.map(library: (_) {
          title = 'Library';
        },quotes: (_) {
          title = 'Quotes';
        },settings: (_) {
          title = 'Settings';
        });

        return AppBar(
          title: Text(title),
          actions: iconButtons,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
