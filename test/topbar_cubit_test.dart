import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_drive/application/menu/menu_cubit.dart';
 
 void main() {
 group('Cubit Tests', () {
    MenuCubit mockCubit = MenuCubit();
      blocTest<MenuCubit, MenuState>("Does page state changing work",
      build: () => mockCubit, 
      act: (cubit)=> cubit.navigateToLibrary(),
      expect: ()=> [
        MenuState.library()
      ]);
  });

 }
 