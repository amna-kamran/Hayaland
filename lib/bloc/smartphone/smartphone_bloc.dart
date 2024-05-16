import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/smartphone.dart';
import '../../services/products/apple_provider.dart';

part 'smartphone_event.dart';
part 'smartphone_state.dart';

class SmartphoneBloc extends Bloc<SmartphoneEvent, SmartphoneState> {
  final AppleProvider appleProvider;

  SmartphoneBloc(this.appleProvider) : super(SmartphonesInitial()) {
    on<LoadAllSmartphones>((event, emit) async {
      emit(SmartphonesLoading());
      try {
        final phones = await appleProvider.getApple();

        emit(SmartphonesLoaded(phones));
      } catch (e) {
        emit(const SmartphoneError("Failed to load smartphones"));
      }
    });

    on<LoadSmartphoneByIMEI>((event, emit) async {
      emit(SmartphonesLoading());
      try {
        final phone = await appleProvider.getAppleByIMEI(event.imei);
        emit(SmartphoneLoaded(phone));
      } catch (e) {
        emit(const SmartphoneError("Failed to load smartphone"));
      }
    });
  }
}
