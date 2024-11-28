part of 'log_in_bloc.dart';

@immutable
abstract class LogInState {}

class LogInInitial extends LogInState {}

class LogInSentState extends LogInState {}

class LogInSuccessState extends LogInState {}

class LogInRememberState extends LogInState {}

class LogInFailState extends LogInState {}
