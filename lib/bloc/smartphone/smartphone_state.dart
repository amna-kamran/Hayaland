part of 'smartphone_bloc.dart';

sealed class SmartphoneState extends Equatable {
  const SmartphoneState();

  @override
  List<Object> get props => [];
}

class SmartphonesInitial extends SmartphoneState {}

class SmartphonesLoading extends SmartphoneState {}

class SmartphonesLoaded extends SmartphoneState {
  final List<dynamic> smartphones;
  const SmartphonesLoaded(this.smartphones);
}

class SmartphoneLoaded extends SmartphoneState {
  final Smartphone? smartphone;
  const SmartphoneLoaded(this.smartphone);
}

class SmartphoneError extends SmartphoneState {
  final String message;
  const SmartphoneError(this.message);
}
