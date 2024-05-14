part of 'floating_button_bloc.dart';

sealed class FloatingButtonEvent extends Equatable {
  const FloatingButtonEvent();

  @override
  List<Object> get props => [];
}

class ButtonHover extends FloatingButtonEvent {
  final bool isButtonHover;

  const ButtonHover({this.isButtonHover = false});

  @override
  List<Object> get props => [isButtonHover];
}
