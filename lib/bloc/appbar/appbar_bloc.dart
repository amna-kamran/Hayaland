import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(HomeInitial()) {
    on<ScrollPositionChanged>((event, emit) {
      if (event.scrollPosition > 100.0) {
        emit(const ScrollPositionState(true));
      } else {
        emit(const ScrollPositionState(false));
      }
    });
  }
}
