part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class InitialSignUpEvent extends SignUpEvent {}

class SignUpSentEvent extends SignUpEvent {
  SignUpSentEvent(this.fullName, this.email, this.pass, this.repass, this.code,
      this.number);

  final String fullName;
  final String email;
  final String code;
  final String number;
  final String pass;
  final String repass;
}

/*

class VerificationCodeEvent extends SignUpEvent {
  VerificationCodeEvent(this.email, this.code);
  final String email;
  final String code;
}

class CodeResendEvent extends SignUpEvent {
  CodeResendEvent(this.email);
  final String email;
}
*/