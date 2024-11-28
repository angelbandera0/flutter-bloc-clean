import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/global/entities/phone_entity.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entity/sign_up_entity.dart';

import '../../../domain/usercases/sign_up_usercase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUserCase _signUpUserCase;

  SignUpBloc(this._signUpUserCase) : super(SignUpInitial()) {
    on<InitialSignUpEvent>(_onInitialSignUpEvent);
    on<SignUpSentEvent>(_onSignUpSentEvent);
  }

  Future<void> _onInitialSignUpEvent(
      InitialSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpInitial());
  }

  Future<void> _onSignUpSentEvent(
      SignUpSentEvent event, Emitter<SignUpState> emit) async {
    emit(SingUpSentState());

    final resp = await _signUpUserCase(Params(SigUpEntity(
        event.fullName,
        event.pass,
        event.repass,
        event.email,
        PhoneEntity(event.code, event.number))));

    resp.fold(
          (l) {
        Utils().showException(message: l.message);
        emit(SingUpErrorState());
      },
          (r) => emit(SingUpSuccessState()),
    );
  }
}

