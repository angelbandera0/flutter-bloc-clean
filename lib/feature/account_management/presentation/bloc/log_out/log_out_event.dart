part of 'log_out_bloc.dart';

@immutable
abstract class LogOutEvent {}

class LogOutInitialEvent extends LogOutEvent {}

class   LogOutSentEvent extends LogOutEvent {}
