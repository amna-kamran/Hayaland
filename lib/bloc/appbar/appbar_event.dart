part of 'appbar_bloc.dart';

class AppBarEvent extends Equatable {
  const AppBarEvent();

  @override
  List<Object> get props => [];
}

class ScrollPositionChanged extends AppBarEvent {
  final double scrollPosition;

  const ScrollPositionChanged(this.scrollPosition);

  @override
  List<Object> get props => [scrollPosition];
}
