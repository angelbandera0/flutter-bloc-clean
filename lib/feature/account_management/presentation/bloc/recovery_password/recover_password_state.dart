part of 'recover_password_bloc.dart';

@immutable
abstract class RecoverPasswordState {}

class RecoverPasswordInitialState extends RecoverPasswordState {}

class RecoverPasswordSentState extends RecoverPasswordState {}

class RecoverPasswordErrorState extends RecoverPasswordState {}

class RecoverPasswordSuccessState extends RecoverPasswordState {}
