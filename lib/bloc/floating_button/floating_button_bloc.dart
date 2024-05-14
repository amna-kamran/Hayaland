import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'floating_button_event.dart';
part 'floating_button_state.dart';

class FloatingButtonBloc
    extends Bloc<FloatingButtonEvent, FloatingButtonState> {
  FloatingButtonBloc() : super(const FloatingButtonState()) {
    on<ButtonHover>(_buttonHover);
  }

  void _buttonHover(ButtonHover event, Emitter<FloatingButtonState> emit) {
    emit(state.copyWith(isButtonHover: event.isButtonHover));
  }
}
