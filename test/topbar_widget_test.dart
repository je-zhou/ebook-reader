import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:test_drive/topbar.dart';

void main() {
  testWidgets('Test page name', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(appBar: Topbar())));

    final libraryTitle = find.text('Library');
    expect(libraryTitle, findsOneWidget);
  });

  testWidgets('Test page icons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(appBar: Topbar())));

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
