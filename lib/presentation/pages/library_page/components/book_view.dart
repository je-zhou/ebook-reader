import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookViewCubit, BookViewState>(
      builder: (context, state) {
        if (state.isGridView) {
          return const BookGrid();
        } else {
          return const BookList();
        }
      },
    );
  }
}
