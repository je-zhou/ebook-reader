import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view.dart';

import '../../../../test_doubles/mock_book_view_cubit.dart';

void main() {
  late MockBookViewCubit mockCubit;

  setUp(() {
    mockCubit = MockBookViewCubit();
  });

  void arrangeStateIsInGridView() {
    when(() => mockCubit.state)
        .thenReturn(BookViewState.initial().copyWith(isGridView: true));
  }

  void arrangeStateIsInListView() {
    when(() => mockCubit.state)
        .thenReturn(BookViewState.initial().copyWith(isGridView: false));
  }

  Widget createWidgetUnderTest() {
    return BlocProvider<BookViewCubit>(
      create: (context) => mockCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: BookView(),
        ),
      ),
    );
  }

  group("Test Book View shows correct view type", () {
    testWidgets('Shows Book Grid View correctly', (WidgetTester tester) async {
      // arrange
      arrangeStateIsInGridView();

      // find
      final bookView = find.byType(BookGrid);

      // test
      await tester.pumpWidget(createWidgetUnderTest());

      // expect
      expect(bookView, findsOneWidget);
    });
    testWidgets('Shows Book List View correctly', (WidgetTester tester) async {
      // arrange
      arrangeStateIsInListView();

      // find
      final bookView = find.byType(BookList);

      // test
      await tester.pumpWidget(createWidgetUnderTest());

      // expects
      expect(bookView, findsOneWidget);
    });
  });
}
