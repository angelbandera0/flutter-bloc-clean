
import '../../../feature/account_management/domain/entity/car_entity.dart';

abstract class UserProfile {
  DateTime? getBirthDate();
  void setBirthday(DateTime birthdate);
  String? getFullName();
  setFullName(String fullName);
  String? getIdentity();
  void setIdentity(String identity);
  int? getGendetId();
  void setGendetId(int gendetId);
  String? getGender();
  void setGender(String _gender);
  String? getEmail();
  void setEmail(String email);
  String? getPhoneCode();
  void setPhoneCode(String phoneCode);
  String? getPhoneNumber();
  void setphoneNumber(String phoneNumber);
  int? getStatusId();
  void setStatusId(int statusId);
  String? getStatus();
  void setStatus(String status);
  String? getAvatar();
  void setAvatar(String avatar);
  String? getAvatarMimeType();
  void setAvatarMimeType(String avatarMimeType);
  CarEntity? getActiveCar();
  void setActiveCar(CarEntity carEntity);

}

class UserProfileImpl extends UserProfile {
  static DateTime? _birthdate;
  static String? _fullName;
  static String? _identity;
  static int? _gendetId;
  static String? _gender;
  static String? _email;
  static String? _phoneCode;
  static String? _phoneNumber;
  static int? _statusId;
  static String? _status;
  static String? _avatar;
  static String? _avatarMimeType;
  static CarEntity? _carEntity;

  DateTime? getBirthDate() => _birthdate;
  void setBirthday(DateTime birthdate) {
    _birthdate = birthdate;
  }

  String? getFullName() => _fullName;
  void setFullName(String? fullName) {
    _fullName = fullName;
  }

  String? getIdentity() => _identity;
  void setIdentity(String identity) {
    _identity = identity;
  }

  int? getGendetId() => _gendetId;
  void setGendetId(int? gendetId) {
    _gendetId = gendetId;
  }

  String? getGender() => _gender;
  void setGender(String? _gender) {
    _gender = _gender;
  }

  String? getEmail() => _email;
  void setEmail(String? email) {
    _email = email;
  }

  String? getPhoneCode() => _phoneCode;
  void setPhoneCode(String? phoneCode) {
    _phoneCode = phoneCode;
  }

  String? getPhoneNumber() => _phoneNumber;
  void setphoneNumber(String? phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  int? getStatusId() => _statusId;
  void setStatusId(int? statusId) {
    _statusId = statusId;
  }

  String? getStatus() => _status;
  void setStatus(String? status) {
    _status = status;
  }

  String? getAvatar() => _avatar;
  void setAvatar(String avatar) {
    _avatar = avatar;
  }

  String? getAvatarMimeType() => _avatarMimeType;
  void setAvatarMimeType(String avatarMimeType) {
    _avatarMimeType = avatarMimeType;
  }

  CarEntity? getActiveCar() => _carEntity;
  void setActiveCar(CarEntity carEntity) {
    _carEntity = carEntity;
  }


}
