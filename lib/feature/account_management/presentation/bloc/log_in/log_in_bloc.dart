import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/platform/shared_prefs.dart';
import '../../../../../core/usercases/usercases.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entity/log_in_entity.dart';
import '../../../domain/usercases/log_in_credential_usercase.dart';
import '../../../domain/usercases/log_in_usercase.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';


class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUserCase logInUserCase;
  final LogInRememberUseCase logInCredentialCase;
  final SharedPreferencesManager sharedPreferencesManager;

  LogInBloc(this.logInUserCase, this.logInCredentialCase, this.sharedPreferencesManager)
      : super(LogInInitial()) {
    on<LogInRememberEvent>(_onLogInRememberEvent);
    on<LogInSendEvent>(_onLogInSendEvent);
  }

  Future<void> _onLogInRememberEvent(
      LogInRememberEvent event, Emitter<LogInState> emit) async {
    bool remember = await sharedPreferencesManager.getRememberMe();
    if (remember) {
      emit(LogInSentState());
      final resp = await logInCredentialCase(NoParams());
      resp.fold(
            (l) {
          Utils().showException(message: l?.message ?? "");
          emit(LogInFailState());
        },
            (r) => emit(LogInSuccessState()),
      );
    }
  }

  Future<void> _onLogInSendEvent(LogInSendEvent event, Emitter<LogInState> emit) async {
    emit(LogInSentState());
    final resp = await logInUserCase(Params(LogInEntity(event.email, event.pass)));
    resp.fold(
          (l) {
        Utils().showException(message: l.message);
        emit(LogInFailState());
      },
          (r) {
        sharedPreferencesManager.setRememberMe(event.remember);
        emit(LogInSuccessState());
      },
    );
  }
}

