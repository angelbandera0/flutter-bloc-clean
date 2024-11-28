import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/validate_requested_code_entity.dart';
import '../repository/account_management_repository.dart';

class ValidateRequestedCodeUseCase implements UserCase<bool, Params> {
  ValidateRequestedCodeUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.validateRequestedCode(params.requestedCodeEntity);
  }
}

class Params extends Equatable {
  Params(this.requestedCodeEntity);
  final ValidateRequestedCodeEntity requestedCodeEntity;
  @override
  List<Object?> get props => [];
}
