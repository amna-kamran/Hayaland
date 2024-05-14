part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class ImageHoverState extends HomeState {
  final bool isHovered;
  const ImageHoverState({this.isHovered = false});

  @override
  List<Object> get props => [isHovered];
}
