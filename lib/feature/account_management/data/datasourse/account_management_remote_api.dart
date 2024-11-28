import 'dart:convert';

import '../../../../core/failure/exception.dart';
import '../../../../core/global/endpoints.dart';
import '../../../../core/platform/network_handler.dart';
import '../../domain/entity/avatar_entity.dart';
import '../../domain/entity/avatar_response_entity.dart';
import '../../domain/entity/log_in_entity.dart';
import '../../domain/entity/log_in_response_entity.dart';
import '../../domain/entity/log_out_response_entity.dart';
import '../../domain/entity/recover_account_entity.dart';
import '../../domain/entity/recover_account_response_entity.dart';
import '../../domain/entity/recover_password_entity.dart';
import '../../domain/entity/recover_password_response_entity.dart';
import '../../domain/entity/refresh_validate_code_entity.dart';
import '../../domain/entity/refresh_validate_code_response_entity.dart';
import '../../domain/entity/request_verification_code_entity.dart';
import '../../domain/entity/request_verification_code_response_entity.dart';
import '../../domain/entity/sign_up_entity.dart';
import '../../domain/entity/sign_up_response_entity.dart';
import '../../domain/entity/update_profile_entity.dart';
import '../../domain/entity/validate_phone_entity.dart';
import '../../domain/entity/validate_phone_response_entity.dart';
import '../../domain/entity/validate_requested_code_entity.dart';
import '../../domain/entity/validate_requested_code_response_entity.dart';
import '../model/log_in_response_model.dart';
import '../model/recover_account_response_model.dart';
import '../model/update_profile_response_model.dart';

abstract class AccountManagementRemoteApi {
  Future<LogInResponseEntity> logIn(LogInEntity logInEntity);
  Future<SignUpResponseEntity> signUp(SigUpEntity signUpEntity);
  Future<LogInResponseEntity> logInCredential();
  Future<ValidatePhoneResponseEntity> validatePhone(ValidatePhoneEntity entity);
  Future<RefreshValidateCodeResponseEntity> refreshValidateCode(
      RefreshValidateCodeEntity entity);
  Future<RecoverAccountResponseEntity> recoverAccount(
      RecoverAccountEntity recoverAccountEntity);
  Future<RecoverPasswordResponseEntity> recoverPassword(
      RecoverPasswordEntity recoverPasswordEntity);
  Future<LogOutResponseEntity> logOut();
  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileEntity updateProfileEntity);
  Future<RequestVerificationCodeResponseEntity> requestVerificationCode(
      RequestVerificationCodeEntity entity);
  Future<AvatarResponseEntity> uploadAvatar(AvatarEntity avatarEntity);
  Future<ValidateRequestedCodeResponseEntity> validateRequestedCode(
      ValidateRequestedCodeEntity codeEntity);
}

class AccountManagementRemoteApiImpl extends AccountManagementRemoteApi {
  final NetworkHandler networkHandler;

  AccountManagementRemoteApiImpl(this.networkHandler);

