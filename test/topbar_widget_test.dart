import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/presentation/topbar.dart';

void main() {
  testWidgets('Renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(
            home: Scaffold(
                appBar: Topbar(title: 'Library',)
            )
        )
    );

    final libraryTitle = find.text('Library');
    expect(libraryTitle, findsOneWidget);

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
