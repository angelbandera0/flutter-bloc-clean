import 'package:equatable/equatable.dart';

class RequestVerificationCodeEntity extends Equatable {
  RequestVerificationCodeEntity(this.phoneNumber);
  final String phoneNumber;

  @override
  List<Object?> get props => [];
}
