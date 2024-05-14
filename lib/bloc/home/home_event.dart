part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ImageHoverEvent extends HomeEvent {
  final bool isHovered;
  const ImageHoverEvent({this.isHovered = false});

  @override
  List<Object> get props => [isHovered];
}
