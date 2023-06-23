import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';
import 'package:ride_map/domain/bloc/login/constants/login_status.dart';
import 'package:ride_map/untils/dev.dart';

import '../../../untils/enum/location_enum.dart';

part 'login_event.dart';

part 'login_state.dart';

final AuthProvider _provider = AuthProvider();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUserEvent>(_onLoginEvent);
    on<RegistrationEvent>(_onRegistrationEvent);
  }

  void _onLoginEvent(LoginUserEvent event, Emitter<LoginState> emit) {
    try {
      _provider.auth(event.email, event.password);
      emit(state.copyWith(status: LoginStatus.auth));
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }

  void _onRegistrationEvent(RegistrationEvent event, Emitter<LoginState> emit){
    try {
      Dev.log('REGISTRATION BLOC ${event.name} ${event.email} ${event.password}');
      _provider.registration(event.name, event.email, event.password);
      emit(state.copyWith(status: LoginStatus.auth));
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
