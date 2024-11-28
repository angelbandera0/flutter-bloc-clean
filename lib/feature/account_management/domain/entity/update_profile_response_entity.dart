import 'package:equatable/equatable.dart';

import '../../../../core/global/entities/phone_entity.dart';

class UpdateProfileResponseEntity extends Equatable {
  UpdateProfileResponseEntity(
      this.id,
      this.birthDate,
      this.fullName,
      this.userName,
      this.identity,
      this.genderId,
      this.gender,
      this.email,
      this.phone,
      this.statusId,
      this.status,
      this.avatar,
      this.avatarMimeType);

  final int id;
  final DateTime birthDate;
  final String fullName;
  final String userName;
  final String identity;
  final int genderId;
  final String gender;
  final String email;
  final PhoneEntity phone;
  final int statusId;
  final String status;
  final String avatar;
  final String avatarMimeType;

  @override
  List<Object?> get props => [];
}
