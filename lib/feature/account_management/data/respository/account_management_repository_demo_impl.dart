import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/global/entities/phone_entity.dart';
import '../../domain/entity/avatar_entity.dart';
import '../../domain/entity/avatar_response_entity.dart';
import '../../domain/entity/log_in_entity.dart';
import '../../domain/entity/recover_account_entity.dart';
import '../../domain/entity/recover_password_entity.dart';
import '../../domain/entity/refresh_validate_code_entity.dart';
import '../../domain/entity/request_verification_code_entity.dart';
import '../../domain/entity/sign_up_entity.dart';
import '../../domain/entity/update_profile_entity.dart';
import '../../domain/entity/validate_phone_entity.dart';
import '../../domain/entity/validate_requested_code_entity.dart';
import '../../domain/repository/account_management_repository.dart';

class AccountManagementRepositoryDemoImpl extends AccountManagementRepository {
  @override
  Future<Either<Failure, bool>> logIn(LogInEntity logInEntity) async {
    return Future.delayed(Duration(microseconds: 1000), () {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> singUp(SigUpEntity signUpEntity) async {
    return Future.delayed(Duration(microseconds: 1000), () {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> recoverAccount(
      RecoverAccountEntity email) async {
    return Future.delayed(Duration(microseconds: 1000), () {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> logInCredential() {
    return Future.delayed(Duration(microseconds: 1000), () {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> validatePhone(ValidatePhoneEntity entity) {
    return Future.delayed(Duration(microseconds: 1000), () {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> refreshValidateCode(
      RefreshValidateCodeEntity refreshValidateCodeEntity) {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }

  @override
  Future<Either<Failure, bool>> recoverPassword(
      RecoverPasswordEntity recoverPasswordEntity) {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }

  @override
  Future<Either<Failure, bool>> logOut() {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }

  @override
  Future<Either<Failure, bool>> updateProfile(
      UpdateProfileEntity updateProfileEntity) {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }

  @override
  Future<Either<Failure, bool>> requestVerificationCode(
      RequestVerificationCodeEntity requestVerificationCode) {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }

  @override
  Future<Either<Failure, AvatarResponseEntity>> uploadAvatar(
      AvatarEntity avatarEntity) {
    return Future.value(Right(AvatarResponseEntity(0, '', '', PhoneEntity('', ''), '', '')));
  }

  @override
  Future<Either<Failure, bool>> validateRequestedCode(
      ValidateRequestedCodeEntity codeEntity) {
    return Future.delayed(Duration(microseconds: 1000), () => Right(true));
  }
}
