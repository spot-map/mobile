import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';

import '../../../untils/enum/location_enum.dart';

part 'login_event.dart';

part 'login_state.dart';

final LoginProvider _provider = LoginProvider();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUserEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginUserEvent event, Emitter<LoginState> emit) {
    try {
      _provider.auth(event.email, event.password);
      emit(state.copyWith(status: LocationStateStatus.success));
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
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
