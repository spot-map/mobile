import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/provider/registration_provider.dart';
import 'package:ride_map/untils/enum/location_enum.dart';

part 'registration_event.dart';

part 'registration_state.dart';

final RegistrationProvider _provider = RegistrationProvider();

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState()) {
    on<RegistrationUserEvent>(_onRegistrationUser);
  }

  void _onRegistrationUser(
      RegistrationUserEvent event, Emitter<RegistrationState> emit) {
    try {
      _provider.registration(event.email, event.password, event.name);
      emit(state.copyWith(status: LocationStateStatus.success));
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
