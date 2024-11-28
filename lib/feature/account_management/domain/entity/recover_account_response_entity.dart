import 'package:equatable/equatable.dart';

class RecoverAccountResponseEntity extends Equatable {
  RecoverAccountResponseEntity(this.phoneNumber);
  final String? phoneNumber;

  @override
  List<Object?> get props => [];
}
