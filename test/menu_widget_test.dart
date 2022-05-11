import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/presentation/menu.dart';


void main() {
  testWidgets('Menu contains library, quotes, settings test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(bottomNavigationBar: Menu())));

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
}
