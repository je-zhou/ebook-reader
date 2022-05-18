import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/page_selector/page_selector_cubit.dart';
import 'package:test_drive/presentation/menu.dart';
import 'package:mocktail/mocktail.dart';

import '../test_doubles/mock_page_selector_cubit.dart';

void main() {
  late MockPageSelectorCubit mockCubit;

  setUp(() {
    mockCubit = MockPageSelectorCubit();
  });

  void arrangeInitialStateIsLibraryPage() {
    when(() => mockCubit.state).thenReturn(const PageSelectorState.library());
  }

  // When the Menu Widget calls cubit.stateToInt() method, our mock cubit will
  // return 0 so that the library tab will be the active tab
  void arrangePageSelectorCubitReturnsIndex0ForMenuWidget() {
    when(() => mockCubit.stateToInt()).thenReturn(0);
  }

  Widget createWidgetUnderTest() {
    return BlocProvider<PageSelectorCubit>(
      create: (context) => mockCubit,
      child: const MaterialApp(home: Scaffold(bottomNavigationBar: Menu())),
    );
  }

  testWidgets('Menu contains library, quotes, settings text and icon',
      (WidgetTester tester) async {
    // arrange
    arrangeInitialStateIsLibraryPage();
    arrangePageSelectorCubitReturnsIndex0ForMenuWidget();

    // find
    final libraryText = find.text('Library');
    final libraryIcon = find.byIcon(FontAwesomeIcons.bookOpen);
    final quotesText = find.text('Quotes');
    final quotesIcon = find.byIcon(FontAwesomeIcons.noteSticky);
    final settingsText = find.text('Settings');
    final settingsIcon = find.byIcon(FontAwesomeIcons.gear);

    // test
    await tester.pumpWidget(createWidgetUnderTest());

    // expect
    expect(libraryText, findsOneWidget);
    expect(libraryIcon, findsOneWidget);
    expect(quotesText, findsOneWidget);
    expect(quotesIcon, findsOneWidget);
    expect(settingsText, findsOneWidget);
    expect(settingsIcon, findsOneWidget);
  });
}
