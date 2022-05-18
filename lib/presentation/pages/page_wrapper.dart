import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/library_page.dart';

import 'quotes_page/quotes_page.dart';
import 'settings_page/settings_page.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      builder: (context, state) {
        return state.map(
          library: (_) => const LibraryPage(),
          settings: (_) => const SettingsPage(),
          quotes: (_) => const QuotesPage(),
        );
      },
    );
  }
}
