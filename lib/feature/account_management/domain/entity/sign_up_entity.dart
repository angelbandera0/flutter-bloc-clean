import 'package:equatable/equatable.dart';

import '../../../../core/global/entities/phone_entity.dart';

class SigUpEntity extends Equatable {
  SigUpEntity(
    this.fullName,
    this.password,
    this.confirmationPassword,
    this.email,
    this.phone,
  );

  final String fullName;
  final String password;
  final String confirmationPassword;
  final String email;
  final PhoneEntity phone;

  @override
  List<Object> get props => [];
}
