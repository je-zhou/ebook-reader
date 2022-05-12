import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/tab/tab_event.dart';
import 'app_tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(Library()) {
    on<UpdateTab>((event, emit) => emit(event.tab));
  }
}