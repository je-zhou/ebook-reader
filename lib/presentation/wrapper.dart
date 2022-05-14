import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/presentation/homepage.dart';

import '../application/page_selector/page_selector_cubit.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageSelectorCubit(),
      child: MyHomePage(),
    );
  }
}
