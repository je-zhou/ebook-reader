import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.library());

  navigateToLibrary() => emit(MenuState.library());
  navigateToQuotes() => emit(MenuState.quotes());
  navigateToSettings() => emit(MenuState.settings());

}
