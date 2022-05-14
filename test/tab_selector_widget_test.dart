import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/tab/app_tab.dart';
import 'package:test_drive/presentation/tab_selector.dart';

void main() {
  testWidgets('render properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: TabSelector(
            onTabSelected: (_) => null,
            activeTab: Library(),
          ),
        )
      )
    );

    final libraryText = find.text('Library');
    final libraryIcon = find.byIcon(FontAwesomeIcons.bookOpen);
    final quotesText = find.text('Quotes');
    final quotesIcon = find.byIcon(FontAwesomeIcons.noteSticky);
    final settingsText = find.text('Settings');
    final settingsIcon = find.byIcon(FontAwesomeIcons.gear);
    expect(libraryText, findsOneWidget);
    expect(libraryIcon, findsOneWidget);
    expect(quotesText, findsOneWidget);
    expect(quotesIcon, findsOneWidget);
    expect(settingsText, findsOneWidget);
    expect(settingsIcon, findsOneWidget);
  });
  
  testWidgets('changes selectedTab on tap', (WidgetTester tester) async {
    late AppTab selectedTab;

    await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
              bottomNavigationBar: TabSelector(
                onTabSelected: (appTab) { selectedTab = appTab; },
                activeTab: Library(),
              ),
            )
        )
    );

    await tester.pumpAndSettle();
    final libraryText = find.text('Library');
    final quotesText = find.text('Quotes');
    final settingsText = find.text('Settings');
    expect(libraryText, findsOneWidget);
    expect(quotesText, findsOneWidget);
    expect(settingsText, findsOneWidget);
    await tester.tap(quotesText);
    expect(selectedTab, Quotes());
    await tester.tap(settingsText);
    expect(selectedTab, Settings());
    await tester.tap(libraryText);
    expect(selectedTab, Library());
  });
}