import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/menu/menu_cubit.dart';
import 'package:test_drive/presentation/homepage.dart';
import 'package:test_drive/presentation/tab_selector.dart';

import '../application/tab/tab_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return BlocProvider(
   create: (context) => TabBloc(),
   child: const MyHomePage(),
 );
  }
}