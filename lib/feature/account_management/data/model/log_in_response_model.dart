
import '../../domain/entity/log_in_response_entity.dart';

class LogInResponseModel extends LogInResponseEntity {
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
  LogInResponseModel(
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
    this.avatarMimeType,
  ) : super(
            id,
            //birthDate,
            fullName,
            //userName,
            //identity,
            //genderId,
            //gender,
            email,
            phoneCode,
            phoneNumber,
            //statusId,
            //status,
            avatar,
            avatarMimeType);

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) {
    return LogInResponseModel(
        (json['id'] as num).toInt(),
        //DateTime.parse(json["birthDate"] as String),
        json['fullName'] as String?,
        //json["userName"] as String,
        //json["identity"] as String?,
        //(json["genderId"] as num).toInt(),
        //json["gender"] as String?,
        json['email'] as String?,
        json['phone']['code'] as String?,
        json['phone']['number'] as String?,
        //(json["statusId"] as num).toInt(),
        //json["status"] as String?,
        json['avatar'] != null ? json['avatar'] as String : "",
        json['avatarMimeType'] != null ? json['avatarMimeType'] as String : "");
  }
}
