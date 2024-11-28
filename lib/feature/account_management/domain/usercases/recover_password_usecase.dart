import 'package:equatable/equatable.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/recover_password_entity.dart';
import '../repository/account_management_repository.dart';

class RecoverPasswordUseCase extends UserCase<bool, Params> {
  RecoverPasswordUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.recoverPassword(params.recoverPasswordEntity);
  }
}

class Params extends Equatable {
  Params(this.recoverPasswordEntity);
  final RecoverPasswordEntity recoverPasswordEntity;

  @override
  List<Object?> get props => [];
}
