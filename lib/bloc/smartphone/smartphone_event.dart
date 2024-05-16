part of 'smartphone_bloc.dart';

sealed class SmartphoneEvent extends Equatable {
  const SmartphoneEvent();

  @override
  List<Object> get props => [];
}

class LoadAllSmartphones extends SmartphoneEvent {}

class LoadSmartphoneByIMEI extends SmartphoneEvent {
  final String imei;
  const LoadSmartphoneByIMEI(this.imei);
}
