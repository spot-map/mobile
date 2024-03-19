import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObservable extends BlocObserver {
  final logger = Logger();

  @override
  void onCreate(BlocBase bloc) {
    logger.i('[${bloc.runtimeType}] Cubit created');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('[${bloc.runtimeType}]', [error, stackTrace]);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.i('[${bloc.runtimeType}] Cubit closed');
    super.onClose(bloc);
  }
}
