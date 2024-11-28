part of 'recover_password_bloc.dart';

@immutable
abstract class RecoverPasswordEvent {}

class RecoveryPasswordInitialEvent extends RecoverPasswordEvent {}

class RecoverPasswordSentEvent extends RecoverPasswordEvent {
  RecoverPasswordSentEvent(this.code, this.password, this.confirmPassword);
  final String code;
  final String password;
  final String confirmPassword;
}
