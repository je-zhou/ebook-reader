import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/presentation/topbar.dart';
import 'package:mocktail/mocktail.dart';

import '../test_doubles/mock_book_view_cubit.dart';
import '../test_doubles/mock_page_selector_cubit.dart';

void main() {
  late MockPageSelectorCubit mockPageSelectorCubit;
  late MockBookViewCubit mockBookViewCubit;

  setUp(() {
    mockPageSelectorCubit = MockPageSelectorCubit();
    mockBookViewCubit = MockBookViewCubit();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<PageSelectorCubit>(
      create: (context) => mockPageSelectorCubit,
      child: const MaterialApp(home: Scaffold(appBar: Topbar())),
    );
  }

  Widget createWidgetUnderTestWithBookViewCubit() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageSelectorCubit>(
          create: (context) => mockPageSelectorCubit,
        ),
        BlocProvider<BookViewCubit>(
          create: (context) => mockBookViewCubit,
        ),
      ],
      child: const MaterialApp(home: Scaffold(appBar: Topbar())),
    );
  }

  void arrangePageIsLibrary() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.library());

  void arrangePageIsQuotes() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.quotes());

  void arrangePageIsSettings() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.settings());

  group('Topbar should render correct page name', () {
    testWidgets('Library title when in library state',
        (WidgetTester tester) async {
      arrangePageIsLibrary();
      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Library');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Quotes title when in quotes state',
        (WidgetTester tester) async {
      arrangePageIsQuotes();

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Quotes');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Settings title when in settings state',
        (WidgetTester tester) async {
      arrangePageIsSettings();

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Settings');
      expect(libraryTitle, findsOneWidget);
    });
  });

  group("Icons render correctly", () {
    testWidgets('Library icons are correct', (WidgetTester tester) async {
      arrangePageIsLibrary();

      await tester.pumpWidget(createWidgetUnderTest());

      const libraryIcons = [
        FontAwesomeIcons.magnifyingGlass,
        FontAwesomeIcons.filter,
        FontAwesomeIcons.borderAll
      ];

      for (var icon in libraryIcons) {
        final iconFinder = find.byIcon(icon);
        expect(iconFinder, findsOneWidget);
      }
    });

    testWidgets('Quotes icons are correct', (WidgetTester tester) async {
      arrangePageIsQuotes();

      await tester.pumpWidget(createWidgetUnderTest());

      const quotesIcons = [
        FontAwesomeIcons.magnifyingGlass,
        FontAwesomeIcons.filter,
      ];

      for (var icon in quotesIcons) {
        final iconFinder = find.byIcon(icon);
        expect(iconFinder, findsOneWidget);
      }
    });
    testWidgets('Settings icons are correct', (WidgetTester tester) async {
      arrangePageIsSettings();

      await tester.pumpWidget(createWidgetUnderTest());

      const settingsIcons = [
        FontAwesomeIcons.magnifyingGlass,
      ];

      for (var icon in settingsIcons) {
        final iconFinder = find.byIcon(icon);
        expect(iconFinder, findsOneWidget);
      }
    });
  });

  group('Testing icon functionality working as intended', () {
    testWidgets(
        'When Grid icon is clicked we will toggle isGridView value and '
        'then show a list icon', (WidgetTester tester) async {
      arrangePageIsLibrary();
    });
  });
}
