part of 'log_out_bloc.dart';

@immutable
abstract class LogOutState {}

class LogOutInitialState extends LogOutState {}

class LogOutSentState extends LogOutState {}

class LogOutSuccessState extends LogOutState {}

class LogOutErrorState extends LogOutState {}
