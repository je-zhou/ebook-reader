import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_loader/book_loader_cubit.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/homepage.dart';

import '../application/page_selector/page_selector_cubit.dart';
import '../domain/book/book_repository.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookRepository bookRepository = BookRepository(Theme.of(context).platform);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageSelectorCubit(),
        ),
        BlocProvider(
          create: (context) => BookViewCubit(),
        ),
        BlocProvider(
          create: (context) => BookLoaderCubit(bookRepository)..getBooks(),
        ),
      ],
      child: const MyHomePage(),
    );
  }
}
