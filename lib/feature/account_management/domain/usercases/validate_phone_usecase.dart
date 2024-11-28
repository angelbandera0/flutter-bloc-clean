import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/validate_phone_entity.dart';
import '../repository/account_management_repository.dart';

class ValidatePhoneUseCase implements UserCase<bool, Params> {
  ValidatePhoneUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.validatePhone(params.entity);
  }
}

class Params extends Equatable {
  Params(this.entity);
  final ValidatePhoneEntity entity;

  @override
  List<Object?> get props => [];
}
