import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/presentation/appbar/appbar_library.dart';
import 'package:test_drive/presentation/appbar/appbar_quotes.dart';
import 'package:test_drive/presentation/appbar/appbar_settings.dart';

class AppbarWrapper extends StatelessWidget with PreferredSizeWidget{
  const AppbarWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      builder: (context, state) {
        return state.map(
          library: (_) => const LibraryAppbar(),
          settings: (_) => const SettingsAppbar(),
          quotes: (_) => const QuotesAppbar(),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
