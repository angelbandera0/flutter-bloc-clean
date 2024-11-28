import 'package:dartz/dartz.dart';

import '../../../../core/failure/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/global/data/user_profile.dart';
import '../../../../core/platform/connectivity.dart';
import '../../../../core/platform/shared_prefs.dart';
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
import '../datasourse/account_management_remote_api.dart';

class AccountManagementRepositoryImpl extends AccountManagementRepository {
  final AccountManagementRemoteApi _api;
  final SharedPreferencesManager sharedPreferencesManager;
  final ConnectivityService connectivityService;
  final UserProfile _userProfile;

  AccountManagementRepositoryImpl(this._api, this.sharedPreferencesManager,
      this.connectivityService, this._userProfile);

  @override
  Future<Either<Failure, bool>> logIn(LogInEntity logInEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      final res = await _api.logIn(logInEntity);
      _userProfile.setFullName(res.fullName!);
      _userProfile.setEmail(res.email!);
      _userProfile.setPhoneCode(res.phoneCode!);
      _userProfile.setphoneNumber(res.phoneNumber!);

      _userProfile.setAvatar(res.avatar);
      _userProfile.setAvatarMimeType(res.avatarMimeType);

      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else if (ex is NotFoundException) {
        return Left(NotFoundLoginFailure());
      } else if (ex is UnauthorizedException) {
        return Left(UnauthorizedLoginFailure());
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> logInCredential() async {
    try {
      /*if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }*/

      final res = await _api.logInCredential();
      sharedPreferencesManager.setRememberMe(true);
      _userProfile.setFullName(res.fullName!);
      _userProfile.setEmail(res.email!);
      _userProfile.setPhoneCode(res.phoneCode!);
      _userProfile.setphoneNumber(res.phoneNumber!);

      _userProfile.setAvatar(res.avatar);
      _userProfile.setAvatarMimeType(res.avatarMimeType);

      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else if (ex is NotFoundException) {
        return Left(NotFoundLoginFailure());
      } else if (ex is UnauthorizedException) {
        return Left(UnauthorizedLoginFailure());
      } else {
        return Left(OtherFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> singUp(SigUpEntity signUpEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.signUp(signUpEntity);
      return Right(true);
    } catch (ex) {
      if (ex is TwilioException) {
        return Left(TwilioFailure());
      } else if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> recoverAccount(
      RecoverAccountEntity recoverAccountEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      final resp = await _api.recoverAccount(recoverAccountEntity);
      _userProfile.setphoneNumber(resp.phoneNumber!);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> validatePhone(
      ValidatePhoneEntity validatePhoneEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.validatePhone(validatePhoneEntity);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> requestVerificationCode(
      RequestVerificationCodeEntity requestVerificationCode) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.requestVerificationCode(requestVerificationCode);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> refreshValidateCode(
      RefreshValidateCodeEntity refreshValidateCodeEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.refreshValidateCode(refreshValidateCodeEntity);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> recoverPassword(
      RecoverPasswordEntity recoverPasswordEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.recoverPassword(recoverPasswordEntity);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> logOut() async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.logOut();
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> updateProfile(
      UpdateProfileEntity updateProfileEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      final resp = await _api.updateProfile(updateProfileEntity);

      _userProfile.setFullName(resp.fullName);
      _userProfile.setEmail(resp.email);
      _userProfile.setphoneNumber(resp.phone.number);
      _userProfile.setPhoneCode(resp.phone.code);

      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, AvatarResponseEntity>> uploadAvatar(
      AvatarEntity avatarEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      var resp = await _api.uploadAvatar(avatarEntity);
      return Right(resp);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }

  Future<Either<Failure, bool>> validateRequestedCode(
      ValidateRequestedCodeEntity codeEntity) async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      await _api.validateRequestedCode(codeEntity);
      return Right(true);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }
}
