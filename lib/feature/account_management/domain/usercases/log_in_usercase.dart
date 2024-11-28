import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/log_in_entity.dart';
import '../repository/account_management_repository.dart';

class LogInUserCase implements UserCase<bool, Params> {
  final AccountManagementRepository repository;

  LogInUserCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.logIn(params.logInEntity);
  }
}

class Params extends Equatable {
  final LogInEntity logInEntity;

  Params(this.logInEntity);

  @override
  List<Object> get props => [];
}
