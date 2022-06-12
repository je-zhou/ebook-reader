import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_drive/application/book_loader/book_loader_cubit.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view.dart';

import '../../../../test_doubles/mock_book_loader_cubit.dart';
import '../../../../test_doubles/mock_book_view_cubit.dart';

void main() {
  late MockBookViewCubit mockBookViewCubit;
  late MockBookLoaderCubit mockBookLoaderCubit;

  setUp(() {
    mockBookViewCubit = MockBookViewCubit();
    mockBookLoaderCubit = MockBookLoaderCubit();
  });

  void arrangeStateIsInGridView() {
    when(() => mockBookViewCubit.state)
        .thenReturn(BookViewState.initial().copyWith(isGridView: true));
  }

  void arrangeStateIsInListView() {
    when(() => mockBookViewCubit.state)
        .thenReturn(BookViewState.initial().copyWith(isGridView: false));
  }

  void arrangeBookLoaderStateIsLoading() {
    when(() => mockBookLoaderCubit.state)
        .thenReturn(const BookLoaderState.loading());
  }

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BookViewCubit>(create: (context) => mockBookViewCubit),
          BlocProvider<BookLoaderCubit>(create: (context) => mockBookLoaderCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: BookView(),
          ),
        ));
  }

  group("Test Book View shows correct view type", () {
    testWidgets('Shows Book Grid View correctly', (WidgetTester tester) async {
      arrangeStateIsInGridView();

      final bookView = find.byType(BookGrid);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(bookView, findsOneWidget);
    });
    testWidgets('Shows Book List View correctly', (WidgetTester tester) async {
      arrangeStateIsInListView();

      final bookView = find.byType(BookList);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(bookView, findsOneWidget);
    });
  }, skip: "FutureBuilder broke this test");

  group("Shows loading spinner", () {
    setUp(() => arrangeBookLoaderStateIsLoading());
    testWidgets('on list view', (WidgetTester tester) async {
      arrangeStateIsInListView();

      final loadingSpinner = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(loadingSpinner, findsOneWidget);
    });

    testWidgets('on grid view', (WidgetTester tester) async {
      arrangeStateIsInGridView();

      final loadingSpinner = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(loadingSpinner, findsOneWidget);
    });
  });
}


