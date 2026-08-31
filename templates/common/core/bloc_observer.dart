import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  final bool enableLogging;
  AppBlocObserver({this.enableLogging = true});

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (enableLogging) debugPrint('🟢 [Bloc Created] ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (enableLogging) {
      debugPrint('🔄 [Bloc Change] ${bloc.runtimeType} | Current: ${change.currentState} ➔ Next: ${change.nextState}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('🔴 [Bloc Error] ${bloc.runtimeType} | $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (enableLogging) debugPrint('⚪ [Bloc Closed] ${bloc.runtimeType}');
  }
}
