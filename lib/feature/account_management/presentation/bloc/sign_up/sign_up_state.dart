part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SingUpSentState extends SignUpState {}

class SingUpSuccessState extends SignUpState {}

class SingUpErrorState extends SignUpState {}

class WrongVerificationCodeState extends SignUpState {}

class CodeResendState extends SignUpState {}

class CodeResendWaitTime extends SignUpState {}
