part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

class LogInRememberEvent extends LogInEvent {}

class LogInSendEvent extends LogInEvent {
  final String email;
  final String pass;
  final bool remember;

  LogInSendEvent(this.email, this.pass, this.remember);
}
