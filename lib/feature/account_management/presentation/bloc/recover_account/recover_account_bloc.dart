import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../../../core/failure/failure.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entity/recover_account_entity.dart';
import '../../../domain/usercases/recover_account_usecase.dart';

part 'recover_account_event.dart';
part 'recover_account_state.dart';


class RecoverAccountBloc extends Bloc<RecoverAccountEvent, RecoverAccountState> {
  final RecoverAccountUseCase _recoverAccountUseCase;

  RecoverAccountBloc(this._recoverAccountUseCase)
      : super(RecoverAccountInitialState()) {
    on<RecoverAccountInitialEvent>(_onRecoverAccountInitialEvent);
    on<RecoverAccountSentEvent>(_onRecoverAccountSentEvent);
  }

  Future<void> _onRecoverAccountInitialEvent(
      RecoverAccountInitialEvent event, Emitter<RecoverAccountState> emit) async {
    emit(RecoverAccountInitialState());
  }

  Future<void> _onRecoverAccountSentEvent(
      RecoverAccountSentEvent event, Emitter<RecoverAccountState> emit) async {
    emit(RecoverAccountSentState());

    final resp = await _recoverAccountUseCase(
      Params(RecoverAccountEntity(event.email)),
    );

    resp.fold(
          (l) {
        if (l is ServerFailure) {
          Utils().showException(message: l.message);
        }
        emit(RecoverAccountErrorState());
      },
          (r) => emit(RecoverAccountSuccessState()),
    );
  }
}

