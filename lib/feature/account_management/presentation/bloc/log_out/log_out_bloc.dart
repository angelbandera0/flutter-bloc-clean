import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/platform/shared_prefs.dart';
import '../../../../../core/usercases/usercases.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/usercases/log_out_usecase.dart';

part 'log_out_state.dart';
part 'log_out_event.dart';


class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  final LogOutUseCase _logOutUseCase;
  final SharedPreferencesManager _sharedPreferencesManager;

  LogOutBloc(this._logOutUseCase, this._sharedPreferencesManager)
      : super(LogOutInitialState()) {
    on<LogOutInitialEvent>(_onLogOutInitialEvent);
    on<LogOutSentEvent>(_onLogOutSentEvent);
  }

  Future<void> _onLogOutInitialEvent(
      LogOutInitialEvent event, Emitter<LogOutState> emit) async {
    emit(LogOutInitialState());
  }

  Future<void> _onLogOutSentEvent(
      LogOutSentEvent event, Emitter<LogOutState> emit) async {
    emit(LogOutSentState());

    var resp = await _logOutUseCase(NoParams());
    resp.fold(
          (l) {
        Utils().showException(message: l.message);
        emit(LogOutErrorState());
      },
          (r) {
        _sharedPreferencesManager.setAccessToken('');
        _sharedPreferencesManager.setRefreshToken('');
        _sharedPreferencesManager.setRememberMe(false);
        emit(LogOutSuccessState());
      },
    );
  }
}

