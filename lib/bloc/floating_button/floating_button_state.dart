part of 'floating_button_bloc.dart';

class FloatingButtonState extends Equatable {
  final bool isButtonHover;
  const FloatingButtonState({this.isButtonHover = false});

  FloatingButtonState copyWith({bool? isButtonHover}) {
    return FloatingButtonState(
      isButtonHover: isButtonHover ?? this.isButtonHover,
    );
  }

  @override
  List<Object> get props => [isButtonHover];
}
