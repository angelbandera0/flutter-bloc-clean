import 'package:equatable/equatable.dart';

class LogInEntity extends Equatable {
  final String email;
  final String password;

  LogInEntity(this.email, this.password);

  @override
  List<Object> get props => [];
}
