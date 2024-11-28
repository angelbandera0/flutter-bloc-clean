part of 'recover_account_bloc.dart';

@immutable
abstract class RecoverAccountState {}

class RecoverAccountInitialState extends RecoverAccountState {}

class RecoverAccountSentState extends RecoverAccountState {}

class RecoverAccountErrorState extends RecoverAccountState {}

class RecoverAccountSuccessState extends RecoverAccountState {}
