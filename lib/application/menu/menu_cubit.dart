import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.library());

  intToState(int index) {
    switch (index) {
      case 0:
        navigateToLibrary();
        break;
      case 1:
        navigateToQuotes();
        break;
      case 2:
        navigateToSettings();
        break;
      default:
        throw Error();
    }
  }

  int stateToInt() {
    return state.map(library: (_) => 0, quotes: (_) => 1, settings: (_) => 2);
  }

  navigateToLibrary() => emit(MenuState.library());
  navigateToQuotes() => emit(MenuState.quotes());
  navigateToSettings() => emit(MenuState.settings());
}
