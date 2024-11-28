import 'package:equatable/equatable.dart';

class RecoverPasswordEntity extends Equatable {
  RecoverPasswordEntity(this.code, this.password, this.confirmPassword);
  final String code;
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [];
}
