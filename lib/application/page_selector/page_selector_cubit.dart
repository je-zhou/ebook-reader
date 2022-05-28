import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_selector_cubit.freezed.dart';

part 'page_selector_state.dart';

class PageSelectorCubit extends Cubit<PageSelectorState> {
  PageSelectorCubit() : super(const PageSelectorState.library());

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

  navigateToLibrary() => emit(const PageSelectorState.library());

  navigateToQuotes() => emit(const PageSelectorState.quotes());

  navigateToSettings() => emit(const PageSelectorState.settings());
}
