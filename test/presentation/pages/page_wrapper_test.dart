import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_drive/presentation/pages/library_page/library_page.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:test_drive/presentation/pages/quotes_page/quotes_page.dart';
import 'package:test_drive/presentation/pages/settings_page/settings_page.dart';

import '../../test_doubles/mock_book_view_cubit.dart';
import '../../test_doubles/mock_page_selector_cubit.dart';

void main() {
  late MockPageSelectorCubit mockPageSelectorCubit;
  late MockBookViewCubit mockBookViewCubit;

  setUp(() {
    mockPageSelectorCubit = MockPageSelectorCubit();
    mockBookViewCubit = MockBookViewCubit();
  });

  void arrangeInitialStateIsLibraryPage() =>
      when(() => mockPageSelectorCubit.state)
          .thenReturn(const PageSelectorState.library());

  void arrangeInitialStateIsQuotesPage() =>
      when(() => mockPageSelectorCubit.state)
          .thenReturn(const PageSelectorState.quotes());

  void arrangeInitialStateIsSettingsPage() =>
      when(() => mockPageSelectorCubit.state)
          .thenReturn(const PageSelectorState.settings());

  void arrangeBookViewState() {
    when(() => mockBookViewCubit.state)
        .thenReturn(const BookViewState(isGridView: true, searchBy: ''));
  }

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageSelectorCubit>(create: (context) => mockPageSelectorCubit),
        BlocProvider<BookViewCubit>(create: (context) => mockBookViewCubit)
      ],
      child: const MaterialApp(
          home: Scaffold(
        body: PageWrapper(),
      )),
    );
  }

  group("Test page wrapper returns correct page", () {
    testWidgets('Shows Library Page correctly', (WidgetTester tester) async {
      arrangeInitialStateIsLibraryPage();
      arrangeBookViewState();

      final libraryPage = find.byType(LibraryPage);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(libraryPage, findsOneWidget);
    });

    testWidgets('Shows Quotes Page correctly', (WidgetTester tester) async {
      arrangeInitialStateIsQuotesPage();

      final quotesPage = find.byType(QuotesPage);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(quotesPage, findsOneWidget);
    });

    testWidgets('Shows Settings Page correctly', (WidgetTester tester) async {
      arrangeInitialStateIsSettingsPage();

      final settingsPage = find.byType(SettingsPage);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(settingsPage, findsOneWidget);
    });
  });
}
