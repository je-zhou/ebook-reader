import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_drive/presentation/pages/library_page/library_page.dart';
import 'package:test_drive/presentation/pages/page_wrapper.dart';
import 'package:test_drive/presentation/pages/quotes_page/quotes_page.dart';
import 'package:test_drive/presentation/pages/settings_page/settings_page.dart';

import '../test_doubles/mock_page_selector_cubit.dart';

void main() {
  late MockPageSelectorCubit mockCubit;

  setUp(() {
    mockCubit = MockPageSelectorCubit();
  });

  void arrangeInitialStateIsLibraryPage() {
    when(() => mockCubit.state).thenReturn(const PageSelectorState.library());
  }

  void arrangeInitialStateIsQuotesPage() {
    when(() => mockCubit.state).thenReturn(const PageSelectorState.quotes());
  }

  void arrangeInitialStateIsSettingsPage() {
    when(() => mockCubit.state).thenReturn(const PageSelectorState.settings());
  }

  Widget createWidgetUnderTest() {
    return BlocProvider<PageSelectorCubit>(
      create: (context) => mockCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: PageWrapper(),
        ),
      ),
    );
  }

  group("Test page wrapper returns correct page", () {
    testWidgets('Shows Library Page correctly', (WidgetTester tester) async {
      // arrange
      arrangeInitialStateIsLibraryPage();

      // find

      final libraryText = find.byType(LibraryPage);

      // test
      await tester.pumpWidget(createWidgetUnderTest());

      // expect
      expect(libraryText, findsOneWidget);
    });
    testWidgets('Shows Quotes Page correctly', (WidgetTester tester) async {
      // arrange
      arrangeInitialStateIsQuotesPage();

      // find
      final quotesText = find.byType(QuotesPage);

      // test
      await tester.pumpWidget(createWidgetUnderTest());

      // expect
      expect(quotesText, findsOneWidget);
    });
    testWidgets('Shows Settings Page correctly', (WidgetTester tester) async {
      // arrange
      arrangeInitialStateIsSettingsPage();

      // find
      final settingsText = find.byType(SettingsPage);

      // test
      await tester.pumpWidget(createWidgetUnderTest());

      // expect
      expect(settingsText, findsOneWidget);
    });
  });
}
