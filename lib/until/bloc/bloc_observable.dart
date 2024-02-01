import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/until/dev.dart';

class AppBlocObservable extends BlocObserver {
  static const _name = 'BLOC';

  @override
  void onCreate(BlocBase bloc) {
    Dev.log('[${bloc.runtimeType}] Bloc created', name: _name);
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    Dev.log('[${bloc.runtimeType}] | $event', name: _name);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Dev.log('[${bloc.runtimeType}]',
        name: _name, error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    Dev.log('[${bloc.runtimeType}] Bloc closed', name: _name);
    super.onClose(bloc);
  }
}
