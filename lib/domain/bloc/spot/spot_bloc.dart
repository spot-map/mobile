import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'spot_event.dart';
part 'spot_state.dart';

class SpotBloc extends Bloc<SpotEvent, SpotState> {
  SpotBloc() : super(SpotInitial()) {
    on<SpotEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
