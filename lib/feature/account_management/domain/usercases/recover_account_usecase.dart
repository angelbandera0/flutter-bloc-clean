import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/recover_account_entity.dart';
import '../repository/account_management_repository.dart';

class RecoverAccountUseCase implements UserCase<bool, Params> {
  final AccountManagementRepository _repository;

  RecoverAccountUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.recoverAccount(params.recoverAccountEntity);
  }
}

class Params extends Equatable {
  Params(this.recoverAccountEntity);
  final RecoverAccountEntity recoverAccountEntity;

  @override
  List<Object> get props => [];
}
