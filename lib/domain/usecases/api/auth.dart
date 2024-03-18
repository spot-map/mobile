import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ride_map/data/result_entity/result.dart';
import 'package:ride_map/data/token_models/token_model.dart';
import 'package:ride_map/domain/api/auth_api.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class AuthUseCase {
  Future<Result<TokenModel>> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<Result<bool>> logout();

  Future<Result> refresh();
}

class AuthUseCaseImpl implements AuthUseCase {
  final AuthApi _authApi = getIt();
  final TokenStorage _tokenStorage = getIt();

  @override
  Future<Result<TokenModel>> login(String email, String password) async {
    late final TokenModel token;
    try {
      token = await _authApi.login(email, password);
    } on DioException catch (e) {
      late final String message;
      if (e.response?.data['data']['success'] == false) {
        message = "Не верный логин или пароль.";
      } else {
        message = "Не удалось найти пользователя.";
      }
      return Result.failure(message);
    } catch (e, s) {
      log('$e,$s', name: 'login');
      return Result.failure('Не удалось авторизоваться.');
    }
    _tokenStorage.accessToken = token.data!.token;

    return Result.success(token);
  }

  @override
  Future<Result> registration(String email, String password, String name) async {
    late final TokenModel token;
    try {
      token = await _authApi.registration(email, password, name);
    } on DioException catch (e) {
      late final String message;
      if (e.response?.data['data']['success'] == false) {
        message = "Не удалось зарегистрировать пользователя.";
      } else {
        message = "Ошибка регистрации.";
      }
      return Result.failure(message);
    } catch (e, s) {
      log('$e,$s', name: 'login');
      return Result.failure('Не удалось зарегистрироваться.');
    }
    _tokenStorage.accessToken = token.data!.token;

    return Result.success(token);
  }

  @override
  Future<Result<bool>> logout() async {
    late final bool isLogout;
    try {
      isLogout = await _authApi.logout();
    } catch (e, s) {
      log('$e,$s', name: 'logout');
      return Result.failure('Не удалось выйти из аккаунта;');
    }
    return Result.success(isLogout);
  }

  @override
  Future<Result> refresh() async {
    late final TokenModel token;
    try {
      token = await _authApi.refresh();
    } on DioException catch (e) {
      late final String message;
      if (e.response?.data['data']['success'] == false) {
        message = "Не удалось обновить токен.";
      } else {
        message = "Ошибка обновления токена.";
      }
      return Result.failure(message);
    } catch (e, s) {
      log('$e,$s', name: 'login');
      return Result.failure('Не удалось обновить токен.');
    }
    _tokenStorage.accessToken = token.data!.token;

    return Result.success(token);
  }
}
