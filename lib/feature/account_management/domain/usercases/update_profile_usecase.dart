import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/update_profile_entity.dart';
import '../repository/account_management_repository.dart';

class UpdateProfileUseCase implements UserCase<bool, Params> {
  UpdateProfileUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.updateProfile(params.updateProfileEntity);
  }
}

class Params extends Equatable {
  Params(this.updateProfileEntity);
  final UpdateProfileEntity updateProfileEntity;

  @override
  List<Object?> get props => [];
}
