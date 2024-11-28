import 'package:equatable/equatable.dart';

class LogInResponseEntity extends Equatable {
  final int? id;
  //final DateTime? birthDate;
  final String? fullName;
  //final String userName;
  //final identity;
  //final int? genderId;
  //final String? gender;
  final String? email;
  final String? phoneCode;
  final String? phoneNumber;
  //final int? statusId;
  //final String? status;
  final String avatar;
  final String avatarMimeType;

  LogInResponseEntity(
      this.id,
      //this.birthDate,
      this.fullName,
      //this.userName,
      //this.identity,
      //this.genderId,
      //this.gender,
      this.email,
      this.phoneCode,
      this.phoneNumber,
      //this.statusId,
      //this.status,
      this.avatar,
      this.avatarMimeType);

  @override
  List<Object> get props => [];
}
