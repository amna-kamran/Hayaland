part of 'appbar_bloc.dart';

sealed class AppBarState extends Equatable {
  const AppBarState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends AppBarState {}

class ScrollPositionState extends AppBarState {
  final bool isAboveThreshold;

  const ScrollPositionState(this.isAboveThreshold);

  @override
  List<Object> get props => [isAboveThreshold];
}