  @override
  Future<LogInResponseEntity> logIn(LogInEntity logInEntity) async {
    try {
      Map<String, String> body = {
        "email": logInEntity.email,
        "password": logInEntity.password
      };

      /*
      final resp = await networkHandler.post(
          body: jsonEncode(body), path: Endpoint.LOGIN);
          */

      final resp = await networkHandler.login(
          body: jsonEncode(body), url: Endpoint.LOGIN);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return LogInResponseModel.fromJson(jsonDecode(resp.body)["result"]);
      } else if (resp.statusCode == 404) {
        throw NotFoundException();
      } else if (resp.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<LogInResponseEntity> logInCredential() async {
    try {
      final resp = await networkHandler.get(path: Endpoint.PROFILE);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return LogInResponseModel.fromJson(jsonDecode(resp.body)["result"]);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<SignUpResponseEntity> signUp(SigUpEntity signUpEntity) async {
    try {
      Map<String, dynamic> body = {
        "fullname": signUpEntity.fullName,
        "password": signUpEntity.password,
        "confirmationPassword": signUpEntity.password,
        "email": signUpEntity.email,
        "phone": signUpEntity.phone.toJson(),
      };
      final resp = await networkHandler.post(
          body: jsonEncode(body), path: Endpoint.SIGNUP);
      if (resp.statusCode == 200 ||
          resp.statusCode == 204 ||
          resp.statusCode == 201) {
        return SignUpResponseEntity(true);
      } else {
        if (resp.statusCode == 500 &&
            jsonDecode(resp.body)["message"]
                .toString()
                .contains(signUpEntity.phone.code + signUpEntity.phone.number))
          throw TwilioException();
        else
          throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<ValidatePhoneResponseEntity> validatePhone(
      ValidatePhoneEntity entity) async {
    try {
      Map<String, String> body = {
        'email': entity.email,
        'twiliocode': entity.code
      };

      final resp = await networkHandler.post(
          path: Endpoint.VALIDATE_PHONE, body: jsonEncode(body));

      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return ValidatePhoneResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RequestVerificationCodeResponseEntity> requestVerificationCode(
      RequestVerificationCodeEntity entity) async {
    try {
      String body = entity.phoneNumber;

      final resp = await networkHandler.post(
          path: Endpoint.REQUEST_VERIFICATION_CODE, body: jsonEncode(body));

      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return RequestVerificationCodeResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RefreshValidateCodeResponseEntity> refreshValidateCode(
      RefreshValidateCodeEntity entity) async {
    try {
      String body = entity.email;

      final resp = await networkHandler.post(
          path: Endpoint.REFRESH_VALIDATE_CODES, body: jsonEncode(body));
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return RefreshValidateCodeResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RecoverAccountResponseEntity> recoverAccount(
      RecoverAccountEntity recoverAccountEntity) async {
    try {
      String body = recoverAccountEntity.email;

      final resp = await networkHandler.post(
          path: Endpoint.RECOVER_ACCOUNT, body: jsonEncode(body));
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return RecoverAccountResponseModel.fromJson(jsonDecode(resp.body));
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RecoverPasswordResponseEntity> recoverPassword(
      RecoverPasswordEntity recoverPasswordEntity) async {
    try {
      Map<String, String> body = {
        "NewPassword": recoverPasswordEntity.password,
        "ConfirmPassword": recoverPasswordEntity.confirmPassword,
        "TwilioCode": recoverPasswordEntity.code
      };

      final resp = await networkHandler.post(
          path: Endpoint.RESET_PASSWORD, body: jsonEncode(body));
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return RecoverPasswordResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<LogOutResponseEntity> logOut() async {
    try {
      final resp = await networkHandler.post(path: Endpoint.LOG_OUT);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return LogOutResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileEntity updateProfileEntity) async {
    try {
      Map<String, dynamic> body = {
        'fullname': updateProfileEntity.name ?? '',
        'email': updateProfileEntity.email ?? '',
        'phone': {
          'code': updateProfileEntity.country ?? '',
          'number': updateProfileEntity.number ?? ''
        }
      };

      final resp = await networkHandler.post(
          body: jsonEncode(body), path: Endpoint.UPDATE_PROFILE);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        var response = UpdateProfileResponseModel.fromJson(
            jsonDecode(resp.body)["result"]);

        return response;
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<AvatarResponseEntity> uploadAvatar(AvatarEntity avatarEntity) async {
    try {
      final resp = await networkHandler.multipart(
          path: Endpoint.UPLOAD_AVATAR,
          file: avatarEntity.avatar,
          fileLength: avatarEntity.fileLegth);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        var response =
            AvatarResponseEntity.fromJson(jsonDecode(resp.body)["result"]);
        return response;
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<ValidateRequestedCodeResponseEntity> validateRequestedCode(
      ValidateRequestedCodeEntity codeEntity) async {
    try {
      Map<String, dynamic> body = {
        'phoneNumber': codeEntity.phoneNumber,
        'code': codeEntity.code
      };

      final resp = await networkHandler.post(
          body: jsonEncode(body), path: Endpoint.VALIDATE_REQUESTED_CODE);
      if (resp.statusCode == 200 || resp.statusCode == 204) {
        return ValidateRequestedCodeResponseEntity(true);
      } else {
        throw ServerException(jsonDecode(resp.body)["message"]);
      }
    } catch (e) {
      throw e;
    }
  }
}
