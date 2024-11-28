import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entity/recover_password_entity.dart';
import '../../../domain/usercases/recover_password_usecase.dart';

part 'recover_password_event.dart';
part 'recover_password_state.dart';


class RecoverPasswordBloc extends Bloc<RecoverPasswordEvent, RecoverPasswordState>  {
  final RecoverPasswordUseCase _recoverPasswordUseCase;

  RecoverPasswordBloc(this._recoverPasswordUseCase)
      : super(RecoverPasswordInitialState()) {
    on<RecoveryPasswordInitialEvent>(_onRecoveryPasswordInitialEvent);
    on<RecoverPasswordSentEvent>(_onRecoverPasswordSentEvent);
  }

  Future<void> _onRecoveryPasswordInitialEvent(
      RecoveryPasswordInitialEvent event, Emitter<RecoverPasswordState> emit) async {
    emit(RecoverPasswordInitialState());
  }

  Future<void> _onRecoverPasswordSentEvent(
      RecoverPasswordSentEvent event, Emitter<RecoverPasswordState> emit) async {
    emit(RecoverPasswordSentState());

    final resp = await _recoverPasswordUseCase(Params(RecoverPasswordEntity(
        event.code, event.password, event.confirmPassword)));

    resp.fold(
          (l) {
        Utils().showException(message: l.message);  // Utilizamos la función extendida 'Utils.showException'
        emit(RecoverPasswordErrorState());
      },
          (r) => emit(RecoverPasswordSuccessState()),
    );
  }
}

