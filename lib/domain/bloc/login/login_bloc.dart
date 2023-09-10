import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';
import 'package:ride_map/domain/bloc/login/constants/login_status.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/preferences/preferences.dart';

part 'login_event.dart';

part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _provider = getIt.get<AuthProvider>();
  LoginBloc() : super(LoginState()) {
    on<LoginUserEvent>(_onLoginEvent);
    on<RegistrationEvent>(_onRegistrationEvent);
    // on<LogoutEvent>(_onLogoutEvent);
  }

  void _onLoginEvent(LoginUserEvent event, Emitter<LoginState> emit) async {
    try {
      await _provider.login(event.email, event.password);
      Dev.log('${Prefs.getString('token')}', name: 'TOKEN');
      if(Prefs.getString('token')!.isNotEmpty){
        emit(state.copyWith(status: LoginStatus.auth));
      }
      if(Prefs.getString('token') == 'false'){
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMessage: 'Неверный логин или пароль',
          ),
        );
        addError('Неверный логин или пароль');
      }
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
    }catch (e){
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e.toString());
    }
  }

  void _onRegistrationEvent(
      RegistrationEvent event, Emitter<LoginState> emit) async {
    try {
      Dev.log(
          'REGISTRATION BLOC ${event.name} ${event.email} ${event.password}');
      await _provider.registration(event.name, event.email, event.password);
      emit(state.copyWith(status: LoginStatus.registered));
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
    }catch (e){
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }

  // void _onLogoutEvent(LogoutEvent event, Emitter<LoginState> emit) {
  //   try {
  //     _provider.logout();
  //     emit(state.copyWith(status: LoginStatus.logout));
  //   } on NetworkError catch (e) {
  //     emit(
  //       state.copyWith(
  //         status: LoginStatus.error,
  //         errorMessage: e.stackTrace.toString(),
  //       ),
  //     );
  //     addError(e);
  //   } on DioError catch (e) {
  //     emit(
  //       state.copyWith(
  //         status: LoginStatus.error,
  //         errorMessage: e.stackTrace.toString(),
  //       ),
  //     );
  //     addError(e);
  //   }catch (e){
  //     emit(
  //       state.copyWith(
  //         status: LoginStatus.error,
  //         errorMessage: 'Ошибка',
  //       ),
  //     );
  //     addError(e);
  //   }
  // }
}
