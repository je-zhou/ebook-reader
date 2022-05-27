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

  List<IconData> allUsedIcons = [
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.filter,
    FontAwesomeIcons.borderAll,
    FontAwesomeIcons.list,
  ];

  void arrangePageIsLibrary() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.library());

  void arrangePageIsQuotes() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.quotes());

  void arrangePageIsSettings() => when(() => mockPageSelectorCubit.state)
      .thenReturn(const PageSelectorState.settings());

  void arrangeStateIsInGridView() => when(() => mockBookViewCubit.state)
      .thenReturn(BookViewState.initial().copyWith(isGridView: true));

  void arrangeStateIsInListView() => when(() => mockBookViewCubit.state)
      .thenReturn(BookViewState.initial().copyWith(isGridView: false));

  void testIcons(List<IconData> pageIcons) {
    for (IconData icon in allUsedIcons) {
      final iconFinder = find.byIcon(icon);

      if (pageIcons.contains(icon)) {
        expect(iconFinder, findsOneWidget);
      } else {
        expect(iconFinder, findsNothing);
      }
    }
  }

  group('Topbar should render correct page name', () {
    testWidgets('Library title when in library state',
        (WidgetTester tester) async {
      arrangePageIsLibrary();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Library');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Quotes title when in quotes state',
        (WidgetTester tester) async {
      arrangePageIsQuotes();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Quotes');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Settings title when in settings state',
        (WidgetTester tester) async {
      arrangePageIsSettings();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Settings');
      expect(libraryTitle, findsOneWidget);
    });
  });

  group("Icons render correctly", () {
    testWidgets('Library icons are correct when in Grid View State',
        (WidgetTester tester) async {
      arrangePageIsLibrary();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      List<IconData> libraryIcons = [
        FontAwesomeIcons.magnifyingGlass,
        FontAwesomeIcons.filter,
        FontAwesomeIcons.list
      ];

      testIcons(libraryIcons);
    });
    testWidgets('Library icons are correct when in List View State',
        (WidgetTester tester) async {
      arrangePageIsLibrary();
      arrangeStateIsInListView();

      await tester.pumpWidget(createWidgetUnderTest());

      List<IconData> libraryIcons = [
        FontAwesomeIcons.magnifyingGlass,
        FontAwesomeIcons.filter,
        FontAwesomeIcons.borderAll,
      ];

      testIcons(libraryIcons);
    });

    testWidgets('Quotes icons are correct', (WidgetTester tester) async {
      arrangePageIsQuotes();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      List<IconData> quotesIcons = [
        FontAwesomeIcons.magnifyingGlass,
        FontAwesomeIcons.filter,
      ];

      testIcons(quotesIcons);
    });
    testWidgets('Settings icons are correct', (WidgetTester tester) async {
      arrangePageIsSettings();
      arrangeStateIsInGridView();

      await tester.pumpWidget(createWidgetUnderTest());

      List<IconData> settingsIcons = [
        FontAwesomeIcons.magnifyingGlass,
      ];

      testIcons(settingsIcons);
    });
  });
}
