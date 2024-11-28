import 'package:equatable/equatable.dart';

class ValidateRequestedCodeEntity extends Equatable {
  ValidateRequestedCodeEntity(this.phoneNumber, this.code);
  final String phoneNumber;
  final String code;

  @override
  List<Object?> get props => [];
}
