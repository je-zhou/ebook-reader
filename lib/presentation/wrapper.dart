import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/homepage.dart';

import '../application/page_selector/page_selector_cubit.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageSelectorCubit(),
        ),
        BlocProvider(
          create: (context) => BookViewCubit(),
        ),
      ],
      child: const MyHomePage(),
    );
  }
}
