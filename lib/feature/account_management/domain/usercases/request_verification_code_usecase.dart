import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/request_verification_code_entity.dart';
import '../repository/account_management_repository.dart';

class RequestVerificationCodeUseCase implements UserCase<bool, Params> {
  RequestVerificationCodeUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.requestVerificationCode(params.entity);
  }
}

class Params extends Equatable {
  Params(this.entity);
  final RequestVerificationCodeEntity entity;

  @override
  List<Object?> get props => [];
}