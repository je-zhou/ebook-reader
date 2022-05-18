import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/presentation/topbar.dart';
import 'package:mocktail/mocktail.dart';

import '../test_doubles/mock_page_selector_cubit.dart';

void main() {
  late MockPageSelectorCubit mockCubit;

  setUp(() {
    mockCubit = MockPageSelectorCubit();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<PageSelectorCubit>(
      create: (context) => mockCubit,
      child: const MaterialApp(home: Scaffold(appBar: Topbar())),
    );
  }

  group('Topbar should render correct page name', () {
    testWidgets('Library', (WidgetTester tester) async {
      when(() => mockCubit.state).thenReturn(const PageSelectorState.library());

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Library');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Quotes', (WidgetTester tester) async {
      when(() => mockCubit.state).thenReturn(const PageSelectorState.quotes());

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Quotes');
      expect(libraryTitle, findsOneWidget);
    });

    testWidgets('Settings', (WidgetTester tester) async {
      when(() => mockCubit.state)
          .thenReturn(const PageSelectorState.settings());

      await tester.pumpWidget(createWidgetUnderTest());

      final libraryTitle = find.text('Settings');
      expect(libraryTitle, findsOneWidget);
    });
  });

  testWidgets('Test page icons', (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(const PageSelectorState.library());

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
}
