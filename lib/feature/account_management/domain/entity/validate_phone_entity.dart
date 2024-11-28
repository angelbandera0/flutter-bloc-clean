import 'package:equatable/equatable.dart';

class ValidatePhoneEntity extends Equatable {
  ValidatePhoneEntity(this.email, this.code);

  final String email;
  final String code;

  @override
  List<Object?> get props => [];
}
