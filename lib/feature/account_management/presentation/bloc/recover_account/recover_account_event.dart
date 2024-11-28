part of 'recover_account_bloc.dart';

@immutable
abstract class RecoverAccountEvent {}

class RecoverAccountInitialEvent extends RecoverAccountEvent {}

class RecoverAccountSentEvent extends RecoverAccountEvent {
  RecoverAccountSentEvent(this.email);
  final String email;
}
