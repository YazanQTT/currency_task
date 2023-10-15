import 'dart:async';

import '../../../core/core.export.dart';
import '../nav_bar.export.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(const NavBarState()) {
    on<NavBarEvent>(_handleEvent);
  }

  FutureOr<void> _handleEvent(NavBarEvent event, Emitter<NavBarState> emit) {
    if (event is NavBarScreenChanged) {
      emit(NavBarState(selectedScreen: event.index));
    }
  }
}
