import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_loader/book_loader_cubit.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookLoaderCubit, BookLoaderState>(
      builder: ((context, loaderState) {
        return loaderState.map(
          initial: (_) => const CircularProgressIndicator.adaptive(),
          loading: (_) => const CircularProgressIndicator.adaptive(),
          loadSuccess: (e) => BlocBuilder<BookViewCubit, BookViewState>(
            builder: (context, viewState) {
              if (viewState.isGridView) {
                return BookGrid(books: e.books);
              } else {
                return BookList(books: e.books);
              }
            },
          ),
          loadFailure: (e) => Center(
            child: Text('Could not load books because: ${e.errorMsg}'),
          ),
        );
      }),
    );
  }
}
