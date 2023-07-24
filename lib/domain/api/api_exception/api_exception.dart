import 'package:dio/dio.dart';

class ApiException extends Error {
  ApiException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Запрос отменен";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Проверьте подключение к интренету";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Что-то пошло не так";
        break;
    }
  }

  String? message;

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 302:
        return 'Непредвиденная ошибка';
      case 400:
        return 'Ошибка запроса';
      case 404:
        return 'Страница не найдена';
      case 500:
        return 'Ошибка сервера';
      default:
        return 'Упс,что-то пошло не так';
    }
  }

  @override
  String toString() => message.toString();
}
