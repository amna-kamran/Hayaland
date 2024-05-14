import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, ImageHoverState> {
  HomeBloc() : super(const ImageHoverState()) {
    on<ImageHoverEvent>(_imagehover);
  }
  void _imagehover(ImageHoverEvent event, Emitter<HomeState> emit) {
    emit(ImageHoverState(isHovered: event.isHovered));
  }
}
