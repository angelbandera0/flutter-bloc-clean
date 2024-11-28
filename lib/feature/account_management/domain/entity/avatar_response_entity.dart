import 'package:equatable/equatable.dart' show Equatable;

import '../../../../core/global/entities/phone_entity.dart';

class AvatarResponseEntity extends Equatable {
  AvatarResponseEntity(
      this.id,
      //this.birthDate,
      this.fullName,
      //this.userName,
      //this.identity,
      //this.genderId,
      //this.gender,
      this.email,
      this.phone,
      //this.statusId,
      //this.status,
      this.avatar,
      this.avatarMimeType);

  final int? id;
  //final DateTime? birthDate;
  final String? fullName;
  //final String? userName;
  //final String? identity;
  //final int? genderId;
  //final String? gender;
  final String? email;
  final PhoneEntity? phone;
  //final int? statusId;
  //final String? status;
  final String avatar;
  final String avatarMimeType;

  factory AvatarResponseEntity.fromJson(Map<String, dynamic> json) {
    return AvatarResponseEntity(
      (json['id'] as num).toInt(),
      //DateTime.parse(json['birthDate'] as String),
      json['fullName'] as String?,
      //json['userName'] as String?,
      //json['identity'] as String?,
      //(json['genderId'] as num).toInt(),
      //json['gender'] as String?,
      json['email'] as String?,
      PhoneEntity.fromJson(json['phone'] as Map<String, dynamic>),
      //(json['statusId'] as num).toInt(),
      //json['status'] as String?,
      json['avatar'] as String,
      json['avatarMimeType'] as String,
    );
  }

  @override
  List<Object?> get props => [];
}
